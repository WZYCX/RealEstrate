import SwiftUI

struct Main: View {
    var body: some View {
        ZStack{
            Color.white
            VStack{
                
                Header()
                Text("Welcome")//placeholder for "Hi \n\(name)"
                    .padding()
                    .font(.system(size: 50, weight: .semibold))
                
                ScrollView{
                    var z = 3
                    ForEach(1...z, id:\.self){ i in
                        //var i = Int(x)
                        Entry(number: z, EntryID: i, PartyA: "Party A (Buyer)" , PartyB: "Party B (Seller)", Comments: [], Documents: ["Party A - Proof of Identity","Party B - Proof of Identity","Party A - Proof of Address","Party B - Proof of Address","Party A - Proof of Funds","Party A - Land Deeds"], SmartContractID: "Smart Contract ID", ContractPDF: "Contract PDF")
                        //Entry(number: z, EntryID: i, PartyA: Drafts[i][1], PartyB: Drafts[i][2], Comments: Drafts[i][3], Documents: Drafts[i][4], SmartContractID: Drafts[i][5], ContractPDF: Drafts[i][6])
                    }
                }
                
                Spacer()
                Footer()
            }
        }
    }
}
/*
var Drafts = [
    
    ["Party A (Buyer)","Party B (Seller)",[],
     ["Party A - Proof of Identity","Party B - Proof of Identity","Party A - Proof of Address","Party B - Proof of Address","Party A - Proof of Funds","Party A - Land Deeds"]
     ,"Smart Contract ID", "Contract PDF"],
    
    ["Party A (Buyer)","Party B (Seller)","Comments/Enquiries",
     "Documents","Smart Contract ID", "Contract PDF"],
    
]
 */