//
//  QuestionViewController.swift
//  NoudCorten-pset2
//
//  Created by Noud on 11/21/18.
//  Copyright © 2018 Noud. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {

    @IBOutlet weak var questionNum: UILabel!
    @IBOutlet weak var questionType: UILabel!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var textLabel: UITextField!
    @IBOutlet weak var buttonOk: UIButton!
    @IBOutlet weak var storyText: UILabel!
    
    var file: String!
    var story: Story!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        story = loadStory(file: file)
        updateUI()
    }
    
    func loadStory(file: String) -> Story {
        let storyPath = Bundle.main.path(forResource: file, ofType: "txt")
        let text = try! String(contentsOfFile: storyPath!, encoding: .utf8)
        return Story(withText: text)
    }
    
    func updateUI() {
        if story.isFilledIn {
            performSegue(withIdentifier: "ResultsSegue", sender: nil)
        } else {
            questionNum.text = "\(story.remainingPlaceholders) word(s) left"
            if let placeHolder = story.nextPlaceholder {
                questionType.text = "please type a/an \(placeHolder)"
            }
        }
    }
    
    @IBAction func okButtonPressed(_ sender: UIButton) {
        if sender == buttonOk {
            let text = textLabel.text!
            story.fillInPlaceholder(word: text)
            textLabel.text = ""
            updateUI()
        }
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ResultsSegue" {
            let resultsViewController = segue.destination as! ResultsViewController
            resultsViewController.story = story.normalText
        }
    }

}
