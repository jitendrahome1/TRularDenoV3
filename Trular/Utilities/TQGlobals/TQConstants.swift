//
//  CMConstants.swift
//  CiplaMed
//
//  Created by Priyam Dutta on 14/07/16.
//  Copyright © 2016 Indus Net Technologies. All rights reserved.
//

import Foundation
import UIKit

//MARK:- IDs and Keys
struct constantIDs {
   }
let applicationBaseURL = ""

//MARK:- STORYBOARDS
let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
let dashboardStoryboard: UIStoryboard = UIStoryboard(name: "Dashboard", bundle: nil)
let settingsStoryboard: UIStoryboard = UIStoryboard(name: "Settings", bundle: nil)
let profilePageStoryboard: UIStoryboard = UIStoryboard(name: "ProfilePage", bundle: nil)
let userListStoryboard: UIStoryboard = UIStoryboard(name: "UserList", bundle: nil)
let messagesStoryboard: UIStoryboard = UIStoryboard(name: "Messages", bundle: nil)
let quotesStoryboard: UIStoryboard = UIStoryboard(name: "Quotes", bundle: nil)
let inquiriesStoryboard: UIStoryboard = UIStoryboard(name: "Inquiries", bundle: nil)
let leaderboardStoryboard: UIStoryboard = UIStoryboard(name: "Leaderboard", bundle: nil)
let otherStoryboard: UIStoryboard = UIStoryboard(name: "Other", bundle: nil)
let analyticsStoryboard: UIStoryboard = UIStoryboard(name: "Analytics", bundle: nil)
let ChartsStoryboard: UIStoryboard = UIStoryboard(name: "Charts", bundle: nil)

//MARK: User Defaults Keys

//MARK:- API Endpoints
//MARK: Login and Registration related endpoints

//MARK: Dashboard

//MARK:- /*--------------------APP RELATED GLOBAL CONSTANTS AND METHODS--------------------*/
let VERSION_NUMBER = Bundle.main.infoDictionary!["CFBundleShortVersionString"]!
let SYSTEM_VERSION = UIDevice.current.systemVersion
let SCREEN_WIDTH = UIScreen.main.bounds.width
let SCREEN_HEIGHT = UIScreen.main.bounds.height
//let NAVIGATION_BAR_HEIGHT = CMNavigationHelper.helper.navigationController.navigationBar.frame.height
let TEST_VIDEO = "rtsp://184.72.239.149/vod/mp4:BigBuckBunny_115k.mov"



let DEFAULT_COLOR: UIColor = .white // UIColorRGB(0, g: 179, b: 255)!
let LIST_LIGHT_GRAY_COLOR = UIColorRGB(242, g: 242, b: 242)!

let FONT_NAME = "HelveticaNeue"
let MEDIUM_FONT_NAME = "HelveticaNeue-Medium"
let BOLD_FONT_NAME = "HelveticaNeue-Bold"
let LIGHT_FONT_NAME = "HelveticaNeue-Light"

/*HelveticaNeue-Bold,
 HelveticaNeue-CondensedBlack,
 HelveticaNeue-Medium,
 HelveticaNeue,
 HelveticaNeue-Light,
 HelveticaNeue-CondensedBold,
 HelveticaNeue-LightItalic,
 HelveticaNeue-UltraLightItalic,
 HelveticaNeue-UltraLight,
 HelveticaNeue-BoldItalic,
 HelveticaNeue-Italic*/

let NUMERICS = "0123456789"
let ALPHABETS = "qwertyuiopasdfghjklzxcvbnm QWERTYUIOPASDFGHJKLZXCVBNM_"

//MARK: UNICODE
let bulletUnicode = " \u{2022} "

