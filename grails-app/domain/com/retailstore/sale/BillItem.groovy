package com.retailstore.sale

import com.retailstore.product.Product

class BillItem {

    static belongsTo = [bill: Bill]

    Product product
    Integer quantity
    BigDecimal price
    BigDecimal amount

    static hasMany = [taxes: TaxLevied]

    static constraints = {
    }
}
