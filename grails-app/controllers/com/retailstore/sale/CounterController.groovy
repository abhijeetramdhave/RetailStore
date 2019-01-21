package com.retailstore.sale

import com.retailstore.core.Customer
import com.retailstore.product.Product
import com.retailstore.taxation.Tax
import com.retailstore.util.ExceptionUtil
import grails.converters.JSON

import java.text.DateFormat
import java.text.SimpleDateFormat

class CounterController {

    CounterService counterService

    def generateBill() {
        try {
            Customer customer = Customer.findByMobileNumber(request.JSON.mobileNumber)
            Map<Product, Integer> products = new HashMap<Product, Integer>()
            request.JSON.products.each { it ->
                Product product = Product.findByProductCode(it.code)
                products.put(product, it.quantity)
            }

            Bill bill = counterService.generateBill(customer, products)

            render getPrintableBill(bill) as JSON

        } catch(Exception ex) {
            log.info(ex.message)
            log.info(ex.getStackTrace())
            ex.printStackTrace()
            render ExceptionUtil.errorObject(ex) as JSON
        }

    }

    private def getPrintableBill(Bill bill) {
        DateFormat formatter = new SimpleDateFormat("dd/MM/yyyy hh:mm a")
        def result = [
                retailStore: [
                        name: bill.store.name,
                        address: [
                                addressLine1: bill.store.address.addressLine1,
                                addressLine2: bill.store.address.addressLine2,
                                addressLine3: bill.store.address.addressLine3,
                                city: bill.store.address.city,
                                state: bill.store.address.state,
                                country: bill.store.address.country,
                                zipCode: bill.store.address.zipCode
                        ],
                        pan: bill.store.pan,
                        gstin: bill.store.gstin
                ],
                billNumber: bill.billNumber,
                billDate: formatter.format(bill.billDate),
                counter: bill.counter.name,
                customer: [
                        name: bill.customer?.name,
                        mobileNumber: bill.customer?.mobileNumber
                ],
                netAmount: bill.netAmount,
                tax: bill.tax,
                totalAmount: bill.totalAmount,
                items: [],
                taxes: []
        ]

        bill.items.each { billItem ->
            result.items << [
                    productCode: billItem.product.productCode,
                    description: billItem.product.description,
                    price: billItem.product.price,
                    quantity: billItem.quantity,
                    amount: billItem.amount
            ]
        }

        Map<Tax, BigDecimal> taxes = new HashMap<Tax, BigDecimal>()
        bill.items.each { billItem ->
            billItem.taxes.each { taxLevied ->
                taxes.put(taxLevied.tax, taxes.get(taxLevied.tax) ? taxes.get(taxLevied.tax) + taxLevied.amount : taxLevied.amount)
            }
        }

        taxes.each { tax, amount ->
            result.taxes << [
                    name: tax.name,
                    amount: amount
            ]
        }

        return result
    }
}
