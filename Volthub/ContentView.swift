//
//  ContentView.swift
//  Volthub
//
//  Created by Tanvir Alam on 28/2/24.
//

import SwiftUI

struct ContentView: View {
    @State private var path: [AuthView] = []
    var body: some View {
        CreateAccountView(path: $path)
    }
}

#Preview {
    ContentView()
}
