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
    @IBOutlet weak var saveBtn: UIBarButtonItem!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!

    var index = 0
    //var data = [""]
    var data = [Contact]()
    override func viewDidLoad() {
        super.viewDidLoad()
        if index < data.count {
            nameTextField.text = data[index].name
            emailTextField.text = data[index].email
            phoneTextField.text = data[index].phone
        }
        else{
            nameTextField.text = ""
            emailTextField.text = ""
            phoneTextField.text = ""
        }
        
        //checkTextFields()
        nameTextField.becomeFirstResponder()
    }
    
    func checkTextFields(){
        if nameTextField.text == ""{
            saveBtn.isEnabled = false
        }
        else{
            saveBtn.isEnabled = true
        }
    }
    
}
