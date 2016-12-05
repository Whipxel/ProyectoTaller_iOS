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
        
        nameTextField.becomeFirstResponder()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ReturnToContacts"{
             print("Yes")
            dismiss(animated: true, completion: nil)
        }
    }
    
}
