//
//  ForgotPasswordView.swift
//  Volthub
//
//  Created by Tanvir Alam on 29/2/24.
//

import SwiftUI

struct ForgotPasswordView: View {
    @StateObject var viewModel: LoginViewModel
    @Binding var navigationPath: [AuthView]
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(spacing: 16) {
            topBar
            Spacer()
            Image("forgotPassword")
            Text("Forgot Password")
                .bold()
                .font(AppFonts.font(for: .title))
            Text("Please enter your phone number so we can send a verify code to reset your password")
                .font(AppFonts.font(for: .body2))
                .foregroundColor(AppColors.darkGray)
                .multilineTextAlignment(.center)
            
            TextField("Enter your phone number", text: $viewModel.phoneNumberForForgotPassword)
                .padding()
                .overlay {
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(lineWidth: 1.0)
                        .foregroundColor(AppColors.darkGray.opacity(0.4))
                }
            
            AppButton(buttonTitle: "Submit") {
                
            }
            Spacer()
            Spacer()
        }
        .padding(AppSettings.paddingInPhone)
        .navigationTitle("")
        .navigationBarBackButtonHidden()
        .navigationBarHidden(true)
    }
    
    private var topBar: some View {
        HStack {
            Image(systemName: "arrow.left")
                .font(AppFonts.font(for: .title2))
                .padding()
                .onTapGesture {
                    dismiss()
                }
            Spacer()
        }
    }
}

#Preview {
    @State var path: [AuthView] = []
    return ForgotPasswordView(viewModel: LoginViewModel(), navigationPath: $path)
}
