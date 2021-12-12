//
//  TextfieldExtension.swift
//  InstagramSwiftUI
//
//  Created by Nguyen  on 12/12/2021.
//

import Foundation
import UIKit
import Combine

class LoginRegisterViewModel: ObservableObject{
    @Published var EmailL = ""
    @Published var Password = ""
    @Published var fullName = ""
    @Published var userName = ""
    
    @Published var isCheckEmaiValid = false
    @Published var isCheckPasswordValid = false
    @Published var ischeckUserNameValid = false
    @Published var isCheckFullNameValid = false
    
    @Published var canSubmit = false
    private var cancellableset: Set<AnyCancellable> = []
    
    let emailPredicate = NSPredicate(format: "SELF MATCHES %@", "(?:[\\p{L}0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[\\p{L}0-9!#$%\\&'*+/=?\\^_`{|}" + "~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\" + "x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[\\p{L}0-9](?:[a-" + "z0-9-]*[\\p{L}0-9])?\\.)+[\\p{L}0-9](?:[\\p{L}0-9-]*[\\p{L}0-9])?|\\[(?:(?:25[0-5" + "]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-" + "9][0-9]?|[\\p{L}0-9-]*[\\p{L}0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21" + "-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])")
    let passPredicate = NSPredicate(format:"SELF MATCHES %@", "^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,10}$")
    
    init(){
        $EmailL
            .map { email in
                return self.emailPredicate.evaluate(with: email)
            }
            .assign(to: \.isCheckEmaiValid, on:  self)
            .store(in: &cancellableset)
        $Password
            .map { password in
                return self.passPredicate.evaluate(with: password)
            }
            .assign(to:  \.isCheckPasswordValid, on:  self)
            .store(in: &cancellableset)
        
        Publishers.CombineLatest($isCheckEmaiValid, $isCheckPasswordValid)
            .map { isCheckEmaiValidm , isCheckPasswordValid in
                return (isCheckPasswordValid && self.isCheckEmaiValid)
            }
            .assign(to: \.canSubmit, on: self)
            .store(in: &cancellableset)
    }
    
    var emailPrompt: String{
        isCheckEmaiValid ?
        ""
        :
        "Email a valid email address"
        
    }
    
    var PasswordPrompt: String{
        isCheckPasswordValid ?
        ""
        :
        "Password a valid "
        
    }
    
    func login(){
        EmailL = ""
        Password = ""
    }
}
