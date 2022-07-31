import SwiftUI

struct LogIn: View {
    
    @State public var Username: String = ""
    @State public var Password: String = ""
    @EnvironmentObject var viewRouter: ViewRouter
    
    var body: some View {
        ZStack{
            Color.white
                .ignoresSafeArea()
            BackgroundView(topColor: Color.cyan, bottomColor: .white)
            VStack {
                
                Text("Welcome to")
                    .font(.system(size: 25, weight: .bold))
                    .padding(.top,160)
                Logo(textSize: 50,imageSize: 240)
                    .padding(.bottom,50)
                
                
                InputBox(Stuff: "Enter your User ID", matchingState: $Username, IsSecure: false)
                
                InputBox(Stuff: "Enter your Password", matchingState: $Password, IsSecure: true)
                
                Button{
                    print("Link to next page")
                    withAnimation {
                        viewRouter.currentPage = .Main
                    }
                    
                }label: {
                    Text("Confirm")
                        .frame(width: 200, height: 50)
                        .background(.blue)
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                
                Spacer()
            }
        }
    }
}