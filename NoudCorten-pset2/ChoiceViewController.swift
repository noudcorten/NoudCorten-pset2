//
//  ChoiceViewController.swift
//  NoudCorten-pset2
//
//  Created by Noud on 11/21/18.
//  Copyright © 2018 Noud. All rights reserved.
//

import UIKit

class ChoiceViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBOutlet weak var storySimple: UIButton!
    @IBOutlet weak var storyTarzan: UIButton!
    @IBOutlet weak var storyUniversity: UIButton!
    @IBOutlet weak var storyClothes: UIButton!
    @IBOutlet weak var storyDance: UIButton!
    
    var fileName: String!
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        switch sender {
        case storySimple:
            fileName = "madlib0_simple"
        case storyTarzan:
            fileName = "madlib1_tarzan"
        case storyUniversity:
            fileName = "madlib2_university"
        case storyClothes:
            fileName = "madlib3_clothes"
        case storyDance:
            fileName = "madlib4_dance"
        default: break
        }
        performSegue(withIdentifier: "choiceSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "choiceSegue" {
            let questionViewController = segue.destination as! QuestionViewController
            questionViewController.file = fileName
        }
    }
    
}
