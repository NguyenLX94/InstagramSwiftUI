//
//  LoginInstagram.swift
//  InstagramSwiftUI
//
//  Created by Nguyen  on 09/12/2021.
//

import SwiftUI
import Combine
struct LoginInstagram: View {
   @StateObject private var loginRegister = LoginRegisterViewModel()
    @State var authenticationDidFailEmail: Bool = true
    var body: some View {
        NavigationView{
            ZStack{
                LinearGradient(gradient: Gradient(colors: [.purple, .blue]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
                VStack{
                    Logo()
                        .offset(y: -130)
                    VStack(){
                        EntryField(placeHolder: "Email Address", prompt: loginRegister.emailPrompt, fielf: $loginRegister.EmailL)
                        EntryField( placeHolder: "Password Address", prompt: loginRegister.PasswordPrompt, fielf: $loginRegister.Password, isSecure: true)
                        
                        Button {
                            loginRegister.login()
                        } label: {
                            Text("Login")
                        }
                        .padding()
                        .frame(height: 60)
                        .frame(maxWidth: .infinity,alignment: .center)
                        .font(.headline)
                        .foregroundColor(.white)
                        .background(Color(#colorLiteral(red: 124/255, green: 115/255, blue: 238/255, alpha: 1)))
                        .opacity(loginRegister.canSubmit ? 1 : 0.6)
                        .disabled(!loginRegister.canSubmit)
                        HStack{
                            Text("Forgot your password? Get help.")
                                .foregroundColor(.white)
                                .font(.headline)
                            NavigationLink(destination: RegisterInstagram(), label: {
                                Text("SIGN IN")
                                    .foregroundColor(Color.white)
                                    .bold()
                            })
                           
                        }
                        .offset(y: 20)
                        
                        VStack(alignment: .center, spacing: 10){
                            HStack(){
                                Text("Don't have an account?")
                                    .foregroundColor(.white)
                                    .font(.headline)
                                NavigationLink(destination: RegisterInstagram()) {
                                    Text("SIGN UP")
                                        .foregroundColor(.white)
                                        .bold()
                                }
                            }
                            .frame( maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
                        }
                        .offset(y: 60)
                    }
                    .offset(y: -60)
                    .padding()
                    Spacer()
                }
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
