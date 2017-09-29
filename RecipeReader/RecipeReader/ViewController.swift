//
//  ViewController.swift
//  RecipeReader
//
//  Created by Justin on 9/26/17.
//  Copyright © 2017 Justin Kalan. All rights reserved.
// dev.to

import UIKit

class ViewController: UIViewController {
    
    var recipes: [Recipe] = []
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
        tableView.dataSource = self
        
    }
    
    func fetchData(){
        let url = URL(string: "https://git.io/vdtMM")!
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { (data, respone, err) in
            let data = data!
            // JSON Serialization to transform data
            let json = try! JSONSerialization.jsonObject(with: data, options: [])
            let array = json as! [[String: Any]]
            self.recipes = array.map {Recipe(dictionary: $0)}
            self.recipes += self.recipes
            self.recipes += self.recipes
           // print(self.recipes)
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        task.resume()
    }
}
    
    extension ViewController: UITableViewDataSource {
        
        func numberOfSections(in tableView: UITableView) -> Int {
            return 1
        }
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return recipes.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let recipe = recipes[indexPath.item]
            let cell = tableView.dequeueReusableCell(withIdentifier: "RecipeCell", for: indexPath) as! RecipeCell
            cell.recipeNameLabel.text = recipe.name
            return cell
        }
    }


