//
//  SearchMonsterViewController.swift
//  Darwin's Encyclopedia
//
//  Created by Admin on 12/4/17.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit
import CoreData

class SearchMonsterViewController: UIViewController {
    @IBOutlet weak var editSearch: UISearchBar!
    
    fileprivate lazy var managedObjectContext: NSManagedObjectContext = {
        return ((UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext)!
    }()
    
    fileprivate lazy var monsters: [MonsterEntity] = {
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "MonsterEntity")
        var monsters: [NSManagedObject] = []
        do {
            monsters = try self.managedObjectContext.fetch(fetchRequest)
        } catch let error {
            fatalError(error.localizedDescription)
        }
        return monsters as! [MonsterEntity]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension SearchMonsterViewController: NSFetchedResultsControllerDelegate {}

extension SearchMonsterViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.monsters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MonsterTableViewCell.reuseIdentifier, for: indexPath) as? MonsterTableViewCell else {
            fatalError()
        }
        
        let monster = self.monsters[indexPath.row]
        
        cell.viewName.text = monster.name
        cell.viewSpecies.text = monster.species
        
        return cell
    }
}
