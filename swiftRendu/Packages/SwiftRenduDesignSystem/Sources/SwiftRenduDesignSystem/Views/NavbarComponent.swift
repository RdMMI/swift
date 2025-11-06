//
//  Navbar.swift
//  SwiftCours
//
//  Created by DAGUET Romain on 04/11/2025.
//
import SwiftUI

public struct NavbarComponent: View {
    
    @State private var textInput: String
    @FocusState private var focus: FormFieldFocus?
    
    public init(initialText: String = "") {
        _textInput = State(initialValue: initialText)
    }
    
    public var body: some View {
        VStack {
            TextField("Ville", text: $textInput)
                .textFieldStyle(.roundedBorder)
                .padding()
                .onSubmit {
                    print(textInput)
                    focus = nil
                }
                .focused($focus, equals: .ville)
        }
//        Spacer()
        .onAppear {
            focus = .ville
        }
    }
}

private enum FormFieldFocus: Hashable {
    case ville
}

#Preview {
    NavbarComponent(initialText: "coucou")
}
