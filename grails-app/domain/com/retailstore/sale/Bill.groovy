package com.retailstore.sale

import com.retailstore.core.Counter
import com.retailstore.core.Customer
import com.retailstore.core.RetailStore

class Bill {

    String billNumber
    Date billDate

    Customer customer
    RetailStore store
    Counter counter

    BigDecimal netAmount
    BigDecimal tax
    BigDecimal totalAmount

    static hasMany = [items: BillItem]

    static constraints = {

    }
}
