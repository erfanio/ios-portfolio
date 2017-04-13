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
    @IBOutlet weak var myTable: UITableView!
    var monsters: [MonsterEntity] = [MonsterEntity]()
    
    fileprivate lazy var managedObjectContext: NSManagedObjectContext = {
        return ((UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext)!
    }()
    
    fileprivate lazy var originalMonsters: [MonsterEntity] = {
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "MonsterEntity")
        var monsters: [NSManagedObject] = []
        do {
            monsters = try self.managedObjectContext.fetch(fetchRequest)
        } catch let error {
            fatalError(error.localizedDescription)
        }
        return monsters as! [MonsterEntity]
    }()
    
    fileprivate var searchController = UISearchController(searchResultsController: nil)
    
    override func viewWillAppear(_ animated: Bool) {
        self.myTable.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
        searchController.searchBar.searchBarStyle = .minimal
        searchController.hidesNavigationBarDuringPresentation = false
        myTable.tableHeaderView = searchController.searchBar
        
        filter(searchController.searchBar.text!)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func filter(_ query: String) {
        if query.isEmpty {
            self.monsters = originalMonsters
        } else {
            let q = query.lowercased()
            self.monsters = originalMonsters.filter { monster in
                return (monster.name?.lowercased().contains(q))!
            }
        }
        self.title = "Search Monster (\(self.monsters.count))"
        self.myTable.reloadData()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ViewTheMonsterSegue" {
            let dest = segue.destination as! ViewMonsterViewController
            if let indexPath = myTable.indexPathForSelectedRow {
                let monster = monsters[indexPath.row]   
                dest.monsterEntity = monster
            }
        }
    }

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

extension SearchMonsterViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        self.filter(searchController.searchBar.text!)
    }
}
