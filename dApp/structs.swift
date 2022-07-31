import SwiftUI

import Foundation



struct RoundedCorner: Shape { // for 'corners' parameter of cornerRadius

    

    var radius: CGFloat = .infinity

    var corners: UIRectCorner = .allCorners

    

    func path(in rect: CGRect) -> Path {

        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))

        return Path(path.cgPath)

    }

}



extension View { // for 'corners' parameter of cornerRadius

    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {

        clipShape( RoundedCorner(radius: radius, corners: corners) )

    }

}



struct BackgroundView: View{

    

    var topColor : Color

    var bottomColor : Color

    

    var body : some View{

        LinearGradient(gradient: Gradient(colors: [topColor, bottomColor]), 

                       startPoint: .topLeading, 

                       endPoint: .bottomTrailing)

        .edgesIgnoringSafeArea(.all)

    }

}





struct Logo: View {

    

    var textSize: CGFloat

    var imageSize: CGFloat

    

    var body: some View {

        HStack{

            VStack (alignment: .leading){

                //Text("Real")

                //.font(.system(size: textSize, weight: .semibold))

                //Text("Estrate")

                //.font(.system(size: textSize, weight: .semibold))

            } .padding(.horizontal,5)

            

            Image("RSLogo.jpg")

                .resizable()

                .aspectRatio(contentMode: .fit)

                .frame(width: imageSize)

        }

    }

}



struct InputBox: View{

    var Stuff : String

    var matchingState: Binding<String>

    var IsSecure : Bool

    var body: some View{

        if IsSecure{

            SecureField(Stuff, text: matchingState)

                .textFieldStyle(RoundedBorderTextFieldStyle())

                .accentColor(.cyan) //change cursor colour

                .frame(width: 300, height: 50)

        } else {

            TextField(Stuff, text: matchingState)

                .textFieldStyle(RoundedBorderTextFieldStyle())

                .accentColor(.cyan) //change cursor colour

                .frame(width: 300, height: 50)

        }

        

        

    }

}



struct HeaderButton: View{

    

    var ButtonName: Page

    var ButtonSymbol: String

    var LeadingorTrailing: Edge.Set

    @EnvironmentObject var viewRouter: ViewRouter

    

    var body: some View{

        

        Button{

            print("Direct to right place")

            viewRouter.currentPage = ButtonName

            

        }label: {

            Image(systemName: ButtonSymbol)

                .resizable()

                .aspectRatio(contentMode: .fit)

                .frame(width: 60)

        }

        .padding(LeadingorTrailing,10)

        .padding(.top,5)

        .foregroundColor(.cyan)

    }

}





struct Header: View{

    

    var body: some View{

        

        ZStack{

            Logo(textSize: 20,imageSize:100)

            HStack{

                HeaderButton(ButtonName: .LogIn, ButtonSymbol: "arrow.left.to.line.circle.fill", LeadingorTrailing: .leading)

                Spacer()

            }

            

        }.padding(.top,20)

    }

}



struct FooterButton: View{

    

    var DirectTo: Page

    var ButtonSymbol: String

    var client: String

    @EnvironmentObject var viewRouter: ViewRouter

    

    var body: some View{

        Button{

            print("Direct to right place")

            withAnimation {

                viewRouter.currentPage = DirectTo

            }

            

        }label: {

            VStack{

            Image(systemName: ButtonSymbol)

                .resizable()

                .aspectRatio(contentMode: .fit)

                .frame(width: 40)

                .foregroundColor(.white)

            

                Text(client)

                    .font(.system(size: 20, weight: .semibold))

                    .foregroundColor(.white)

            }

        }

    }

}



struct Footer: View{

    var body: some View{

        

        HStack{

            Spacer()

            FooterButton(DirectTo: .Main, ButtonSymbol: "person.circle", client: "Client 1")

            Spacer()

            FooterButton(DirectTo: .Main, ButtonSymbol: "person.circle", client: "Client 2")

            Spacer()

            FooterButton(DirectTo: .Main, ButtonSymbol: "person.circle", client: "Client 3")

            Spacer()

        }.frame(maxWidth:.infinity)

            .frame(height: 100)

            .background(.cyan)

            .cornerRadius(10, corners:[.topLeft,.topRight])

    }

}



struct AcceptorDecline: View{

    var body: some View{

        HStack{ 

            Button{

                

            }label:{

                Text("Accept")

                    .frame(width: 70, height: 25)

                    .background(.green)

                    .font(.system(size: 15, weight: .bold))

                    .foregroundColor(.white)

                    .cornerRadius(10,corners: [.topLeft,.bottomLeft])

            }

            Button{

                

            }label:{

                Text("Decline")

                    .frame(width: 70, height: 25) 

                    .background(.red)

                    .font(.system(size: 15, weight: .bold))

                    .foregroundColor(.white)

                    .cornerRadius(10,corners: [.topRight,.bottomRight])

            }

        }

    }

}



struct Entry: View{

    

    //var active: String

    var number: Int

    var EntryID: Int

    var PartyA: String

    var PartyB: String

    var Comments: Array<String>

    var Documents: Array<String>

    var SmartContractID: String

    var ContractPDF: String

    

    var body: some View{

        HStack{

            VStack{

                Text("Draft #\(String(EntryID))")

                    .font(.system(size: 24, weight: .bold))

                Text("Party A (Buyer): \(String(PartyA))")

                    .font(.system(size: 16, weight: .light))

                Text("Party B (Seller): \(String(PartyB))")

                    .font(.system(size: 16, weight: .light))

                Text("Smart Contract ID: \(String(SmartContractID))")

                    .font(.system(size: 16, weight: .light))

            }

            Spacer()

            VStack{

                Text("Comments")

                    .font(.system(size: 20, weight: .semibold))

                if (EntryID == 1) {

                    Text("Price not agreed")

                        .font(.system(size: 12, weight: .light))

                        .padding(.top,5)

                }

                Spacer()

                if (EntryID==number){

                    

                    AcceptorDecline()

                }

            }

            

        }

        .padding()

        .border(.black, width: 3)

        

    }

}