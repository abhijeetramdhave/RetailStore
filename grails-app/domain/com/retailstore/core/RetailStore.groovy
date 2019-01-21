package com.retailstore.core

class RetailStore extends Party {

    String name
    String pan
    String gstin

    static constraints = {
        gstin nullable: true
    }
}
