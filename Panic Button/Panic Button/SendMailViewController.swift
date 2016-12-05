//
//  SendMailViewController.swift
//  Panic Button
//
//  Created by Erick Valentin Blanco on 12/1/16.
//  Copyright © 2016 Anexoft. All rights reserved.
//

import UIKit
import MessageUI

class SendMailViewController: UIViewController, MFMailComposeViewControllerDelegate {

    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    var contacts = [Contact]()

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
            print("No data")
            let sample = Contact(name: "911",email: "911@mail.com", phone: "911")
            contacts.append(sample!)
        }
    }
    
    @IBAction func SendMail(_ sender: UIButton) {
        let mail = MFMailComposeViewController()
        var recipients = [String()]
        mail.mailComposeDelegate = self
        
        // Configure the fields of the interface.
        loadData()
        
        for mails in contacts{
            recipients.append(mails.email)
            print(mails.email)
        }
        
        mail.setToRecipients(recipients)
        mail.setSubject("Hello!")
        mail.setMessageBody("Hello this is my message body!", isHTML: false)
        //these next 2 lines attach the photo to the emailabout to send
        /*var screenshot = screenShotMethod()
         let imageData: NSData = UIImagePNGRepresentation(screenshot)!
         mail.addAttachmentData(imageData, mimeType: "image/png", fileName: "imageName")*/
        
        // Present the view controller modally.
        if MFMailComposeViewController.canSendMail() {
            self.present(mail, animated: true, completion: nil)
    
        }
        else{
            let alert = UIAlertController(title: "Error", message: "Mail services are not available", preferredStyle: .alert)
            let exit = UIAlertAction(title: "Ok", style: .default){
                (alertAction: UIAlertAction) in
            }
            
            alert.addAction(exit)
            self.present(alert, animated: true, completion: nil)
            print("Mail services are not available")
            return
        }
        
    }
    
    //Used to return from the mail view controller
    func mailComposeController(_ controller: MFMailComposeViewController,
                               didFinishWith result: MFMailComposeResult, error: Error?) {
        // Check the result or perform other tasks.
        // Dismiss the mail compose view controller.
        controller.dismiss(animated: true, completion: nil)
    }
    
    //Method used to take an screenshoot
    func screenShotMethod() -> UIImage{
        //Create the UIImage
        UIGraphicsBeginImageContext(view.frame.size)
        view.layer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
        
        //Save it to the camera roll (only for testing porpuse)
        //UIImageWriteToSavedPhotosAlbum(image!, nil, nil, nil)
    }
}
