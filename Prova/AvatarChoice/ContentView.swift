//
//  ContentView.swift
//  AvatarChoice
//
//  Created by Michele Valentino on 09/12/22.



import SwiftUI

struct ContentView : View {
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: AvatarChoiceView()) {
                    Text("Do Something")
                    
                    NavigationLink(destination: BuyView()) {
                        Text("Shop Now")
                    }
                }
            }
        }
    }
}
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
