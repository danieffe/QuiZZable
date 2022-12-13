//
//  AvatarChoiceView.swift
//  AvatarChoice
//
//  Created by Michele Valentino on 09/12/22.
//

import SwiftUI
import CoreData

struct AvatarChoiceView: View {
    
    @Environment (\.managedObjectContext) var managedObjContext
//    @FetchRequest(sortDescriptors: (\.imageName, order: .reverse)) var food:FetchedResults<Avatar>
    @FetchRequest(sortDescriptors: []) var avatar: FetchedResults<Avatar>
    @State private var showingAddView = false
    
    
    
//        @ObservedObject var myData = sharedData
        @State var showAlert = false
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
                    VStack(){
                        Image(q)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 130, height: 130)
                            .clipShape(Circle())
                            .background(Circle().fill(Color.white).opacity(0.8))
                            .position(x:195,y:100)
    //                                                .padding()
                        
                    }
                    
                    VStack(alignment: .leading,spacing: 20){
                        HStack{
                            Text("Your Collection:")
                                .font(.title)
                                .padding(.top,90)
                                .padding(.leading,20)
                                .foregroundColor(.white)
                            
                        }
                        
                        ScrollView(){
                            LazyVGrid(columns: columns){
                                ForEach(avatar){it in
                                    Button {
                                        showAlert.toggle()
                                        print(it.imageName!)
                                        s=it.imageName!
                                    } label: {
                                        Image(it.imageName!)
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 100, height: 100)
                                            .clipShape(Circle())
                                            .background(Circle().fill(Color.white).opacity(0.8))
                                            .padding(12)
                                    }
                                    .alert("Changing picture", isPresented: $showAlert) {
                                        Button("Yes",role: .cancel){
    //                                        print(it.imageName)
                                            q=s
                                            
                                        }
                                        
                                        Button("Cancel",role: .destructive){}

                                    } message: {
                                        Text("Vuoi cambiare avatar?")
                                    }
                                }
                            }
                        }
                        .frame(height: 390)
                    }
                }
            }
        }
    }




struct AvatarChoiceView_Previews: PreviewProvider {
    static var previews: some View {
        AvatarChoiceView()
    }
}
