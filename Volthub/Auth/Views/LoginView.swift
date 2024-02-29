//
//  LoginView.swift
//  Volthub
//
//  Created by Tanvir Alam on 29/2/24.
//

import SwiftUI

struct LoginView: View {
    @StateObject private var viewModel = LoginViewModel()
    @Binding var navigationPath: [AuthView]
    
    var body: some View {
        VStack(spacing: 16) {
            Image("logo")
            Spacer()
            Text("Welcome Back")
                .bold()
                .font(AppFonts.font(for: .title2))
                .foregroundColor(AppColors.darkGray)
            Text("It's great to have you back")
                .font(AppFonts.font(for: .body2))
                .foregroundColor(AppColors.darkGray)
            TextField("Phone Number", text: $viewModel.phoneNumber)
                .padding()
                .overlay {
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(lineWidth: 1.0)
                        .foregroundColor(AppColors.darkGray.opacity(0.4))
                }
            SecureInputView("Password", text: $viewModel.password)
            
            AppButton(buttonTitle: "Login") {
                
            }
            
            NavigationLink {
                ForgotPasswordView(viewModel: viewModel, navigationPath: $navigationPath)
            } label: {
                Text("Forgot password?")
                    .foregroundColor(AppColors.darkGray)
                    .font(AppFonts.font(for: .body2))
            }

            createAccount
            
            Spacer()
        }
        .padding(AppSettings.paddingInPhone)
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
    
    private var createAccount: some View {
        NavigationLink {
            CreateAccountView(path: $navigationPath)
        } label: {
            Text("Don't have an account? ")
                .font(AppFonts.font(for: .body2))
                .foregroundColor(AppColors.darkGray) +
            Text("Create account")
                .bold()
                .font(AppFonts.font(for: .body2))
                .foregroundColor(AppColors.accent)
        }
    }
}

#Preview {
    @State var path: [AuthView] = []
    return LoginView(navigationPath: $path)
}
