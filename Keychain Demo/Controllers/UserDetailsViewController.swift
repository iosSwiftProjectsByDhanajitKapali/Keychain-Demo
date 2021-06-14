//
//  UserDetailsViewController.swift
//  Keychain Demo
//
//  Created by unthinkable-mac-0025 on 10/06/21.
//

import UIKit
import SwiftKeychainWrapper

class UserDetailsViewController: UIViewController {

    var userDetailsArr = [UserModel]()
    
    //var userDetailsArr = [UserDetails]()
    
    @IBOutlet var userName: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        //getting data from UserDefaults
        var decodedArray : [UserModel] = []
        if let items = KeychainWrapper.standard.object(forKey: "items"){
            if let userModelArray = items as? [UserModel] {
                decodedArray = userModelArray
            }
        }
        userDetailsArr = decodedArray
        print(userDetailsArr.count)
        

        
    }
    


}
