//
//  ViewModel.swift
//  Fetch_iOS_Coding_Challenge
//
//  Created by AnushaValasapalli on 6/27/23.
//

import Foundation

class MealViewModel: ObservableObject {
    @Published var meals: [Meal] = []
    
    func fetchMeals() {
        guard let url = URL(string: "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let response = try decoder.decode(MealResponse.self, from: data)
                DispatchQueue.main.async {
                    self.meals = response.meals
                    print("Meals:%",self.meals)
                }
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }.resume()
    }
    
    //https://themealdb.com/api/json/v1/1/lookup.php?i=52898
}

struct MealResponse: Codable {
    let meals: [Meal]
}


