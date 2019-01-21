package com.retailstore.core

class Address {

    String addressLine1
    String addressLine2
    String addressLine3
    String city
    String state
    String country
    String zipCode

    static constraints = {
        addressLine2 nullable: true
        addressLine3 nullable: true
    }
}
