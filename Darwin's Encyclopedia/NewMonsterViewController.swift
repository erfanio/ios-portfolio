//
//  NewMonsterViewController.swift
//  Darwin's Encyclopedia
//
//  Created by Admin on 12/4/17.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit
import CoreData

class NewMonsterViewController: UIViewController {
    @IBOutlet weak var editName: UITextField!
    @IBOutlet weak var editAge: UITextField!
    @IBOutlet weak var editAttackPower: UITextField!
    @IBOutlet weak var editSpecies: UITextField!
    @IBOutlet weak var editHealth: UITextField!
    
    fileprivate lazy var managedObjectContext: NSManagedObjectContext = {
        return ((UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext)!
    }()

    @IBAction func save(_ sender: Any) {

        let monster = NSEntityDescription.insertNewObject(forEntityName: "MonsterEntity", into: self.managedObjectContext) as? MonsterEntity
        
        if !(editName.text!.isEmpty) {
            editName.layer.borderWidth = 0
            monster!.name = editName.text!
        } else {
            editName.layer.borderColor = UIColor.red.cgColor
            editName.layer.borderWidth = 1
            return
        }
        
        if let age = Int32(editAge.text!) {
            editAge.layer.borderWidth = 0
            monster!.age = age
        } else {
            editAge.layer.borderColor = UIColor.red.cgColor
            editAge.layer.borderWidth = 1
            return
        }
        
        if !(editSpecies.text!.isEmpty) {
            editSpecies.layer.borderWidth = 0
            monster!.species = editSpecies.text!
        } else {
            editSpecies.layer.borderColor = UIColor.red.cgColor
            editSpecies.layer.borderWidth = 1
            return
        }
        
        if let attackPower = Int32(editAttackPower.text!) {
            editAttackPower.layer.borderWidth = 0
            monster!.age = attackPower
        } else {
            editAttackPower.layer.borderColor = UIColor.red.cgColor
            editAttackPower.layer.borderWidth = 1
            return
        }
        
        if let health = Int32(editHealth.text!) {
            editHealth.layer.borderWidth = 0
            monster!.age = health
        } else {
            editHealth.layer.borderColor = UIColor.red.cgColor
            editHealth.layer.borderWidth = 1
            return
        }

        do {
            try self.managedObjectContext.save()
        } catch {
            fatalError()
        }
    }
    
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
