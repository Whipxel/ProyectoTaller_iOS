//
//  Contact.swift
//  Panic Button
//
//  Created by MACBOOK on 11/30/16.
//  Copyright © 2016 Anexoft. All rights reserved.
//

import Foundation

class Contact: NSObject, NSCoding{
    
    struct Keys{
        static let Name = "name"
        static let Email = "email"
        static let Phone = "phone"
    }
    
    var data = Keys()
    
    var name: String
    var email: String
    var phone: String
    
   init?(name: String, email: String, phone: String){
        self.name = name
        self.email = email
        self.phone = phone
    
        super.init()
        if name.isEmpty || email.isEmpty || phone.isEmpty{
            return nil
        }
    }
    
    // MARK: NSCoding
    
    //loading objects
    required convenience init(coder decoder: NSCoder){
        /*if let nameObj = decoder.decodeObject(forKey: Keys.Name) as? String{
            name = nameObj
        }
        if let emailObj = decoder.decodeObject(forKey: Keys.Email) as? String{
            email = emailObj
        }
        if let phoneObj = decoder.decodeObject(forKey: Keys.Phone) as? String{
            email = phoneObj
        }*/
        let nameObj = decoder.decodeObject(forKey: Keys.Name) as? String
        let emailObj = decoder.decodeObject(forKey: Keys.Email) as? String
        let phoneObj = decoder.decodeObject(forKey: Keys.Phone) as? String
        
        self.init(name: nameObj!, email: emailObj!, phone: phoneObj!)!
    }
    
    //save objects
    func encode(with coder: NSCoder) {
        coder.encode(name, forKey: Keys.Name)
        coder.encode(email, forKey: Keys.Email)
        coder.encode(phone, forKey: Keys.Phone)
    }
}
