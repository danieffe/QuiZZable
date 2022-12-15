//
//  CorrectAnswerView.swift
//  OurApp
//
//  Created by Davide Castaldi on 09/12/22.
//
import Foundation

import SwiftUI

struct CorrectAnswerView: View {
    var defaults = UserDefaults.standard
    @State var balance = UserDefaults.standard.integer(forKey: "Bilancio")

    var body: some View {
        NavigationView{
            ZStack {
                Color("darker purple")
                    .ignoresSafeArea()
                Text("You did it! \n You earned 5 diamonds!")
                    .font(.title)
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center)
                    .padding(.top, 200)
                /*
                 Circle()
                 .fill(Color("dark purple"))
                 .opacity(0.5)
                 .frame(width: 120, height: 120)
                 .padding(.bottom, 0)
                 VStack {
                 Image("pp1")
                 .resizable()
                 .aspectRatio(contentMode: .fill)
                 .frame(width: 105, height: 105)
                 .clipShape(Circle())
                 .shadow(radius: 20)
                 .padding(.bottom, 0)
                 }
                 */
                VStack {
                    Capsule()
                        .fill(Color.white)
                        .frame(width: 50, height: 3)
                        .padding(10)
                    Spacer()
                }
                VStack {
                    Image("mascotte")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 200, height: 200)
                        .padding(.bottom, 250)
                        .padding(.leading, 22)
                }
                Rectangle()
                    .fill(Color("brighter purple")) //placeholder for true color
                    .frame(width: 300, height: 80)
                    .cornerRadius(40)
                    .padding(.top, 600)
                VStack {
                    
                    NavigationLink {
                        WelcomeView()
                    } label: {
                        Text("I got it!")
                            .font(.title)
                            .foregroundColor(.white)
                            .frame(width: 280, height: 80)
                    }
                    .buttonStyle(.bordered)
                    .controlSize(.small)
                    .padding(.top, 600)
                }
            }
        }.onAppear(){
            balance = balance+5
        }
        
    }
}

struct CorrectAnswerView_Previews: PreviewProvider {
    static var previews: some View {
        CorrectAnswerView()
    }
}
