//
//  ViewController.swift
//  Saving Data BayBeh
//
//  Created by Kyle Lee on 7/2/17.
//  Copyright © 2017 Kyle Lee. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var habits = [Habit]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let fetchRequest: NSFetchRequest<Habit> = Habit.fetchRequest()
        
        do {
            let habit = try PersistenceServce.context.fetch(fetchRequest)
            self.habits = habit
            self.tableView.reloadData()
        } catch {}
        
    }
    
    @IBAction func onPlusTapped() {
        let alert = UIAlertController(title: "Add Habit", message: nil, preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.placeholder = "Name"
        }
        let action = UIAlertAction(title: "Create", style: .default) { (_) in
            let name = alert.textFields!.first!.text!
            let habit = Habit(context: PersistenceServce.context)
            habit.name = name
            habit.id = UUID().uuidString
            habit.birthday = Date()
            habit.health = "Healthy"
            habit.healthXP = 100.0
            habit.healthXPperSecond = 100.0 / 604800.0
            habit.mood = "Happy"
            habit.level = 1
            habit.exp = 0.0
            habit.maxExp = 100
            habit.lastClockedIn = Date()
            habit.week = 1
            habit.month = 1
            habit.year = 1
            PersistenceServce.saveContext()
            self.habits.append(habit)
            self.tableView.reloadData()
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
}

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return habits.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        cell.textLabel?.text = habits[indexPath.row].name
        return cell
    }
}

