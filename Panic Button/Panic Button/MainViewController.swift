//
//  MainViewController.swift
//  Panic Button
//
//  Created by Erick Valentin Blanco Puerto on 11/17/16.
//  Copyright © 2016 Anexoft. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    //var contacts = [String()]
    var contacts = [Contact]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        loadData()
    }
    
    //MARK: Persistence setup
    
    //Determines the filepath to save the data used in the application
    var filePath: String {
        let manager = FileManager.default
        let url = manager.urls(for: .documentDirectory, in: .userDomainMask).first
        return url!.appendingPathComponent("Data").path
    }
    
    //loads the saved data in the application
    private func loadData(){
        if let dataIn = NSKeyedUnarchiver.unarchiveObject(withFile: filePath) as? [Contact]{
            contacts = dataIn
        }
        else{
            let sample = Contact(name: "911",email: "911@mail.com", phone: "911")
            contacts.append(sample!)
        }
    }
    
    //Saves the new data iserted by the user in the specified file path
    private func saveData(contact: Contact){
        contacts.append(contact)
        NSKeyedArchiver.archiveRootObject(contacts, toFile: filePath)
    }
    
    //MARK: Table view setup
    
    //Determinates the number of sections in the table view
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //Return the number of rows nedded in the app
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    
    //Return an object of table view cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = UITableViewCell()
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContactCell", for: indexPath)
        cell.textLabel?.text = contacts[indexPath.row].name
        return cell
    }
    
    //MARK: Segue setup
    
    //Move to the addViewController touching a row
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let index = tableView.indexPathForSelectedRow!.row
        performSegue(withIdentifier: "showDetail", sender: index)
        
    }
    
    //Accesing to addViewController and pass the data from mainviewcontroller
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail"{
            if let index = sender as? Int{
                let guest = segue.destination as! AddViewController
                guest.data = contacts
                guest.index = index
            }
        }
        else if segue.identifier == "ReturnToSend"{
            print("Yes")
            dismiss(animated: true, completion: nil)
        }
    }
    
    //This function is used to save or update a table view cell on this view controller. The function is
    //connected to a nav bar button on addviewcontroller and works with a segue way connected to it.
    @IBAction func saveBtn(_ sender: UIStoryboardSegue){
        if let newContact = sender.source as? AddViewController{
            if let select = tableView.indexPathForSelectedRow{
                //update a cell if theres data in the text fields
                if newContact.nameTextField.text != "" && newContact.emailTextField.text != "" && newContact.phoneTextField.text != ""{                     contacts[select.row].name = newContact.nameTextField.text!
                    contacts[select.row].email = newContact.emailTextField.text!
                    contacts[select.row].phone = newContact.phoneTextField.text!
                    //Guardar los cambios realizados
                    NSKeyedArchiver.archiveRootObject(contacts, toFile: filePath)
                    tableView.reloadData()
                }
 
             }
            else{
                //add a new cell if theres data on the text fields
                if newContact.nameTextField.text != "" && newContact.emailTextField.text != "" && newContact.phoneTextField.text != ""{
                    let new = Contact(name: newContact.nameTextField.text!, email: newContact.emailTextField.text!, phone: newContact.phoneTextField.text!)
                    saveData(contact: new!)
                    tableView.reloadData()
                }
            }
            
        }
        //dismiss(animated: true, completion: nil)
    }
    
    //MARK: Deletion action
    
    //Used to delete a row using a swipe gesture on a table view cell
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            contacts.remove(at: indexPath.row)
            //Guardar los cambios realizados
            NSKeyedArchiver.archiveRootObject(contacts, toFile: filePath)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}
