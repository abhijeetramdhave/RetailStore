package com.retailstore.core

class Person extends Party {

    String firstName
    String lastName

    static constraints = {
        lastName nullable: true
    }

}
