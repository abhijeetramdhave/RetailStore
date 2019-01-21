package com.retailstore.util

class ExceptionUtil {

    public static def errorObject(Exception ex, def response = null) {
        return errorObject(500, ex, response)
    }

    public static def errorObject(int errorCode, Exception ex, def response = null) {
        return errorObject(errorCode, ex.message, response)
    }

    public static def errorObject(String message, def response = null) {
        return errorObject(500, message, response)
    }

    public static def errorObject(int errorCode, String message, def response = null) {
        if(response) {
            response.status = 500
        }
        return [
                code: errorCode,
                status: 'failed',
                message: message
        ]
    }

}