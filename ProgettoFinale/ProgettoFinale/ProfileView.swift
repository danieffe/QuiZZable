//
//  ProfileView.swift
//  Task3
//
//  Created by Daniele Fontana on 09/12/22.
//

import Foundation
import SwiftUI


struct ProfileView: View {
    
    var defaults = UserDefaults.standard
    @State var nomeuser = UserDefaults.standard.string(forKey: "inome")  ?? ""
    @State var icona = UserDefaults.standard.string(forKey: "icona")  ?? ""
    @State var balance = UserDefaults.standard.integer(forKey: "Bilancio")
    @FetchRequest(sortDescriptors: []) var avatar: FetchedResults<Avatar>
    @State var showAlert = false
    @State var name:String = "Nickname"
    @State var SettingsViewisPresented = false
    @State private var s: String = ""
    
    var body: some View {
        //        NavigationStack{
        ZStack{
            LinearGradient(gradient: Gradient(colors: [.purple, .black]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
                .onTapGesture {
                    UserDefaults.standard.set(name,forKey: "inome")
                }
            
            VStack{
                Image(icona)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 130, height: 130)
                    .clipShape(Circle())
                    .background(Circle().fill(Color.white).opacity(0.8))
                    .padding(.top,-250)
                
                HStack(alignment: .center){
                                        TextField("", text:$name)
                        .frame(width: 200,height: 60,alignment: .center)
                                            .foregroundColor(.white)
                                            .font(.title)
                                            .bold()
                                            .padding(.leading,65.5)
                
                //                        UserDefaults.standard.set(name,forKey: "inome")
                
                                        Image(systemName: "pencil")
                                            .foregroundColor(.white)
                                            .frame(alignment: .leading)
                                            .padding(.leading,-60)
                
                
                                    }.padding(.top,-100)
                //
                //                    HStack{
                //                        Text("Balance: \(balance)")
                //                            .font(.largeTitle)
                //                            .foregroundColor(.white)
                //                            .frame(width: 240,height: 40,alignment: .bottomLeading)
                //
                //                        Image("TOKEN")
                //                            .resizable()
                //                            .frame(width: 40,height: 40)
                //                            .padding(.left, 20)
                //                    }
                //                    .padding(40)
                
                //                    Image("coin")
                //                        .resizable()
                //                        .frame(width: 400,height: 240)
                //                        .padding(30)
                
                HStack(alignment: .center){
                    Text("My collection")
                        .font(.title)
                        
                    
                    NavigationLink(destination: AvatarChoiceView()) {
                        Text("View all")
                            .padding(.leading,100)
                            
                    }
                }
                .foregroundColor(.white)
                ScrollView(.horizontal){
                    HStack{
                        ForEach(avatar){it in
                            Button {
                                showAlert.toggle()
                                print(it.imageName!)
                                s=it.imageName ?? " "
                            } label: {
                                Image(it.imageName!
                                )
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 100, height: 100)
                                .clipShape(Circle())
                                .background(Circle().fill(Color.white).opacity(0.8))
                                .padding(12)
                            }
                            .alert("Changing picture", isPresented: $showAlert) {
                                Button("Yes",role: .cancel){
                                    icona=s
                                    UserDefaults.standard.set(icona,forKey: "icona")
                                }
                                Button("Cancel",role: .destructive){}
                            } message: {
                                Text("Vuoi cambiare avatar?")
                            }
                        }
                    }
                }.onAppear(){
                    icona = UserDefaults.standard.string(forKey: "icona")  ?? ""
                }
                Button{
                }label: {
                    
                    ZStack{
                        Rectangle()
                            .frame(width: 300,height: 60)
                            .foregroundColor(.purple)
                            .cornerRadius(100)
                            .opacity(0.3)
                        NavigationLink("Shop Now", destination: BuyView())
                            .foregroundColor(.white)
                            .font(.headline)
                    }
                }.padding(.top,200)
                
            }.padding(.top,160)
        }
    }
    
}
    
    
    
    struct ProfileView_Previews: PreviewProvider {
        static var previews: some View {
            ProfileView()
        }
    }
