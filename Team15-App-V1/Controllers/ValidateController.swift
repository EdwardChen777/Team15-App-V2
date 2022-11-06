//
//  ValidateController.swift
//  Team15-App-V1
//
//  Created by Edward Chen on 11/5/22.
//

import Foundation

class ValidateController{

//  func validateFields() -> String? {
//    if usernameTextField.text?.trimmingCharacters(in: .whitespaceAndNewline) == "" ||
//        emailTextField.text?.trimmingCharacters(in: .whitespaceAndNewline) == "" ||
//        passwordTextField.text?.trimmingCharacters(in: .whitespaceAndNewline) == "" {
//      return "Please fill in the fields"
//    }
//    let cleanedPassword = passwordTextField.text!.trimmingCharacters(in: .whitespaceAndNewline)
//    if isPasswordValid(cleanedPassword) == false {
//      return "Password needs to be at least 8 characters, contains a special character and number."
//    }
//    
//    return nil
//  }
  func isEmailValid(_ email : String) -> Bool {
    let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+.[A-Za-z]{2,64}"
    let trimmedString = email.trimmingCharacters(in: .whitespaces)
    let validateEmail = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
    let isValidateEmail = validateEmail.evaluate(with: trimmedString)
    return isValidateEmail
  }
  
  func isPasswordValid(_ password : String) -> Bool {
//    let cleanedPassword = password.trimmingCharacters(in: .whitespaceAndNewline)
    let cleanedPassword = password
    let regex = NSPredicate(format: "SELF MATCHES %@","^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}")
    return regex.evaluate(with: cleanedPassword)
  }
  
  func validSignUp(_ email : String, password : String) -> Bool{
    if isEmailValid(email) && isPasswordValid(password) {
      return true
    } else {
      return false
    }
  }
  
}
