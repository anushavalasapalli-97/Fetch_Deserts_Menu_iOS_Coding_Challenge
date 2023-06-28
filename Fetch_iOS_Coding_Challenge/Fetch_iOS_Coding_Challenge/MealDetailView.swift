import SwiftUI
import URLImage

struct MealDetailView: View {
    let meal: Meal
    @StateObject var mealDetailViewModel = MealDetailViewModel()
    
    var body: some View {
        VStack {
            if let mealDetail = mealDetailViewModel.mealDetail {
                Text(meal.strMeal)
                    .font(.headline)
                    .padding()
                
                RemoteImage(urlString: mealDetail.strMealThumb)
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 200)
                
                Text("Ingredients").bold()
                    .padding()
                
                VStack {
                    List {
                        ForEach(mealDetail.ingredients, id: \.self) { ingredient in
                            Text(ingredient)
                        }
                    }
                }
                Text("Measurements").bold()
                    .padding()
                
                VStack {
                    List {
                        ForEach(mealDetail.Measurements, id: \.self) { measure in
                            Text(measure)
                        }
                    }
                }
            } else {
                ProgressView()
            }
            
            
            
            
        }
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            mealDetailViewModel.fetchMealDetail(mealId: meal.idMeal)
        }
    }
}

