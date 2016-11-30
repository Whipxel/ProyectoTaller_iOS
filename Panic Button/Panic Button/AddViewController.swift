//
//  AddViewController.swift
//  Panic Button
//
//  Created by Erick Valentin Blanco Puerto on 11/17/16.
//  Copyright © 2016 Anexoft. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {

    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!

    var index = 0
    var data = [""]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if index < data.count {
            nameTextField.text = data[index]//.name
        }
        else{
            nameTextField.text = ""
        }
        
    }
}
