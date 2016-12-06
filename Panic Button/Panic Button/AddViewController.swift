//
//  AddViewController.swift
//  Panic Button
//
//  Created by Erick Valentin Blanco Puerto on 11/17/16.
//  Copyright © 2016 Anexoft. All rights reserved.
//

import UIKit

class AddViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var saveBtn: UIBarButtonItem!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!

    var index = 0
    var data = [Contact]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameTextField.delegate = self
        emailTextField.delegate = self
        phoneTextField.delegate = self
        
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
        
        saveBtn.isEnabled = false
        checkTextFields()
        
        nameTextField.becomeFirstResponder()
        emailTextField.becomeFirstResponder()
        phoneTextField.becomeFirstResponder()
        
    }
    
    //MARK: Save Button setup
    
    
    func checkTextFields(){
        if nameTextField.text! != "" && emailTextField.text! != "" && phoneTextField.text! != ""{
            saveBtn.isEnabled = true
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        checkTextFields()
        //saveBtn.isEnabled = true
    }
    
    //MARK: Segue way setup
    
    //segue way to return to the contacts view
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ReturnToContacts"{
             print("Yes")
            dismiss(animated: true, completion: nil)
        }
    }
    
    //MARK: calling setup
    
    //Used to make phone calls
    @IBAction func MakeACall(_ sender: AnyObject) {
        if phoneTextField.text != ""{
            print("Yes")
            if let url = URL(string: "tel://\(phoneTextField.text!)") {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }
        else{
            print("No")
            let alert = UIAlertController(title: "Error", message: "There's no phone number", preferredStyle: .alert)
            let exit = UIAlertAction(title: "OK", style: .default){
                (alertAction: UIAlertAction) in
            }
            
            alert.addAction(exit)
            self.present(alert, animated: true, completion:nil)
        }
    }
    
}
