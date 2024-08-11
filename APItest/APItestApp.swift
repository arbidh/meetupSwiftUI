import SwiftUI

@main
struct APItestApp: App {
    @Bindable var nm = NetworkManager()
    var body: some Scene {
        WindowGroup {
            ContentView(nm: nm)
        }
    }
}
