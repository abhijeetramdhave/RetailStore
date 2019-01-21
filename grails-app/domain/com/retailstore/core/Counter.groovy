package com.retailstore.core

class Counter {

    static belongsTo = [store: RetailStore]
    String code
    String name
    Person attendant

    static constraints = {
        attendant nullable: true
    }
}
