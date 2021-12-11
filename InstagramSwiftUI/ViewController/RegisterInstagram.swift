//
//  RegisterInstagram.swift
//  InstagramSwiftUI
//
//  Created by Nguyen  on 09/12/2021.
//

import SwiftUI

struct RegisterInstagram: View {
    @State var email: String = ""
    @State var password: String = ""
    @State var fullName: String = ""
    @State var userName: String = ""
    var body: some View {
//        NavigationView{
            ZStack{
                LinearGradient(gradient: Gradient(colors: [.purple, .blue]), startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)
                VStack{
                    Image("plus_photo")
                        .renderingMode(.template)
                        .foregroundColor(.white)
                        .padding()
                    Group{
                        VStack( spacing: 20){
                            TextField("Email", text: $email)
                                .frame( height: 30, alignment: .center)
                                .padding()
                                .background(Color(#colorLiteral(red: 124/255, green: 115/255, blue: 238/255, alpha: 1)))
                                .accentColor(.white)
                                .cornerRadius(10.0)
                                .font(.system(size: 20, weight: .regular, design: .default))
                                .foregroundColor(.white)
                                .disableAutocorrection(true)
                            TextField("Password", text: $password)
                                .frame( height: 30, alignment: .center)
                                .padding()
                                .background(Color(#colorLiteral(red: 91/255, green: 123/255, blue: 235/255, alpha: 1)))
                                .accentColor(.white)
                                .cornerRadius(10.0)
                                .font(.system(size: 20, weight: .regular, design: .default))
                                .foregroundColor(.white)
                                .disableAutocorrection(true)
                            TextField("Full Name", text: $fullName)
                                .frame( height: 30, alignment: .center)
                                .padding()
                                .background(Color(#colorLiteral(red: 91/255, green: 123/255, blue: 235/255, alpha: 1)))
                                .accentColor(.white)
                                .cornerRadius(10.0)
                                .font(.system(size: 20, weight: .regular, design: .default))
                                .foregroundColor(.white)
                                .disableAutocorrection(true)
                            TextField("User Name", text: $userName)
                                .frame( height: 30, alignment: .center)
                                .padding()
                                .background(Color(#colorLiteral(red: 91/255, green: 123/255, blue: 235/255, alpha: 1)))
                                .accentColor(.white)
                                .cornerRadius(10.0)
                                .font(.system(size: 20, weight: .regular, design: .default))
                                .foregroundColor(.white)
                                .disableAutocorrection(true)
                                .preferredColorScheme(.dark)
                            
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
       // }
        
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
