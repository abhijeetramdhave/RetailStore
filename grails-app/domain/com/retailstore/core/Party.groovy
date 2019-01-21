package com.retailstore.core

class Party {

    String mobileNumber
    String emailAddress
    Address address

    static constraints = {
        emailAddress nullable: true
        address nullable: true
    }
}
