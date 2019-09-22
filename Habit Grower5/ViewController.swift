//
//  ViewController.swift
//  Habit Grower5
//
//  Created by Yingfan Chen on 9/21/19.
//  Copyright © 2019 Rice University. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var habitName = ["drink water", "sleep early", "work out"]
    
    @IBOutlet weak var tableview2: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}
extension ViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return habitName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell2 = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath)as? Cell2TableViewCell
        cell2?.lbl.text = habitName[indexPath.row]
        cell2?.img.image = UIImage(named: habitName[indexPath.row])
        return cell2!
    }
 
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController
        vc?.image = UIImage(named: habitName[indexPath.row])!
        vc?.name = habitName[indexPath.row]
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
}



