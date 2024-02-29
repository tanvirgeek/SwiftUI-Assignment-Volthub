//
//  CreateAccountView.swift
//  Volthub
//
//  Created by Tanvir Alam on 28/2/24.
//

import SwiftUI

struct CreateAccountView: View {
    @Binding var path: [AuthView]
    @StateObject private var viewModel = CreateAccountViewModel()
    
    var body: some View {
        NavigationStack(path: $path) {
            VStack(spacing: 16) {
                Image("logo")
                Spacer()
                Text("Create An Account")
                    .bold()
                    .font(AppFonts.font(for: .title2))
                    .foregroundColor(AppColors.darkGray)
                Text("We’ll send you a verification code")
                    .font(AppFonts.font(for: .body2))
                    .foregroundColor(AppColors.darkGray)
                TextField("Phone Number", text: $viewModel.phoneNumber)
                    .padding()
                    .overlay {
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(lineWidth: 1.0)
                            .foregroundColor(AppColors.darkGray.opacity(0.4))
                    }
                AppButton(buttonTitle: "Next") {
                    path.append(.verification)
                }
                Text("You agree to our Terms & Conditions by signing in")
                    .font(AppFonts.font(for: .small))
                    .foregroundColor(AppColors.darkGray)
                
                login
                Spacer()
            }
            .padding(AppSettings.paddingInPhone)
            .navigationDestination(for: AuthView.self) { route in
                if route == .verification {
                    VerificationView(viewModel: viewModel, navigationPath: $path)
                }
            }

        }
    }
    
    private var login: some View {
        NavigationLink {
            LoginView(navigationPath: $path)
        } label: {
            Text("Have an account? ")
                .font(AppFonts.font(for: .body2))
                .foregroundColor(AppColors.darkGray) +
            Text("Log In")
                .bold()
                .font(AppFonts.font(for: .body2))
                .foregroundColor(AppColors.accent)
        }
    }
}

enum AuthView {
    case verification
}

#Preview {
    @State var path: [AuthView] = []
    return CreateAccountView(path: $path)
}
