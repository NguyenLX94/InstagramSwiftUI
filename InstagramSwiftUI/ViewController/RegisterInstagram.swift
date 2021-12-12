//
//  RegisterInstagram.swift
//  InstagramSwiftUI
//
//  Created by Nguyen  on 09/12/2021.
//

import SwiftUI

struct RegisterInstagram: View {
    @StateObject private var register = LoginRegisterViewModel()
    var body: some View {
        ZStack{
                LinearGradient(gradient: Gradient(colors: [.purple, .blue]), startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)
                    
                VStack{
                    Image("plus_photo")
                        .renderingMode(.template)
                        .foregroundColor(.white)
                        .padding()
                    Group{
                        VStack(){
                            EntryField(placeHolder: "Email", prompt: "", fielf: $register.EmailL, isSecure: false)
                                .background(Color.gray)
                            EntryField(placeHolder: "Password", prompt: "", fielf: $register.Password, isSecure: true)
                            EntryField(placeHolder: "Full Name", prompt: "", fielf: $register.fullName, isSecure: false)
                            EntryField(placeHolder: "User Name", prompt: "", fielf: $register.userName, isSecure: false)
                            Button(action: {print("sign in")}) {
                                LoginButtonContena()
                            }
                        }
                    }
                    .padding()
                    HStack{
                        Text("Already have an Account?")
                            .foregroundColor(.white)
                        NavigationLink(destination: LoginInstagram()) {
                            Text("SIGN IN")
                                .foregroundColor(.white)
                                .bold()
                        }
                    }.frame(maxHeight:.infinity, alignment: .bottom)
                    .padding()
                    Spacer()
                }
            }
        
    }
}

struct RegisterInstagram_Previews: PreviewProvider {
    static var previews: some View {
        RegisterInstagram()
    }
}

struct SignInButtonContena: View {
    var body: some View {
        Text("Sign In")
            .font(.headline)
            .foregroundColor(.white)
    }
}

struct LoginButtonContena: View {
    var body: some View {
        Text("Sign Up")
            .padding()
            .frame(height: 60)
            .frame(maxWidth: .infinity,alignment: .center)
            .font(.system(size: 25, weight: .bold, design: .default))
            //.font(.headline)
            .foregroundColor(.white).background(Color(#colorLiteral(red: 94/255, green: 105/255, blue: 238/255, alpha: 1))) .background(Color.purple)
            
    }
}
