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
    var newOne = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if index < data.count {
            nameTextField.text = data[index]//.name
        }
        else{
            nameTextField.text = ""
            newOne = 1
        }
        // Do any additional setup after loading the view.
    }

    @IBAction func backBtn(_ sender: AnyObject) {
        dismiss(animated: true, completion: nil)
    }
    

    
    /*@IBAction func saveBtn(_ sender: AnyObject) {
        if nameTextField.text != "" {
            data[index] = nameTextField.text!
            //minuto 10 para volver a ver lo del guardado de archivos
        }
    }*/
    
   //used to update or save new data
    /*override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if nameTextField.text != "" && segue.identifier == "SaveData"{
            //update new data
            //if newOne == 0{
                data[index] = nameTextField.text!
                let newData = segue.destination as? MainViewController
                newData?.contacts = data
            /*}
            //add new data
            else{
                let newData = segue.destination as? MainViewController
                let newIndexPath = NSIndexPath(row: (newData?.contacts.count)!, section: 0) as IndexPath
                newData?.contacts.append(nameTextField.text!)
                newData?.tableView.insertRows(at: [newIndexPath], with: .bottom)
            }*/
        }
    }*/
    
}
