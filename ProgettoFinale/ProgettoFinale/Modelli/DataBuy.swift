//
//  DataBuy.swift
//  AvatarChoice
//
//  Created by Michele Valentino on 09/12/22.
//

import Foundation
import SwiftUI

class SharedData1: ObservableObject{//per dire che sarà usata in altre Views
    @Published var store = [
        buyavatarpic(imageStoreName: "astronaut",price:5),
        buyavatarpic(imageStoreName: "shiba",price:5),
        buyavatarpic(imageStoreName: "dinosaur",price:400),
        buyavatarpic(imageStoreName: "blueastronaut",price:400),
        buyavatarpic(imageStoreName: "goat",price:400),
        buyavatarpic(imageStoreName: "monkey",price:400),
        buyavatarpic(imageStoreName: "sloth",price:400),
        buyavatarpic(imageStoreName: "chick",price:400),
    
        
    ]
    
}

var sharedData1=SharedData1()
