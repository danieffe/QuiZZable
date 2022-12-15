//
//  ContentView.swift
//  OnBoarding
//
//  Created by Michele Valentino on 08/12/22.
//

import SwiftUI




struct OnBoardView: View {
    
    @ObservedObject var myData = sharedData
    
    @State private var currentStep = 0
//    var defaults = UserDefaults.standard
//    @State var contatore = UserDefaults.standard.bool(forKey: "conta")
    var body: some View {
        ZStack{
            
//            LinearGradient(gradient: Gradient(colors: [.black, .purple]), startPoint: .top, endPoint: .bottom)
            Color(.black)
                .ignoresSafeArea()
            
            VStack {
                HStack{
                    Spacer()
                    
                    Button(action: {
                        self.currentStep=myData.Onboard.count - 1
                    }){
                        Text("Skip")
                            .padding(16)
                            .foregroundColor(.white)
                    }
                }
                Text("Welcome to")
                    .foregroundColor(Color.white)
                    .font (.title)
                    .bold()
                Text("App-Name")
                    .foregroundColor(Color.purple)
                    .font (.title)
                    .bold()
                
                
                TabView(selection: $currentStep) {
                    ForEach(0..<myData.Onboard.count){ it in
                        VStack{
                            Image(myData.Onboard[it].image)
                                .resizable()
                                .frame(width: 150,height: 250)
                            
                            Text(myData.Onboard[it].title)
                                .font(.title)
                                .foregroundColor(Color.purple)
                                .bold()
                                .multilineTextAlignment(.center)
//                            foregroundColor(.purple)
                            Text(myData.Onboard[it].description)
                                .multilineTextAlignment(.center)
                                .foregroundColor(Color.white)
                                .padding(.horizontal,32)
                                .padding(.top,10)
                            
                        }
                        .tag(it)
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                HStack{
                    ForEach(0..<myData.Onboard.count){ it in
                        if it == currentStep {
                            Rectangle()
                                .frame(width:20,height:10)
                                .cornerRadius(10)
                                .foregroundColor(.purple)
                        }else{
                            Circle()
                                .frame(width: 10)
                                .foregroundColor(.white)
                        }
                    }
                }
                
                Button(action:{
                    if self.currentStep < myData.Onboard.count - 1 {
                        self.currentStep += 1
                    } else {
                    }
                }){
                    Text(currentStep < myData.Onboard.count - 1 ? "Next":"Get Started")
                        .padding(16)
                        .frame(maxWidth: .infinity)
                        .background(Color.purple)
                        .cornerRadius(16)
                        .padding(.horizontal,16)
                        .foregroundColor(.white)
                }
                .buttonStyle(PlainButtonStyle())
                .padding(.bottom,15)
            }
        }
    }
}






struct OnBoardView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardView()
    }
}
