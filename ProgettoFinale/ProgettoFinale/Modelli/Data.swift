//
//  Data.swift
//  OurApp
//
//  Created by Davide Castaldi on 07/12/22.
//

import Foundation
import SwiftUI

class LinearEquations: ObservableObject {
    
    @Published var equationsArray = [
        
        Game(question: "Solve the following equation: \n\n2x+6 = 0", correct: "x = -3",
             answers: ["x = 0", "x = 2", "x = -2", "x = -3"]), // x = -3
        Game(question: "Solve the following equation: \n\n5x-11 = 3x+9", correct: "x = 10",
             answers: ["x = 5", "x = 10", "x = -2", "x = 9"]), //x = 10
        Game(question: "Solve the following equation: \n\n9-2(x-5) = x+10 ", correct: "x = 3",
             answers: ["x = 4", "x = -3", "x = 3", "x = 0"]) // x = 3
    ]
}

var linearEquations = LinearEquations()
//
//class ArrayWrongAnswers: ObservableObject {
//
//    @Published var arrayWrong = [
//        WrongAnswers(wrong1: "x = 5", wrong2: "x = 0", wrong3: "x = -2", answer: "x = -3"),
//        WrongAnswers(wrong1: "x = 9", wrong2: "x = -1", wrong3: "x = 4", answer: "x = 10"),
//        WrongAnswers(wrong1: "x = 0", wrong2: "x = -3", wrong3: "x = 8", answer: "x = 3"),
//        WrongAnswers(wrong1: "x = 0", wrong2: "x = -3", wrong3: "x = 8", answer: "x = 3"),
//    ]
//}
//
//var arrayOfWrongAnswers = ArrayWrongAnswers()
