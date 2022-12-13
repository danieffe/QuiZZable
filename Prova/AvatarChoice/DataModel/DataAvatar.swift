//
//  DataAvatar.swift
//  AvatarChoice
//
//  Created by Michele Valentino on 09/12/22.
//

import Foundation
import SwiftUI


class SharedData: ObservableObject{//per dire che sarà usata in altre Views
    @Published var Avatar = [
        Avatarpic(imageName: "captain-america"),
        Avatarpic(imageName: "pacman"),
        Avatarpic(imageName: "batman-icon"),
        Avatarpic(imageName: "spiderman"),
        Avatarpic(imageName: "superman"),
        Avatarpic(imageName: "flash"),
        Avatarpic(imageName: "663083"),
        Avatarpic(imageName: "136398"),
        Avatarpic(imageName: "superman"),
        Avatarpic(imageName: "flash"),
        Avatarpic(imageName: "663083"),
        Avatarpic(imageName: "136398"),
    
    ]
}

var sharedData=SharedData()
