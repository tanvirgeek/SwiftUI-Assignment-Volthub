//
//  OTPTextField.swift
//  Volthub
//
//  Created by Tanvir Alam on 28/2/24.
//

import SwiftUI

struct OTPTextField: View {
    let numberOfFields: Int
    @Binding var enteredValue: [String]
    @FocusState private var fieldFocus: Int?
    @State private var oldValue = ""
    
    init(numberOfFields: Int, enteredValue: Binding<[String]>) {
        self.numberOfFields = numberOfFields
        self._enteredValue = enteredValue
    }
    
    var body: some View {
        HStack {
            ForEach(0..<numberOfFields, id: \.self) { index in
                TextField("", text: $enteredValue[index], onEditingChanged: { editing in
                    if editing {
                        oldValue = enteredValue[index]
                    }
                })
                    .keyboardType(.numberPad)
                    .frame(width: 40, height: 40)
                    .multilineTextAlignment(.center)
                    .focused($fieldFocus, equals: index)
                    .tag(index)
                    .overlay {
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(lineWidth: 1)
                    }
                    .onChange(of: enteredValue[index]) { newvalue in
                        if enteredValue[index].count > 1 {
                            let currentValue = Array(enteredValue[index])
                            if currentValue[0] == Character(oldValue){
                                enteredValue[index] = String(enteredValue[index].suffix(1))
                            }else {
                                enteredValue[index] = String(enteredValue[index].prefix(1))
                            }
                            
                        }
                        
                        if !newvalue.isEmpty {
                            if index == numberOfFields - 1 {
                                fieldFocus = nil
                            } else {
                                fieldFocus = (fieldFocus ?? 0) + 1
                            }
                        }
                    }
            }
        }
    }
}

//#Preview {
//    OTPTextField(numberOfFields: 6, enteredValue: ["1","1","1","1","1","2"])
//}
