//
//  HomeView.swift
//  login
//
//  Created by derharta on 1/26/24.
//

import SwiftUI
struct User {
    var name: String
    var pass: String
}

struct HomeView: View {
    @State var user: User
    var body: some View {
        Text("Hello \(user.name) \(user.pass)")
    }
}

#Preview {
    HomeView(user: User(name: "", pass: ""))
}
