// Topological Sort

class Solution {
    func findAllRecipes(_ recipes: [String], _ ingredients: [[String]], _ supplies: [String]) -> [String] {
        
        var recipeArray = [Recipe]()
        var supplieSet = Set(supplies)
        for i in 0..<recipes.count {
            let name = recipes[i]
            let theIngredientSet = Set(ingredients[i])
            let subtracting = theIngredientSet.subtracting(supplieSet)
            let recipe = Recipe(name: name, ingredients: theIngredientSet, score: subtracting.count)
            recipeArray.append(recipe)
        }
        
        var queue: [String] = recipeArray.filter({ $0.score == 0 }).map({ $0.name })
        var pointer = 0
        while  pointer < queue.count {
            let name = queue[pointer]
            supplieSet.insert(name)
            for recipe in recipeArray where recipe.ingredients.contains(name) && recipe.score > 0 {
                let subtracting = recipe.ingredients.subtracting(supplieSet)
                if subtracting.count == 0 {
                    queue.append(recipe.name)
                }
                recipe.score = subtracting.count
            }
            pointer += 1
        }
        
        return queue
    }
}

class Recipe {
    let name: String
    let ingredients: Set<String>
    var score: Int
    
    init(name: String, ingredients: Set<String>, score: Int) {
        self.name = name
        self.ingredients = ingredients
        self.score = score
    }
}
