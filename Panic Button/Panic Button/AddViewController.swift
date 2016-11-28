//
//  AddViewController.swift
//  Panic Button
//
//  Created by MACBOOK on 11/17/16.
//  Copyright © 2016 Anexoft. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {

    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!

    var index = 0
    var data = [""]
    //a flag that determines if theres new data to store in the array
    var update = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if index < data.count {
            nameTextField.text = data[index]//.name
        }
        else{
            nameTextField.text = ""
        }
        // Do any additional setup after loading the view.
    }
}
