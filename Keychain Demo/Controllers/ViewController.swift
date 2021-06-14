//
//  ViewController.swift
//  Keychain Demo
//
//  Created by unthinkable-mac-0025 on 10/06/21.
//

import UIKit
import SwiftKeychainWrapper

class ViewController: UIViewController {

    
    var userDetailsArr = [UserModel]()
    
    //var userDetailsArr = [UserDetails]()
    
    @IBOutlet var userImage: UIImageView!
    @IBOutlet var userName: UITextField!
    @IBOutlet var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //Initializing userDetailsArr
        if let items = KeychainWrapper.standard.object(forKey: "items"){
            if let userModelArray = items as? [UserModel] {
                userDetailsArr = userModelArray
            }
        }
    
    }

    @IBAction func loginButtonPressed(_ sender: UIButton) {
        
        let user_name : String = userName.text!
        let pass :String = password.text!
        if user_name != "" && pass != "" {
            
            
            let newUser = UserModel(json: ["userName" : user_name, "password" : pass])
            userDetailsArr.append(newUser)
            let encodedData = NSKeyedArchiver.archivedData(withRootObject: userDetailsArr)
            KeychainWrapper.standard.set(encodedData, forKey: "items")
            
            print("saved items to keychain, jumping to UserDetails VC")
 
        }
    } //:loginButtonPressed
    
    @IBAction func clearKeychainButtonPressed(_ sender: UIButton) {
        print("clearing keychain")
//        KeychainWrapper.standard.remove(forKey: "items")
//        KeychainWrapper.standard.removeObject(forKey: "items", withAccessibility: .always, isSynchronizable: true)
//        KeychainWrapper.standard.removeObject(forKey: "items")
//        KeychainWrapper.standard.removeAllKeys()
        
        let secItemClasses = [kSecClassGenericPassword, kSecClassInternetPassword, kSecClassCertificate, kSecClassKey, kSecClassIdentity]
        for itemClass in secItemClasses {
            let spec: NSDictionary = [kSecClass: itemClass]
            SecItemDelete(spec)
        }
    }
    
    
}


struct UserDetails : Codable{
    let firstName : String
    let password : String
}


