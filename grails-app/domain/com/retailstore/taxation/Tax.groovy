package com.retailstore.taxation

class Tax {

    String name
    Date fromDate
    Date toDate

    static constraints = {
        toDate nullable: true
    }
}
