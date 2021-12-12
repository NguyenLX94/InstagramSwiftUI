//
//  EntryField.swift
//  InstagramSwiftUI
//
//  Created by Nguyen  on 12/12/2021.
//

import SwiftUI

struct EntryField: View {
//    var sfSybolName: String
    var placeHolder: String
    var prompt: String
    @Binding var fielf: String
    var isSecure = false
    var body: some View {
        HStack{
//            Image(sfSybolName)
//                .foregroundColor(.gray)
//                .font(.headline)
//                .frame(width: 20)
            if isSecure{
                SecureField(placeHolder, text: $fielf)
            
            }else{
                TextField(placeHolder, text: $fielf)
            }
        }
        .frame(height: 50)
        .autocapitalization(.none)
        .padding(8)
        .background(Color(#colorLiteral(red: 124/255, green: 115/255, blue: 238/255, alpha: 1)))
        .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 1))
        Text(prompt)
            .fixedSize(horizontal: false, vertical: true)
            .font(.caption)
    }
}

struct EntryField_Previews: PreviewProvider {
    static var previews: some View {
        EntryField(placeHolder: "Email Address", prompt: "Enter a valid email address", fielf: .constant(""))
    }
}
