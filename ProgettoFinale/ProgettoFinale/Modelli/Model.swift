//
//  Model.swift
//  OurApp
//
//  Created by Davide Castaldi on 07/12/22.
//

import Foundation
import SwiftUI

struct Game: Identifiable {
    
    var id = UUID()
    var question: String
    var correct: String
    var answers: [String]
}
//
//struct WrongAnswers: Identifiable {
//
//    var id = UUID()
//    var wrong1: String
//    var wrong2: String
//    var wrong3: String
//    var answer: String
//}
//
