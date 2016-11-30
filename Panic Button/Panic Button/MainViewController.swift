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
    var contacts = [ "contact_1", "contact 2", "contact 3", "contact 4", "contact 5"]
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        //loadData()
        tableView.reloadData()
        
    }
    
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
        cell.textLabel?.text = contacts[indexPath.row]
        return cell
    }
    
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
    }
    
    //Used to cancel to add action and return to the main view controller
    @IBAction func backBtn(_ segue: UIStoryboardSegue) {
        dismiss(animated: true, completion: nil)
    }
    
    //This function is used to save or update a table view cell on this view controller. The function is
    //connected to a nav bar button on addviewcontroller and works with a segue way connected to it.
    @IBAction func saveBtn(_ sender: UIStoryboardSegue){
        if let newContact = sender.source as? AddViewController{
            if let select = tableView.indexPathForSelectedRow{
                //update a cell
                contacts[select.row] = newContact.nameTextField.text!
                tableView.reloadData()
                dismiss(animated: true, completion: nil)
                
             }
            else{
                //add a new cell
                contacts.append(newContact.nameTextField.text!)
                tableView.reloadData()
                dismiss(animated: true, completion: nil)
            }
        }
    }
    
    
    //Used to delete a row using a swipe gesture on a table view cell
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            contacts.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}
