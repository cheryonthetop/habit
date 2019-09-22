//
//  DetailViewController.swift
//  Habit Grower5
//
//  Created by Wendy Zhang on 9/21/19.
//  Copyright © 2019 Rice University. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var lbl: UILabel!
    @IBOutlet weak var img: UIImageView!
    
    var image = UIImage()
    var name = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        lbl.text = "Your habit is \(name)"
        img.image = image
        
        // Do any additional setup after loading the view.
    }
    


}
