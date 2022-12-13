//
//  DataController.swift
//  AvatarChoice
//
//  Created by Michele Valentino on 12/12/22.
//

import Foundation
import CoreData

class DataController : ObservableObject{
    let container = NSPersistentContainer(name: "Core")//ho messo il nome del mio modello
    
    init(){
        container.loadPersistentStores{desc,error in
            if let error =  error {
                print("Failed to load the data \(error.localizedDescription)")
            }
        }
    }
    
    func save (context: NSManagedObjectContext){
        do{
            try context.save()
            print("Data saved")
        }catch{
            print("We could not save the data")
        }
    }
    
    func addImage(name: String,context: NSManagedObjectContext){
        let avatar = Avatar(context: context)
        avatar.id = UUID()
        avatar.imageName = name
        save(context: context)
    }
    
}
