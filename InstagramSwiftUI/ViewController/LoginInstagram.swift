//
//  LoginInstagram.swift
//  InstagramSwiftUI
//
//  Created by Nguyen  on 09/12/2021.
//

import SwiftUI

struct LoginInstagram: View {
    @State var Email: String = ""
    @State var Password: String = ""
    @State var authenticationDidFailEmail: Bool = true
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [.purple, .blue]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
            VStack{
                Logo()
                VStack(spacing: 25){
                    //EmailTextField(email: $Email)
                    TextField("Email", text: $Email, onEditingChanged: { isChanged in
                        if !isChanged {
                            if self.textFieldValidatorEmail(self.Email) {
                                self.authenticationDidFailEmail = true
                            } else {
                                self.authenticationDidFailEmail = false
                                self.Email = ""
                            }
                        }
                    })
                        .frame( height: 30, alignment: .center)
                        .padding()
                        .background(Color.gray)
                        .accentColor(.white)
                        .cornerRadius(10.0)
                        .font(.system(size: 20, weight: .regular, design: .default))
                        .foregroundColor(.white)
                        .disableAutocorrection(true)
                    if !self.authenticationDidFailEmail{
                        Text("Email is Not Valid")
                            .offset(y: -20)
                            .foregroundColor(.red)
                    }
                    PasswordTextfield(password: $Password)
                    if !self.authenticationDidFailEmail{
                        Text("passs sai")
                            .offset(y: -20)
                            .foregroundColor(.red)
                    }
                    Button(action: {print("acttion")}) {
                        LoginButtonConten()
                    }
                    .padding()
                    HStack{
                        Text("Forgot your password? Get help.")
                            .foregroundColor(.white)
                            .font(.headline)
                        Button(action: {print("sinh in")}) {
                            SingInButtonConten()
                        }
                    }
                    
                    VStack(alignment: .center, spacing: 10){
                        HStack(spacing: 5){
                            Text("Don't have an account?")
                                .foregroundColor(.white)
                                .font(.headline)
                                .padding()
                            Button(action: {print("acction")}) {
                                SingUpButtonConten()
                            }
                        }
                        .frame( maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
                    }
                }
                .padding()
                Spacer()
            }
        }
    }
    func textFieldValidatorEmail(_ email: String) -> Bool {
        if email.count > 64 {
            return false
        }
        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: email)
    }
}

struct LoginInstagram_Previews: PreviewProvider {
    static var previews: some View {
        LoginInstagram()
    }
}

struct LoginButtonConten: View {
    var body: some View {
        Text("Login")
            .padding()
            .frame(height: 60)
            .frame(maxWidth: .infinity,alignment: .center)
            .font(.headline)
            .foregroundColor(.white)
            .background(Color.gray)
            .cornerRadius(30)
    }
}

struct SingUpButtonConten: View {
    var body: some View {
        Text("Sing Up")
            .font(.headline)
            .foregroundColor(.white)
    }
}

struct SingInButtonConten: View {
    var body: some View {
        Text("SIGN IN")
            .font(.headline)
            .foregroundColor(.white)
    }
}


struct Logo: View {
    var body: some View {
        Image("Instagram_logo_white")
            .padding(50)
    }
}

//struct EmailTextField: View {
//    @Binding var email: String
//    var body: some View {
//        TextField("Email", text: $email)
//            .frame( height: 30, alignment: .center)
//            .padding()
//            .background(Color.gray)
//            .accentColor(.white)
//            .cornerRadius(10.0)
//            .font(.system(size: 20, weight: .regular, design: .default))
//            .foregroundColor(.white)
//            .disableAutocorrection(true)
//    }
//}

struct PasswordTextfield: View {
   
    @Binding var password: String
    var body: some View {
        SecureField("passWord", text: $password)
            .frame( height: 30, alignment: .center)
            .padding()
            .background(Color.gray)
            .cornerRadius(10.0)
            .font(.system(size: 20, weight: .regular, design: .default))
            .foregroundColor(.black)
            .disableAutocorrection(true)
    }
}
