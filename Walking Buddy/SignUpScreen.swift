//
//  ContentView.swift
//  Walking Buddy
//
//  Created by Sanchitha Dinesh on 11/23/19.
//  Copyright © 2019 Sanchitha. All rights reserved.
//

import SwiftUI
import AuthenticationServices

let lightGreyColor = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0)

let storedUsername = "Sanchitha D"
let storedPassword = "Sanchitha"
let storedUsername2 = "Vaishnavi K"
let storedPassword2 = "Vaishnavi"
let storedUsername3 = "Sarasvati B"
let storedPassword3 = "Sarasvati"

struct SignUpScreen: View {
    @State var username: String = ""
    @State var password: String = ""
    @State var authenticationDidFail: Bool = false
    @State var authenticationDidSucceed: Bool = false

    var body: some View {

        ZStack {
            VStack {
                WelcomeText()
                Profile()
                UsernameTextField(username: $username)
                PasswordSecureField(password: $password)
                //SchoolTextField(school: $school)
                if authenticationDidFail {
                    Text("Information not correct. Try again.")
                        .offset(y: -10)
                        .foregroundColor(.red)
                }

                Button(action: {

                    if self.username == storedUsername && self.password == storedPassword {

                        self.authenticationDidSucceed = true
                        self.authenticationDidFail = false

                    } else {
                        self.authenticationDidFail = true
                    }
                        if self.username == storedUsername2 && self.password == storedPassword2 {

                            self.authenticationDidSucceed = true
                            self.authenticationDidFail = false

                        } else {
                            self.authenticationDidFail = true
                        }
                    if self.username == storedUsername3 && self.password == storedPassword3 {

                        self.authenticationDidSucceed = true
                        self.authenticationDidFail = false

                    } else {
                        self.authenticationDidFail = true
                    }

                    }) {
                        LoginButtonContent()

                    }




            }
            .padding()
            if authenticationDidSucceed {
                NavigationView {
                    VStack {
                        NavigationLink(destination: ContentView()) {
                            //Text("Show Detail View")
                        VStack {

                            Text("Way of transportation:")
                                .font(.largeTitle)
                                .frame(width: 1000, height: 100)

                                Text("Bike")
                                    .font(.title)
                                    .frame(width: 300, height: 70)
                                    .background(Color.green)
                                    .cornerRadius(20.0)
                                    .foregroundColor(.white)
                                    .animation(Animation.default)

                                    .padding(100)

                                Text("Walk")

                                    .font(.title)
                                    .frame(width: 300, height:70)
                                    .background(Color.green)
                                    .cornerRadius(20.0)
                                    .foregroundColor(.white)
                                    .animation(Animation.default)

                            }
                        }.navigationBarTitle("Walk Or Bike")
                    }
                }
            }
        }
    }

    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }

    struct WelcomeText: View {
        var body: some View {
            Text("Welcome!")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .padding(.bottom, 20)
        }
    }

    struct Profile: View {
        var body: some View {
            Image("userImage")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 150, height: 150)
                .clipped()
                .cornerRadius(150)
                .padding(.bottom, 75)
        }
    }

    struct LoginButtonContent: View {
        var body: some View {
            Text("LOGIN")
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .frame(width: 220, height: 60)
                .background(Color.green)
                .cornerRadius(15.0)
        }
    }

    struct UsernameTextField: View {
        @Binding var username: String
        var body: some View {
            TextField("Username", text: $username)
                .padding()
                .background(lightGreyColor)
                .cornerRadius(5.0)
                .padding(.bottom, 20)
        }
    }

    struct PasswordSecureField: View {
        @Binding var password: String
        var body: some View {
            SecureField("Password", text: $password)
                .padding()
                .background(lightGreyColor)
                .cornerRadius(5.0)
                .padding(.bottom, 20)
        }
    }
}

struct SchoolTextField: View {
    @Binding var school: String
    var body: some View {
        TextField("Schools in the Cupertino Union school district", text: $school)
            .padding()
            .background(lightGreyColor)
            .cornerRadius(5.0)
            .padding(.bottom, 20)

    }
}


