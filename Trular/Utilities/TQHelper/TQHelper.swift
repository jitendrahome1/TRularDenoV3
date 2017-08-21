//
//  TQHelper.swift
//  Trular
//
//  Created by Shivapurapu Mahendra on 29/05/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit

enum UserType {
    case Client
    case ClientAdmin
    case Vendor
    case VendorAdmin
}

enum InvitationSource {
    case received
    case sent
}

enum ClientType {
    case Company
    case Individual
}

enum EventType {
    case Call
    case Chat
    case Meeting
}

enum CalendarType {
    case DAY
    case WEEK
    case MONTH
    case YEAR
    case UPCOMING
}

enum ContactsInitialPage {
    case recent
    case contactsList
    case calls
    case messages
    case newContacts
}

enum ProfileType {
    case company
    case user
}


class TQHelper: NSObject {

    static let sharedInstance = TQHelper()
    
    var networkListener: ((_ reachable: Bool) -> ())?

    //Languages
    var currentLanguage = "en"
//    var currentBundle = Bundle.init(path: Bundle.main.path(forResource: "en", ofType: "lproj")!)
    
    //For Registration
    var didPressLogin = false
    var isForCompany = false
    var registrationInfoDict:Dictionary<String,AnyObject>?
    
    //For Login
    var loginInfoDict:Dictionary<String,AnyObject>?
    var toastSuperViewArray = [UIView]()
    
    //MARK:- Globals
    var currentUserType:UserType?
    var showSidePanel:Bool = false
    var showNavigationBar:Bool = false
    
    func shadowButtonColorWith(forShadowColor shadowColor:UIColor, senderBnt:UIButton){
        senderBnt.layer.cornerRadius = senderBnt.frame.height / 2
        senderBnt.layer.masksToBounds = true
        senderBnt.layer.shadowColor = shadowColor.cgColor
        senderBnt.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        senderBnt.layer.shadowOpacity = 3.0
        senderBnt.layer.shadowRadius = 1.0
    }
    
    func changeLanguageTo(language:String) {
        
        let path = Bundle.main.path(forResource: language, ofType: "lproj")
        
        if path != nil {
//            self.currentBundle = Bundle.init(path: path!)
        } else {
//            self.currentBundle = Bundle.init(path: Bundle.main.path(forResource: "en", ofType: "lproj")!)
        }
        
        //        changeLanguageBtn.setTitle(NSLocalizedString("BOOK_PURCHASE", tableName: nil, bundle: self.localeBundle, value: "Message", comment: "Message"), for: .normal)
        
//        UserDefaults.standard.set(["ja"], forKey: "AppleLanguages")
//        UserDefaults.standard.synchronize()
    }

}
