//
//  ContentView.swift
//  login
//

//

import SwiftUI
 struct ContentViewStarter: View {
    @State private var login = ""
 @State private var password = ""
 @State private var loggedIn = false
    var body: some View {
         NavigationStack {
             topSection()
             ZStack {
                 RadialGradient(colors: [.blue,.red,.green], center: .bottom, startRadius: 0, endRadius: 2000).ignoresSafeArea()
                 VStack(spacing: 30) {
                    HStack {
                        Spacer().frame(width:30)
                        Image(systemName: "person")
                        TextField("loginname",text: $login)
                    }.frame(width: UIScreen.main.bounds.width - 120, height: 50)
                        .background(.white)
                        .cornerRadius(30)
               passwordSection()
                    Button {
                        loggedIn.toggle()
                    } label: {
                        Text("Login").fontWeight(.bold)
                            .foregroundStyle(.black)
                            .padding(.horizontal, 100)
                    }.frame(width: UIScreen.main.bounds.width - 120, height: 50)
                        .background(.red)
                        .cornerRadius(30)
                        .shadow(radius: 20)
                        .navigationDestination(isPresented: $loggedIn) {
                            HomeView(user: User(name: login, pass: password))
                        }
                        

                }
                .frame(maxWidth: 300, maxHeight: 350)
               
                .background(.blue)
                .cornerRadius(30)
                .shadow(radius: 30)
             }
        }
    }
     func passwordSection() -> some View {
         
         HStack {
             Spacer().frame(width:30)
             Image(systemName: "lock")
             SecureField("password",text: $password)
         }.frame(width: UIScreen.main.bounds.width - 120, height: 50)
             .background(.white)
             .cornerRadius(30)
     }
    
    func topSection () -> some View
    {
        HStack{
            Image(systemName: "book.circle")
            Text("SwiftUI Tutorial").foregroundStyle(.black)
        }
    }
}

#Preview {
    ContentViewStarter()
}
