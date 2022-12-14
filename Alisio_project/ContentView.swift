//
//  ContentView.swift
//  Alisio_project
//
//  Created by Giovanni Maresca on 13/12/22.
//

import SwiftUI

struct ContentView: View {
    
    //dichiarazione delle variabili. @State vuol dire che è una variabile che cambierà all'interno del programma
    @State private var isLiked = false
    @State private var isLiked1 = false
    @State private var isLiked2 = false
    @State private var isLiked3 = false
    @State private var isTap = false
    @State private var searchText = ""
    
    //dichiaro la variabile costante (let) backgroundGradient e gli dico il colore che voglio. Dove inizia il colore e dove inisce nella pagina. Nel nostro caso va da sopra a sotto 
    let backgroundGradient = LinearGradient(
        colors: [Color.black, Color.black],
        startPoint: .top, endPoint: .bottom)
    
    
    var body: some View {
        //NavigationView dice che la pagina che stai per andare a costruire è navigabile. Questo ti permette di aggiongere NavigationLink per andare da una pagina ad un'altra
        NavigationView{
            ZStack {
                backgroundGradient
                VStack{
                    
                    Text("Welcome back!")
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.trailing,140)
                    //per aggiungere la searchbar. Solo che per aggiungerla devi avere "Welcome back" come .navigationTitle("Welcome back") e lo devi mettere alla fine dello ZStack
                    
                    
//                    Text("\(searchText)")
//                        .navigationTitle("")
//                        .searchable(text: $searchText, prompt: "Search")
//                        .foregroundColor(.white)
                    
                    
                    HStack {
                        Text("Analysis")
                        //Spacer() serve per sparare via gli oggetti tra loro. Dare una dimensione fissa della distanza tra oggetti
                        Spacer()
                        //Text(isLiked ? "Liked!" : "Unliked!") ->se vuoi aggiongere le voci like dislike
                        HeartButton(isLiked: $isLiked)
                    }.padding()
                    HStack{
                        Text("Computer Science")
                        Spacer()
                        HeartButton(isLiked: $isLiked1)
                    }.padding()
                    HStack{
                        Text("Physics")
                        Spacer()
                        HeartButton(isLiked: $isLiked2)
                    }.padding()
                    HStack{
                        Text("Law")
                        Spacer()
                        HeartButton(isLiked: $isLiked3)
                    }.padding()
                    Button(action:{
                        isTap = true
                    }, label: {
                        Text("Let's Play")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(height: 55)
                            .frame(maxWidth: 280)
                            .background(Color(uiColor: .systemPurple))
                            .cornerRadius(20)
                    })
                    VStack {
                        HStack{
                            Text("Challenge")
                                .font(.title2)
                            Spacer()
                            Text("View All")
                        }
                        HStack{
                            VStack {
                                Image("Image")
                                Text("Flashcards")
                            }
                            Spacer()
                            VStack {
                                Image("Image")
                                Text("Test")
                            }
                            Spacer()
                            VStack {
                                Image("Image")
                                Text("Memory")
                            }
                        }
                    }.padding()
                    
                    
                }
                
                
                
                
                
                
                Spacer()
                //.ignoresafearea() serve "colorare" in questo caso tutta la pagina. Prova a toglierlo vedi cosa succede
            }.ignoresSafeArea()
            //.foregroundColor serve per colorare di bianco in questo caso tutti i font che sono presenti nello ZStack( perchè l'ho messo alla fine dello Zstack). Se volevo i font bianchi solo del VStack lo mettevi solo alla fine del VStack
                .foregroundColor(.white)
            
            
        }
        
    }
    
    
    
    struct HeartButton: View{
        //@Binding è come se fosse un riferimento dello @State di prima in C++
        @Binding var isLiked: Bool
        
        var body: some View {
            Button(action:{
                self.isLiked.toggle()
                
            }, label: {
                Image(systemName: isLiked ? "heart.fill" : "heart")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 20)
                    .foregroundColor(Color(isLiked ? .red : .gray))
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
