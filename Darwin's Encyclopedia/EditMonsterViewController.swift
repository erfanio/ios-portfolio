//
//  EditMonsterViewController.swift
//  Darwin's Encyclopedia
//
//  Created by Erfan Norozi on 13/4/17.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit

class EditMonsterViewController: UIViewController {
    var monster: MonsterEntity?
    
    @IBOutlet weak var editName: UITextField!
    @IBOutlet weak var editAge: UITextField!
    @IBOutlet weak var editAttackPower: UITextField!
    @IBOutlet weak var editSpecies: UITextField!
    @IBOutlet weak var editHealth: UITextField!
    
    @IBAction func saveAction(_ sender: Any) {
        var name: String?
        var age: Int32?
        var species: String?
        var attackPower: Int32?
        var health: Int32?
        
        var error: Bool = false
        
        if !(editName.text!.isEmpty) {
            editName.layer.borderWidth = 0
            name = editName.text!
        } else {
            editName.layer.borderColor = UIColor.red.cgColor
            editName.layer.borderWidth = 1
            error = true
        }
        
        if let _age = Int32(editAge.text!) {
            editAge.layer.borderWidth = 0
            age = _age
        } else {
            editAge.layer.borderColor = UIColor.red.cgColor
            editAge.layer.borderWidth = 1
            error = true
        }
        
        if !(editSpecies.text!.isEmpty) {
            editSpecies.layer.borderWidth = 0
            species = editSpecies.text!
        } else {
            editSpecies.layer.borderColor = UIColor.red.cgColor
            editSpecies.layer.borderWidth = 1
            error = true
        }
        
        if let _attackPower = Int32(editAttackPower.text!) {
            editAttackPower.layer.borderWidth = 0
            attackPower = _attackPower
        } else {
            editAttackPower.layer.borderColor = UIColor.red.cgColor
            editAttackPower.layer.borderWidth = 1
            error = true
        }
        
        if let _health = Int32(editHealth.text!) {
            editHealth.layer.borderWidth = 0
            health = _health
        } else {
            editHealth.layer.borderColor = UIColor.red.cgColor
            editHealth.layer.borderWidth = 1
            error = true
        }
        
        if !error {
            monster!.name = name!
            monster!.age = age!
            monster!.species = species!
            monster!.attackPower = attackPower!
            monster!.health = health!
            
            (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
            
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        editName.text = monster?.name
        editAge.text = String((monster?.age)!)
        editSpecies.text = monster?.species
        editAttackPower.text = String((monster?.attackPower)!)
        editHealth.text = String((monster?.health)!)
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
