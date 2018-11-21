//
//  ResultsViewController.swift
//  NoudCorten-pset2
//
//  Created by Noud on 11/21/18.
//  Copyright © 2018 Noud. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var storyText: UILabel!
    
    var story: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        storyText.text = story

        // Do any additional setup after loading the view.
    }
    
    
    

}
