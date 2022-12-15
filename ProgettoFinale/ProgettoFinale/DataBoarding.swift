//
//  Data.swift
//  OnBoarding
//
//  Created by Michele Valentino on 08/12/22.
//

import Foundation
import SwiftUI


class SharedData: ObservableObject{//per dire che sarà usata in altre Views
    @Published var Onboard = [
    Onboarding(image: "mascotte", title: "Learn with us", description: "Learn in an alternative way wherever you want. "),
    Onboarding(image: "mascotte", title: "Test your knowledge", description: "Test your knowledge answering questions and you will win fantastic rewards"),
    Onboarding(image: "mascotte", title: "Customize your experience", description: "You choose the subjects you want to practice on!!!")
    ]
}

var sharedData=SharedData()
