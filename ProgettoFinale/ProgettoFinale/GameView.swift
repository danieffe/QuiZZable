//
//  GameView.swift
//  OurApp
//
//  Created by Davide Castaldi on 07/12/22.
//
import Foundation
import SwiftUI
struct GameView: View {
    var defaults = UserDefaults.standard
    @State var balance = UserDefaults.standard.integer(forKey: "Bilancio")
    @State var icona = UserDefaults.standard.string(forKey: "icona")  ?? ""
    @ObservedObject var myEquation = linearEquations
//    @ObservedObject var myAnswers = arrayOfWrongAnswers
    
    @Binding var questionIndex: Int
    @State var lastQuiz: Bool = false
    @State var tapped: String = ""
    @State var didTapContinue: Bool = false
    @State var solutionViewIsPresented = false
    @State var correctViewIsPresented = false
    @State var animate = false
    
    var equations: Game
    var body: some View {
        NavigationStack {
            
            ZStack {
                //background of application
                Color.black.opacity(0.9)
                    .ignoresSafeArea() //if we want to get rid of that white
                //profile picture circle, it is behind the rectangle
                Circle()
                    .fill(Color("dark purple"))
                    .opacity(0.5)
                    .frame(width: 120, height: 120)
                    .padding(.bottom, 600)
                //Where the question and answers will be placed
                VStack {
                    Rectangle()
                        .fill(Color("dark purple")) // placeholder for true color
                        .opacity(0.5)
                        .frame(width: 300, height: 550)
                        .cornerRadius(40)
                        .padding(.bottom, 80)
                }
                //profile picture must be in this ZStack or else it goes below rectangle
                VStack {
                    Image(icona)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 105, height: 105)
                        .clipShape(Circle())
                        .shadow(radius: 20)
                        .padding(.bottom, 600)
                }
                
                //question
                Text(myEquation.equationsArray[questionIndex].question )
                    .font(.title2)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .padding(.bottom, 350)
                //for each question in the array
                VStack {
                    ForEach (myEquation.equationsArray[questionIndex].answers, id: \.self) {
                        equationAnswer in
                        //if i tap whatever button, i assign the value of the button to a var
                        Button {
                            if (tapped == equationAnswer) {
                                tapped = ""
                            }
                            else {
                                tapped = equationAnswer
                            }
                            
                        } label: {
                            //this is the label of every button
                            Text(equationAnswer)
                                .font(.title3)
                                .foregroundColor(.white)
                                .frame(width: 230, height: 50)
                                //the "highlight" part
                                .background(tapped == equationAnswer ? Color.blue.opacity(0.4) : Color("brighter purple"))
                        }
                        .cornerRadius(40)
                        .padding(.bottom, 20)
                    }
                }
                //qui finisce la VStack dove c'è questo padding per le risposte
                .padding(.top, 130)
                //this is the continue button
                Rectangle()
                    .fill(Color("brighter purple")) // placeholder for true color
                    .frame(width: 300, height: 80)
                    .cornerRadius(40)
                    .padding(.top, 600)
                VStack {
                    Button {
                        //if we need to just tap on the answer to make pop up of "correct" or "wrong" we need to delete all the ifs except for tapped == "". Point is that animation won't work like this, so needs to be fixed accordingly
                        didTapContinue = true
                        //according to the answer i do the animation of correct
                        if(tapped == myEquation.equationsArray[questionIndex].correct) {
                            withAnimation (Animation.spring().speed(0.8)) {
                                animate = true
                                //if i put this here next view loads automatically after clicking continue
                            }
                        }
                        //this is just to avoid every clicking without selecting answers
                        else if (tapped == "") {
                            solutionViewIsPresented = false
                        }
                        //or animate the wrong part
                        else {
                            //solutionViewIsPresented = true
                            withAnimation (Animation.spring().speed(0.8)) {
                                animate = true
                            }
                        }
//                        questionIndex += 1
                    } label: {
                        Text("Continue")
                            .font(.title)
                            .foregroundColor(.white)
                            .frame(width: 280, height: 80)
                        
                    }
                    .buttonStyle(.bordered)
                    .controlSize(.small)
                    .padding(.top, 600)
                    //when they click "solution"
                    .sheet(isPresented: $solutionViewIsPresented) {
                        SolutionView()
                    }
//                    if (solutionViewIsPresented){
//                        NavigationLink{
//                            SolutionView()
//                        }
//                    }
                    .sheet(isPresented: $correctViewIsPresented,onDismiss: didDismiss) {
                        CorrectAnswerView()
                    }
                    
                }
                VStack {
                    
                    //this is after i click continue, i check if the answer is correct. It needs to be here because I can't do button in a button
                    if((didTapContinue && tapped == myEquation.equationsArray[questionIndex].correct) && tapped != "") {
                        Text("Correct answer!\n You did it!")
                            .multilineTextAlignment(.center)
                            .font(.title2)
                            .foregroundColor(.white)
                            .opacity(animate ? 1.0 : 0.0)
                            .padding()
                        Image(systemName: "checkmark.seal.fill")
                            .font(.title)
                            .foregroundColor(Color.green.opacity(1))
                            .padding()
                            .opacity(animate ? 1.0 : 0.0)
                        Button {
                            withAnimation (Animation.spring().speed(0.8)) {
                                animate = false
                            }
                        } label: {
                            Text("Go next!")
                                .font(.body)
                                .foregroundColor(.white)
                                .frame(width: 100, height: 30)
                                .background(Color("dark purple"))
                                .cornerRadius(40)
                                .padding()
                                .onTapGesture {
                                    didTapContinue = false
                                    if(questionIndex+1 == myEquation.equationsArray.count) {
                                        correctViewIsPresented = true
                                    }
                                    else {
                                        questionIndex +=  1
                                    }
                                }
                        }
                    }
                    else if((didTapContinue && tapped != myEquation.equationsArray[questionIndex].correct) && tapped != "") {
                        Text("Wrong answer!")
                            .multilineTextAlignment(.center)
                            .font(.title2)
                            .foregroundColor(.white)
                            .opacity(animate ? 1.0 : 0.0)
                            .padding()
                        Image(systemName: "xmark.octagon.fill")
                            .font(.title)
                            .foregroundColor(Color.red.opacity(1))
                            .padding()
                            .opacity(animate ? 1.0 : 0.0)
                        HStack {
                            Button {
                                didTapContinue = false
                                animate = false
                                solutionViewIsPresented = true;
                            } label: {
                                Text("Solution")
                                    .font(.body)
                                    .foregroundColor(.white)
                                    .frame(width: 100, height: 30)
                                    .background(Color("dark purple"))
                                    .cornerRadius(40)
                                    .padding()
                            }
                            Button {
                                withAnimation (Animation.spring().speed(0.8)) {
                                    animate = false
                                }
                            } label: {
                                Text("Go next!")
                                    .font(.body)
                                    .foregroundColor(.white)
                                    .frame(width: 100, height: 30)
                                    .background(Color("dark purple"))
                                    .cornerRadius(40)
                                    .padding()
                                    .onTapGesture {
                                        didTapContinue = false
                                        if(questionIndex+1 == myEquation.equationsArray.count) {
                                            correctViewIsPresented = true
//                                            balance=balance+5
                                            defaults.set(balance,forKey: "Bilancio")
                                        }
                                        else {
                                            questionIndex +=  1
                                        }
                                    }
                                
                            }
                        }
                    }
                }
                .navigationBarBackButtonHidden(true)
                .background(animate ? Color.black : Color.black.opacity(0))
                .cornerRadius(20)
                
            }
            //end of ZStack
            
        }
        
    }
}

func didDismiss() {
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
//struct GameView_Previews: PreviewProvider {
////    @State var questionIndex: Int = 0
////    static var previews: some View {
////        GameView(ref: $questionIndex, equations: linearEquations.equationsArray[0])
////    }
//}
