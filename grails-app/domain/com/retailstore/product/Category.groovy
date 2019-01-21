package com.retailstore.product

class Category {

    String name
    Category parent

    static constraints = {
        parent nullable: true
    }
}