func IS_RETINA() -> Bool {
    return (UIScreen.main.responds(to: #selector(UIScreen.displayLink(withTarget:selector:))) && UIScreen.main.scale >= 2.0)
}

func IS_OF_4_INCH() -> Bool {
    switch UIDevice.current.modelName {
    case .iPhone5, .iPhone5S, .iPhone5C, .iPhoneSE:
        return true
    default:
        return false
    }
}

func IS_OF_5_INCH() -> Bool {
    switch UIDevice.current.modelName {
    case .iPhone6, .iPhone6S:
        return true
    default:
        return false
    }
}

func IS_OF_PLUS() -> Bool {
    switch UIDevice.current.modelName {
    case .iPhone6Plus, .iPhone6SPlus:
        return true
    default:
        return false
    }
}

func IS_IPHONE_4S() -> Bool {
    
      return UIDevice.current.userInterfaceIdiom == .phone && max(UIScreen.main.bounds.size.width, UIScreen.main.bounds.size.height) < 568.0
}

func IS_IPAD() -> Bool {
    
    switch UIDevice.current.userInterfaceIdiom {
    case .phone: // It's an iPhone
        return false
    case .pad: // It's an iPad
        return true
    case .unspecified: // undefined
        return false
    default:
        return false
    }
}

// MARK:-  This is define button name,  BUTTON NAME CONSIST OF  IN ASSETS

let MENU_IMG = "Hamburger"
let BACK_GRAYG = "BackGray"
let BACK_BLACK = "BackBlack"
let BACK_WHITE = "BackWhite"

let NOTIFICATION_IMG = "Notification"
 //***********************************************************************

//func currentViewController() -> UIViewController {
//    return TQNavigationHelper.sharedInstance.navigationController.viewControllers.last!
//}

func isValidEmail(testStr:String) -> Bool {
    
    let __firstpart = "[A-Z0-9a-z]([A-Z0-9a-z._%+-]{0,30}[A-Z0-9a-z])?"
    let __serverpart = "([A-Z0-9a-z]([A-Z0-9a-z-]{0,30}[A-Z0-9a-z])?\\.){1,5}"
    let __emailRegex = String(format: "%@@%@[A-Za-z]{2,63}",__firstpart,__serverpart)
    
//    let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
    
    let emailTest = NSPredicate(format:"SELF MATCHES %@", __emailRegex)
    return emailTest.evaluate(with: testStr)
}

func nullToNil(_ value: AnyObject?) -> AnyObject? {
    if value is NSNull {
        return nil
    } else {
        return value
    }
}

func SET_OBJ_FOR_KEY(_ obj: AnyObject, key: String) {
    UserDefaults.standard.set(obj, forKey: key)
}

func OBJ_FOR_KEY(_ key: String) -> AnyObject? {
    if UserDefaults.standard.object(forKey: key) != nil {
        return UserDefaults.standard.object(forKey: key)! as AnyObject
    }
    return nil
}

func SET_INTEGER_FOR_KEY(_ integer: Int, key: String) {
    UserDefaults.standard.set(integer, forKey: key)
}

func INTEGER_FOR_KEY(_ key: String) -> Int? {
    return UserDefaults.standard.integer(forKey: key)
}

func SET_FLOAT_FOR_KEY(_ float: Float, key: String) {
    UserDefaults.standard.set(float, forKey: key)
}

func FLOAT_FOR_KEY(_ key: String) -> Float? {
    return UserDefaults.standard.float(forKey: key)
}

func SET_BOOL_FOR_KEY(_ bool: Bool, key: String) {
    UserDefaults.standard.set(bool, forKey: key)
}

func BOOL_FOR_KEY(_ key: String) -> Bool {
    return UserDefaults.standard.bool(forKey: key)
}

func REMOVE_OBJ_FOR_KEY(_ key: String) {
    UserDefaults.standard.removeObject(forKey: key)
}

func UIColorRGB(_ r: CGFloat, g: CGFloat, b: CGFloat) -> UIColor? {
    return UIColor(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: 1.0)
}

func UIColorRGBA(_ r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) -> UIColor? {
    return UIColor(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: a)
}

func FIRST_WINDOW() -> AnyObject? {
    return UIApplication.shared.windows.first!
}

func APP_DELEGATE() -> AppDelegate? {
    return UIApplication.shared.delegate as? AppDelegate
}

func SWIFT_CLASS_STRING(_ className: String) -> String? {
    return "\(Bundle.main.infoDictionary!["CFBundleName"] as! String).\(className)";
}

func PRIMARY_FONT(_ size: CGFloat) -> UIFont? {
    return UIFont(name: FONT_NAME, size: size)!
}

func BOLD_FONT(_ size: CGFloat) -> UIFont? {
    return UIFont(name: BOLD_FONT_NAME, size: size)!
}

func GET_RADIAN_FROM(_ degree: CGFloat) -> CGFloat? {
    return CGFloat(degree * CGFloat(Double.pi) / 180.0)
}

func loggingPrint<T>( _ object: @autoclosure () -> T, _ file: String = #file, _ function: String = #function, _ line: Int = #line) {
    #if DEBUG
        let value = object()
        
        print(value)
    #endif
}

/*
 if #available(iOS 9.0, *)
 {
 //System version is more than 9.0
 }
 else
 {
 
 }
 */
