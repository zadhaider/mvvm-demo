//
//  ContentView.swift
//  mvvm-demo
//
//  Created by Zeeshan Haider on 16/11/1442 AH.
//

import SwiftUI

struct ContentView: View {
    
   @ObservedObject var model = RecipeModel()
    
    var body: some View {
       
        
        NavigationView {
          
                
                List(model.recipes){ r in
                    
                    NavigationLink(
                        destination: /*@START_MENU_TOKEN@*/Text("Destination")/*@END_MENU_TOKEN@*/,
                        label: {
                            
                            VStack(alignment: .leading){
                                
                                Text(r.name).font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                HStack{
                                    Text(r.cuisine)
                                        
                                    Text(r.madeby)
                                        .font(.footnote)
                                        .foregroundColor(Color.red)
                                    
                                }
                            }
                            .padding(.bottom)
                        
                            
                        })
                    
                
                    
                }.navigationBarTitle(Text("All Recipes"))
                
                Button(action: {
                    
              //      model.addRecipe()
                    
                    
                }, label: {
                    Text("Add Recipe")
                })
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
