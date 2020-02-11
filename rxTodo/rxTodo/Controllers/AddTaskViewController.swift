//
//  AddTaskViewController.swift
//  rxTodo
//
//  Created by Fernando Martin Garcia Del Angel on 11/02/20.
//  Copyright © 2020 Fernando Martin Garcia Del Angel. All rights reserved.
//

import UIKit

class AddTaskViewController: UIViewController {
    
    @IBOutlet weak var taskPriority: UISegmentedControl!
    @IBOutlet weak var saveTask: UIButton!
    @IBOutlet weak var taskDescription: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func save(_ sender: Any) {
        guard let priority = Priority(rawValue: self.taskPriority.selectedSegmentIndex),
            let title = self.taskDescription.text else {
                return
        }
        
        let task = Task(title: title,
                        priority: priority)
        print(task)
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
