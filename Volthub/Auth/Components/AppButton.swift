//
//  AppButton.swift
//  Volthub
//
//  Created by Tanvir Alam on 28/2/24.
//

import SwiftUI

struct AppButton: View {
    let buttonTitle: String
    let onTap: ()->Void
    
    var body: some View {
        Button(action: {
            onTap()
        }, label: {
            buttonLabel
        })
    }
    
    private var buttonLabel: some View {
        Text(buttonTitle)
            .bold()
            .foregroundColor(AppColors.brand)
            .padding()
            .font(AppFonts.font(for: .body2))
            .frame(maxWidth: .infinity)
            .background(AppColors.themeColor)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            
    }
}

#Preview {
    func onTap() {}
    return AppButton(buttonTitle: "Submit", onTap: onTap)
}
