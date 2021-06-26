//
//  RecipeModel.swift
//  mvvm-demo
//
//  Created by Zeeshan Haider on 16/11/1442 AH.
//

import Foundation

class RecipeModel : ObservableObject{
    
    //var recipes:[Recipe] = [Recipe]()
    @Published var recipes = [Recipe]()
    
    init()
    {
      
  //      recipes.append(Recipe(name: "Spaghetti", cuisine: "Italian", madeby: "Zeeshan"))
  //      recipes.append(Recipe(name: "Sushi", cuisine: "Japenese",madeby: "Zeeshan"))
  
    // get the path for the json file from the bundle
        
        let pathSring = Bundle.main.path(forResource: "data", ofType: "json")
        if let path = pathSring {
            
            //create a url object
            
            let url = URL(fileURLWithPath: path)
            
            // create a data object with the new data at url
            do{
                let data = try Data(contentsOf: url)
                
                //Parse the data
                
                let decoder = JSONDecoder()
                do{
                    let recipeData = try decoder.decode([Recipe].self, from: data)
                    
                    for r in recipeData {
                        r.id = UUID()
                    }
                    
                    self.recipes = recipeData
                }
                catch{
                    print(error)
                }
            }
            catch{
                print(error)
            }
        }
    
    }
    
    
    
}
