//
//  ViewMonsterViewController.swift
//  Darwin's Encyclopedia
//
//  Created by Admin on 12/4/17.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit

class ViewMonsterViewController: UIViewController {
    var monsterEntity: MonsterEntity?
    var dumbMonster: Bool = false
    
    @IBOutlet weak var viewAge: UILabel!
    @IBOutlet weak var viewName: UILabel!
    @IBOutlet weak var viewAttackPower: UILabel!
    @IBOutlet weak var viewSpecies: UILabel!
    @IBOutlet weak var viewHealth: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if dumbMonster {
            viewName.text = "Dracula"
            viewAge.text = "9091"
            viewAttackPower.text = "89"
            viewSpecies.text = "Vampire"
            viewHealth.text = "76"
        } else {
            if let monster: Monster = Monster(monsterEntity!) {
                viewName.text = monster.name
                viewAge.text = String(monster.age)
                viewAttackPower.text = String(monster.attackPower)
                viewSpecies.text = monster.species
                viewHealth.text = String(monster.health)
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        if !dumbMonster {
            let button =  UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(editAction(sender:)))
            self.navigationItem.rightBarButtonItem = button
        }

        // Do any additional setup after loading the view.
    }
    
    func editAction(sender: UIBarButtonItem) {
        performSegue(withIdentifier: "EditMonsterSegue", sender: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "EditMonsterSegue" {
            let dest = segue.destination as! EditMonsterViewController
            dest.monster = monsterEntity
            
        }
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
