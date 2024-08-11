

import SwiftUI

struct ContentView: View {
    //Binding to the NetworkManager user changes
    @Bindable var nm: NetworkManager
    //Binding to the Button changes
    @State var didGoToNextScreen = false
    var body: some View {
        ZStack {
            RadialGradient(colors: [.gray,.green], center: .top, startRadius: 0, endRadius: 2000).ignoresSafeArea()
            VStack {
                AsyncImage(url: URL(string: nm.user?.avatarUrl ?? "")) { image in
                    image.resizable()
                        .frame(width: 200,height: 200)
                        .aspectRatio(contentMode: .fit)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        .shadow(radius: 30)
                    
                } placeholder: {
                    Image(systemName: "person")
                        .resizable()
                        .frame(width: 200,height: 200)
                }
                HStack {
                    Text(nm.user?.name ?? "")
                        .bold()
                        .foregroundStyle(.white)
                    Text(nm.user?.bio ?? "")
                        .font(.caption2)
                        .foregroundStyle(.white)
                }
                Text("Welcome to SwiftUI")
                    .shadow(radius: 30)
                    .padding()
                Button {
                    didGoToNextScreen.toggle()
                } label: {
                    Text("Hello SwiftUI")
                        .frame(width: 300,height: 30)
                        .foregroundColor(.white)
                        .background(.blue)
                        .clipShape(RoundedRectangle(cornerRadius: 30))
                }
                .sheet(isPresented: $didGoToNextScreen, content: {
                    Text("Welcome To SwiftUI")
                        .bold()
                        .font(.system(size: 80))
                })
              
            }.task {
                do {
                   try await nm.fetchUser()
                }catch{
                    print("Error occured")
                }
            }
        }
    }
}

#Preview {
    ContentView(nm: NetworkManager())
}
