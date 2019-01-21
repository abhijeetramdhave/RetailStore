package com.retailstore.sale

import com.retailstore.core.Counter
import com.retailstore.core.Customer
import com.retailstore.core.RetailStore
import com.retailstore.product.Product
import com.retailstore.taxation.CategoryToTax
import com.retailstore.taxation.ProductCategory
import com.retailstore.taxation.TaxCategory
import grails.transaction.Transactional

import java.math.RoundingMode

@Transactional
class CounterService {

    def generateBill(Customer customer, Map<Product, Integer> products) {
        Bill bill = new Bill(
                billDate: new Date(),
                billNumber: generateBillNumber(),
                customer: customer,
                store: RetailStore.findById(1L),
                counter: Counter.findByCode("ONLINE"),
                items: []
        )

        def netAmount = 0.0
        def tax = 0.0
        products.each { product, quantity ->
            BillItem item = new BillItem(
                    product: product,
                    price: product.price,
                    quantity: quantity,
                    amount: product.price * quantity,
                    bill: bill,
                    taxes: []
            )
            netAmount += item.amount
            bill.items << item

            TaxCategory category = ProductCategory.findByProduct(product).category
            def taxes = CategoryToTax.findAllByCategory(category)
            taxes.each { categoryToTax ->
                TaxLevied taxLevied = new TaxLevied(
                        billItem: item,
                        tax: categoryToTax.tax,
                        percentValue: categoryToTax.percentValue,
                        amount: (item.amount * categoryToTax.percentValue / 100.0).setScale(2, RoundingMode.UP)
                )
                item.taxes << taxLevied
                tax += taxLevied.amount
            }
        }

        bill.netAmount = netAmount
        bill.tax = tax
        bill.totalAmount = netAmount + tax

        bill.save(flush: true)
        return bill;
    }

    private String generateBillNumber() {
        return "" + System.currentTimeMillis()
    }
}
