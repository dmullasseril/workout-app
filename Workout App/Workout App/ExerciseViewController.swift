//
//  ExerciseViewController.swift
//  Workout App
//
//  Created by Rita Meriano on 6/15/20.
//  Copyright © 2020 Gabe Dan. All rights reserved.
//

import UIKit

class ExerciseViewController: UIViewController {
    
    var exercise:Exercise?
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var imageLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var videoLabel: UILabel!
    
    @IBOutlet weak var equipmentLabel: UILabel!
    
    @IBOutlet weak var muscleGroupLabel: UILabel!
    
    @IBOutlet weak var altExerciseLabel: UILabel!
    
    @IBOutlet weak var intensityLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = exercise!.name
        imageLabel.text = exercise!.image
        descriptionLabel.text = exercise!.description
        videoLabel.text = exercise!.video
        equipmentLabel.text = exercise!.equipment
        muscleGroupLabel.text = exercise!.muscleGroups
        altExerciseLabel.text = exercise!.alternativeExercises
        intensityLabel.text = exercise!.intensity

        // Do any additional setup after loading the view.
        
        let downSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe))
        view.addGestureRecognizer(downSwipe)
    }
    
    @objc func handleSwipe(sender: UISwipeGestureRecognizer) {
        if sender.state == .ended {
            presentingViewController?.dismiss(animated: true, completion: nil)
        }
    }

    
    @IBAction func editExercise(_ sender: Any) {
        
        self.performSegue(withIdentifier: "EditExercise", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
        if segue.destination is AddExerciseViewController {
            
            let vc = segue.destination as? AddExerciseViewController
            vc?.editExercise = true
            vc!.nameField.text = exercise!.name
            vc?.imageField.text = exercise!.image
            vc?.descriptionField.text = exercise!.description
            vc?.videoField.text = exercise!.video
            vc?.equipmentField.text = exercise!.equipment
            vc?.muscleGroupField.text = exercise!.muscleGroups
            vc?.alternativeExercisesField.text = exercise!.alternativeExercises
            vc?.intensityField.text = exercise!.intensity
            
        }
    }
    
}
