//
//  DeleteView.swift
//  AvatarChoice
//
//  Created by Michele Valentino on 09/12/22.
//

import SwiftUI

struct BuyView: View {
    @Environment (\.managedObjectContext) var managedObjContext
//    @Environment (\.dismiss) var dismiss
    
    @State private var name = " "
    
    
    @ObservedObject var myData = sharedData1
    var defaults = UserDefaults.standard
    @State var balance = UserDefaults.standard.integer(forKey: "Bilancio")
    @State var showAlert = false
    @State var showAlert1 = false
    
    @State private var q: String = "spiderman"
    @State private var s: String = "spiderman"
   
    let columns: [GridItem] = [
        GridItem(.fixed(120), spacing: nil, alignment: nil),
        GridItem(.fixed(120), spacing: nil, alignment: nil),
        GridItem(.fixed(120), spacing: nil, alignment: nil)
        
    ]
        
    var body: some View {
        NavigationView {
            ZStack{
                LinearGradient(gradient: Gradient(colors: [.purple, .black]), startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                
                VStack(alignment: .leading){
                        Text("Shop")
                            .font(.title)
                            .bold()
                            .padding(.top,-80)
                            .padding(.leading,30)
                            .foregroundColor(.white)
                    VStack(alignment: .center){
                        
                        Text("Your Balance: \(balance)")
                            .foregroundColor(.white)
                            .font(.title)
                            .padding(.top,-30)
                            .padding(.leading,80)
                        
                    }
//                        Text(myDat2.balance.coin)
                    
                    ScrollView(){
                        LazyVGrid(columns: columns){
                            ForEach(myData.store){it in
                                Button {
                                    if(balance>=it.price){
                                        showAlert.toggle()
                                        print(it.imageStoreName)
                                        s=it.imageStoreName}
                                    else
                                    {
                                        showAlert1.toggle()
                                    }
                                } label: {
                                    VStack{
                                        Image(it.imageStoreName)
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 100, height: 100)
                                            .clipShape(Circle())
                                            .background(Circle().fill(Color.white).opacity(0.8))
                                            .padding(12)
                                        HStack{
                                            Text("Price: \(it.price)")
                                                .foregroundColor(.white)
                                        }
                                        
                                    }
                                    
                                }
                                .alert("Shop now", isPresented: $showAlert) {
                                    Button("Yes",role: .cancel){
                                        balance = balance-it.price
                                        defaults.set(balance,forKey: "Bilancio")
                                        DataController().addImage(name: it.imageStoreName, context: managedObjContext)
                                    }
                                    
                                    Button("Cancel",role: .destructive){}
                                    
                                } message: {
                                    Text("Do you want to confirm the purchase?")
                                }
                                
                                .alert("Insufficient Founds", isPresented: $showAlert1) {
                                    Button("Ok", role: .cancel){
                                    }
                                } message: {
                                    Text("Sorry you have not 400 coins to buy it")
                                }
                            }
                        }
                        
                    }
                    .frame(height: 490)
                }
            }
            
        }
    }
}

struct BuyView_Previews: PreviewProvider {
    static var previews: some View {
        BuyView()
    }
}
