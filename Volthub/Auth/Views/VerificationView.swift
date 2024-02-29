//
//  VerificationView.swift
//  Volthub
//
//  Created by Tanvir Alam on 28/2/24.
//

import SwiftUI

struct VerificationView: View {
    @StateObject var viewModel: CreateAccountViewModel
    @Binding var navigationPath: [AuthView]
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack(spacing: 16) {
            topBar
            Spacer()
            Image("verification")
            Text("Verification")
                .bold()
                .font(AppFonts.font(for: .title))
            VStack(spacing: 5) {
                Text("Please enter the verification code sent to")
                    .font(AppFonts.font(for: .body2))
                Text("+1 345 345 556")
                    .bold()
                    .font(AppFonts.font(for: .body2))
            }
            
            OTPTextField(numberOfFields: 6, enteredValue: $viewModel.otp)
            
            AppButton(buttonTitle: "Next") {}
        
            Text("Didn’t receive any code?")
                .font(AppFonts.font(for: .body2))
            
            Text("Resend in 29s")
                .font(AppFonts.font(for: .body2))
                .bold()
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
                    navigationPath = []
                    dismiss()
                }
            Spacer()
        }
    }
}

#Preview {
    @State var path: [AuthView] = []
    return VerificationView(viewModel: CreateAccountViewModel(), navigationPath: $path)
}
