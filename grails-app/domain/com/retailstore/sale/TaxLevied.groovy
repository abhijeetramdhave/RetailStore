package com.retailstore.sale

import com.retailstore.taxation.Tax

class TaxLevied {

    static belongsTo = [billItem: BillItem]
    Tax tax
    BigDecimal percentValue
    BigDecimal amount

    static constraints = {
    }
}
