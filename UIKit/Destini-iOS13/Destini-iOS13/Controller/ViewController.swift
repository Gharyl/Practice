//
//  ViewController.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var storyBrain = StoryBrain()
    var currentStory = 0

    @IBOutlet weak var storyLabel: UILabel!
    @IBOutlet weak var choice1Button: UIButton!
    @IBOutlet weak var choice2Button: UIButton!
    @IBAction func choiceMade(_ sender: UIButton) {
        currentStory = storyBrain.nextStory(userChoice: sender.tag)
        updateUI()
        storyBrain.updateProgress(userChoice: currentStory)
    }
    
    func updateUI(){
        storyLabel.text = storyBrain.stories[currentStory].title
        choice1Button.setTitle(storyBrain.stories[currentStory].choice1,for: .normal)
        choice2Button.setTitle(storyBrain.stories[currentStory].choice2,for: .normal)
    }
    
    override func viewDidLoad() {
        choice1Button.tag = 1
        choice2Button.tag = 2
        super.viewDidLoad()
        updateUI()
    }
}
