
import SwiftUI
import AVKit
import WebKit
struct Therapist {
    var like: Bool
    var youtubeId: String
    var comment:Binding<String>
}

let youtubeLink = "https://www.youtube.com/embed/"

//Create a UViewRespresntable struct if you want to use anything
//From UIKit
struct YouTubeView: UIViewRepresentable {

    var videoID: String
    //make sure the return type is a WKWebView if you are using WebKit or UIView otherwise
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    //Anything you want to do the to returned WKWebview Resides here
    func updateUIView(_ uiView: WKWebView, context: Context) {

        let request:URLRequest = URLRequest(url: URL(string: "\(youtubeLink)\(videoID)")!)
        uiView.load(request)
    }

}

struct ContentView: View {
    // This is an array of Therapist or it could be any Model you choose
    @State var videos: [Therapist] = [Therapist(like: true, youtubeId: "lovgGdZQJrM", comment: .constant("")),Therapist(like: true, youtubeId: "VVEI-Awer88", comment: .constant(""))]
    @State var comment = ""
    var body: some View {
        ZStack {
            RadialGradient(colors: [.cyan,.red,.blue], center: .leading, startRadius: 0, endRadius: 2000).ignoresSafeArea()
            VStack {
                Text("Hello")
                Text("Sage")
                HStack {
                    Text("hello")
                    Text("Welcome To SwiftiUI")
                }
                .font(.largeTitle)
                .padding()
                //We create a scroll View to go through all our Views
                ScrollView(){
                    ForEach(videos, id: \.youtubeId) { video in
                        VStack{
                            YouTubeView(videoID: video.youtubeId)
                        }
                        .frame(width: UIScreen.main.bounds.width - 50, height: 200)
                        .cornerRadius(30)
                             
                        TextField("Add Comments", text: video.comment)
                            .padding(.leading, 40)
                        Button {
                            
                        } label: {
                            Label("Submit", systemImage: "pen")
                                .foregroundColor(.white)
                                .frame(width: 200, height: 20)
                                .background(.blue)
                                .cornerRadius(30)
                              
                        }
                        RoundedRectangle(cornerRadius: 30)
                            .foregroundColor(.blue)
                    }
                        
                }.listStyle(.inset)
                    .listRowSeparatorTint(.gray)
                    .listRowSpacing(30)
            }
        }
    }
}

#Preview {
    ContentView()
}
