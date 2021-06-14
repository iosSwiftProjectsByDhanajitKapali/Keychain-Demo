//
//  UserModel.swift
//  Keychain Demo
//
//  Created by unthinkable-mac-0025 on 10/06/21.
//

import Foundation

//M2
class UserModel: NSObject, NSCoding {
    
    var userName : String?
    var password : String?
    
    init(json: [String: Any])
    {
        self.userName = json["userName"] as? String
        self.password = json["password"] as? String
    }
    
    func encode(with aCoder: NSCoder)
    {
        aCoder.encode(self.userName, forKey: "userName")
        aCoder.encode(self.password, forKey: "password")
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        self.userName = aDecoder.decodeObject(forKey: "userName") as? String
        self.password = aDecoder.decodeObject(forKey: "password") as? String
    }
    
}

//M!
//class UserModel : NSObject, NSCoding{
//
//    let userName:String
//    let password:String
//
//    init(userName:String,password:String) {
//
//        self.userName = userName
//        self.password = password
//    }
//
//    func encode(with aCoder: NSCoder) {
//        aCoder.encode(userName, forKey: "userName")
//        aCoder.encode(password, forKey: "password")
//    }
//
//    convenience required init?(coder aDecoder: NSCoder) {
//
//        guard let userName = aDecoder.decodeObject(forKey: "userName") as? String,
//        let password = aDecoder.decodeObject(forKey: "password") as? String
//            else {
//                return nil
//        }
//        self.init(userName: userName, password: password)
//    }
//}
