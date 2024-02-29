//
//  LoginViewModel.swift
//  Volthub
//
//  Created by Tanvir Alam on 29/2/24.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var phoneNumber = ""
    @Published var password = ""
    @Published var phoneNumberForForgotPassword = ""
}
