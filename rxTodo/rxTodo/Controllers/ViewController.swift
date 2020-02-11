//
//  ViewController.swift
//  rxTodo
//
//  Created by Fernando Martin Garcia Del Angel on 11/02/20.
//  Copyright © 2020 Fernando Martin Garcia Del Angel. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var prioritySegmentedControl: UISegmentedControl!
    @IBOutlet weak var tableView: UITableView!
    
    //RxSwift
    let disposeBag = DisposeBag()
    private var tasks = BehaviorRelay<[Task]>(value: [])
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }

    
    // MARK - Table View Controllers
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskTableViewCell",for: indexPath)
        return  cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let naviC = segue.destination as? UINavigationController,
            let addTVC = naviC.viewControllers.first as? AddTaskViewController else {
                fatalError()
        }
        
        addTVC.taskSubjectObservable.subscribe(onNext: { task in
            
            let priority = Priority(rawValue: self.prioritySegmentedControl.selectedSegmentIndex - 1)
            
            var existingTaks = self.tasks.value
            existingTaks.append(task)
            self.tasks.accept(existingTaks)
            
        }).disposed(by: disposeBag)
    }

}

