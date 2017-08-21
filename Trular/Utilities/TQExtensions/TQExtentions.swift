//
//  Extentions.swift
//  Trular
//
//  Created by Shivapurapu Mahendra on 30/05/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import Foundation
import UIKit
import WebKit
import Charts

//MARK:- Subclasses

//MARK:- TQButton
class TQButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.isExclusiveTouch = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.isExclusiveTouch = true
    }
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        let errorMargin :CGFloat = 30.0
        
        let largerFrame :CGRect?

        if self.tag == 1001 {
            
            largerFrame = CGRect(x: 0 - errorMargin, y: 0 - errorMargin, width: self.frame.width + (errorMargin * 1.5), height: self.frame.height + (errorMargin * 2.0))
            
        } else if self.tag == 1002 {
            
            largerFrame = CGRect(x: 0 - errorMargin, y: 0 - errorMargin, width: self.frame.width + (errorMargin * 1.5), height: self.frame.height + (errorMargin * 2.0))
            
        } else if self.tag == 101 {
            
            largerFrame = CGRect(x: 0 - errorMargin / 2, y: 0 - errorMargin, width: self.frame.width + (errorMargin * 0.5), height: self.frame.height + (errorMargin * 2.0))
            
        } else if self.tag == 102 {
            
            largerFrame = CGRect(x: 0 - errorMargin / 2, y: 0 - errorMargin, width: self.frame.width + (errorMargin * 0.5), height: self.frame.height + (errorMargin * 2.0))
            
        } else {
            return self
        }
        return (largerFrame!.contains(point) == true) ? self : nil;
    }
}

class TQSwitchButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setImage(#imageLiteral(resourceName: "green_switch"), for: .selected)
        self.setImage(#imageLiteral(resourceName: "switchOff"), for: .normal)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    override var isSelected: Bool {
        willSet {
            print("changing from \(isSelected) to \(newValue)")
        }
        
        didSet {
            print("changed from \(oldValue) to \(isSelected)")
            self.isSelected = !isSelected
        }
    }
}

//MARK:- Extensions

//MARK: Label

//MARK:- Array
extension Array where Element: Comparable {
    
    mutating func removeObject(_ object: Element) {
        if let index = self.index(of: object) {
            self.remove(at: index)
        }
    }
    
    mutating func removeObjects(_ objectArray: [Element])
    {
        for object in objectArray {
            self.removeObject(object)
        }
    }
}

extension Array {
    
    func containsObject(_ type: AnyClass) -> (isPresent: Bool, index: Int?) {
        for (index, item) in self.enumerated() {
            if (item as AnyObject).isKind(of: type) {
                return (true, index)
            }
        }
        return (false, nil)
    }
    
    func indexOfObject(_ type: AnyObject) ->  Int? {
        for (index, item) in self.enumerated() {
            if (item as AnyObject) === type {
                return index
            }
        }
        return  nil
    }
    
}

//MARK:- Dictionary
extension Dictionary where Value: Equatable {
    func allKeysForValue(_ val: Value) -> [Key] {
        return self.filter { $1 == val }.map { $0.0 }
    }
}

//MARK:- UIView
extension UIView {
    func showToastWithMessage(_ message: String) {
        if message.length > 0 {
            UIApplication.shared.windows.first?.makeToast(message, duration: 1.0, position: CGPoint(x: SCREEN_WIDTH / 2.0, y: SCREEN_HEIGHT - 75))
        }
    }
}

//MARK:- UIAlertController
extension UIAlertController {
    
    public class func showStandardAlertWithOnlyOK(_ title: String, alertText: String, selected_: @escaping (_ index: Int) -> ()) -> UIAlertController {
        let alert = UIAlertController(title: title, message: alertText, preferredStyle: .alert)
        alert.view.tintColor = DEFAULT_COLOR
        let doneAction = UIAlertAction(title: OK, style: .default) { (action) in
            selected_(0)
        }
        alert.addAction(doneAction)
        return alert
    }
    
    public class func showStandardAlertWith(_ title: String, alertText: String, selected_: @escaping (_ index: Int) -> ()) -> UIAlertController {
        let alert = UIAlertController(title: title, message: alertText, preferredStyle: .alert)
        alert.view.tintColor = DEFAULT_COLOR
        let cancelAction = UIAlertAction(title: CANCEL, style: .cancel) { (action) in
            selected_(0)
        }
        alert.addAction(cancelAction)
        let doneAction = UIAlertAction(title: OK, style: .default) { (action) in
            selected_(1)
        }
        alert.addAction(doneAction)
        return alert
    }
    
    public class func showStandardAlertWith(_ title: String, alertText: String, positiveButtonText: String?, negativeButtonText: String?, selected_: @escaping (_ index: Int) -> ()) -> UIAlertController {
        let alert = UIAlertController(title: title, message: alertText, preferredStyle: .alert)
        // alert.view.tintColor = DEFAULT_COLOR
        let cancelAction = UIAlertAction(title: negativeButtonText, style: .cancel) { (action) in
            selected_(0)
        }
        alert.addAction(cancelAction)
        let doneAction = UIAlertAction(title: positiveButtonText, style: .default) { (action) in
            selected_(1)
        }
        alert.addAction(doneAction)
        return alert
    }
    
    public class func showStandardActionSheetWith(_ title: String, messageText: String, arrayButtons: [String], cancleButtonTitle: String, selectedIndex: @escaping (_ index: Int) -> ()) -> UIAlertController {
        let actionSheet = UIAlertController(title: title, message: messageText, preferredStyle: .actionSheet)
        let cancelAction = UIAlertAction(title: cancleButtonTitle, style: .cancel) { (action) in
            
        }
        actionSheet.addAction(cancelAction)
        for (index, item) in arrayButtons.enumerated() {
            let buttonAction = UIAlertAction(title: item, style: .default, handler: { (action) in
                selectedIndex(index)
            })
            actionSheet.addAction(buttonAction)
        }
        return actionSheet
    }
    
    public class func showStandardAlertWithTextField(_ title: String, alertText: String, selected_: @escaping (_ index: Int, _ email: String) -> ()) -> UIAlertController {
        let alert = UIAlertController(title: title, message: alertText, preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.placeholder = "Enter email"
            textField.keyboardType = .emailAddress
        }
        alert.view.tintColor = DEFAULT_COLOR
        let cancelAction = UIAlertAction(title: CANCEL, style: .default) { (action) in
            selected_(0, "")
        }
        alert.addAction(cancelAction)
        let doneAction = UIAlertAction(title: OK, style: .default) { (action) in
            selected_(1, alert.textFields![0].text!)
        }
        alert.addAction(doneAction)
        return alert
    }
}

//MARK:- NSDate
extension Date {
    
    func dateToStringWithCustomFormat (_ format: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.timeZone = TimeZone.autoupdatingCurrent
        return dateFormatter.string(from: self)
    }
    
    static func dateFromTimeInterval(_ timeInterval: Double) -> Date {
        return Date(timeIntervalSince1970: timeInterval)
    }
    
    func getFormattedStringWithFormat() -> String? {
        return "\(getDay())\(getDateSuffixForDate(isUppercase: false)!) \(getThreeCharacterMonth()) '\(getTwoDigitYear())"
    }
    
    func getDateSuffixForDate(isUppercase:Bool) -> (String?) {
        let ones = getDay() % 10
        let tens = (getDay() / 10) % 10
        if (tens == 1) {
            return isUppercase ? "TH" : "th"
        } else if (ones == 1) {
            return isUppercase ? "ST" : "st"
        } else if (ones == 2) {
            return isUppercase ? "ND" : "nd"
        } else if (ones == 3) {
            return isUppercase ? "RD" : "rd"
        } else {
            return isUppercase ? "TH" : "th"
        }
    }
    
    func getDay() -> (Int) {
        let calendar = Calendar(identifier: Calendar.Identifier.gregorian)
        let components = (calendar as NSCalendar?)?.components(.day, from: self)
        return components!.day!
    }
    
    func getMonth() -> (String) {
        let calendar = Calendar(identifier: Calendar.Identifier.gregorian)
        let components = (calendar as NSCalendar?)?.components(.month, from: self)
        let dateFormatter = DateFormatter()
        return dateFormatter.monthSymbols[(components?.month)! - 1]
    }
    
    func getThreeCharacterMonth() -> (String) {
        return getMonth().substring(to: getMonth().characters.index(getMonth().startIndex, offsetBy: 3))
    }
    
    func getYear() -> (Int) {
        let calendar = Calendar(identifier: Calendar.Identifier.gregorian)
        let components = (calendar as NSCalendar?)?.components(.year, from: self)
        return components!.year!
    }
    
    func getTwoDigitYear() -> (Int) {
        return getYear() % 100
    }
    
    static func convertTimeStampToDate(_ timeInterval: Double) -> String {
        let date = Date(timeIntervalSince1970: timeInterval)
        let dayTimePeriodFormatter = DateFormatter()
        dayTimePeriodFormatter.dateFormat = "dd MMM, YYYY"
        let dateString = dayTimePeriodFormatter.string(from: date)
        return dateString
    }
    
    static func getTimeStamp() -> String {
        return "\(Date().timeIntervalSince1970 * 1000)"
    }
}

//MARK:- UIColor
extension UIColor {
    
    static func changeListColor(_ index: Int) -> UIColor {
        if index % 2 == 0 {
            return .white
        } else {
            return LIST_LIGHT_GRAY_COLOR
        }
        
    }
    
    static func colorWithHexString(_ hexString: String) -> UIColor {
        var cString: String = hexString.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString = cString.substring(from: cString.characters.index(cString.startIndex, offsetBy: 1))
        }
        
        if ((cString.characters.count) != 6) {
            return .gray
        }
        
        var rgbValue: UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}

//MARK:- String
extension String {
    
    func index(of string: String, options: CompareOptions = .literal) -> Index? {
        return range(of: string, options: options)?.lowerBound
    }
    
    public func toFloat() -> Float? {
        return Float.init(self)
    }
    
    public func toDouble() -> Double? {
        return Double.init(self)
    }
    
    func stringToDateWithCustomFormat(_ format: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.timeZone = TimeZone.autoupdatingCurrent
        return dateFormatter.date(from: self)!
    }
    
    var length: Int {
        return characters.count
    }
    
    func getLinkFromHTML() -> String {
        let types: NSTextCheckingResult.CheckingType = .link
        let detector = try? NSDataDetector(types: types.rawValue)
        guard let detect = detector else {
            return self
        }
        
        let matches = detect.matches(in: self, options: .reportCompletion, range: NSMakeRange(0, self.characters.count))
        for match in matches {
            loggingPrint(match.url!.absoluteString)
        }
        return (matches.first?.url!.absoluteString)!
    }
    
    func getHTMLEncodedString() -> String {
        let htmEncodeString = self.decodingHTMLEntities()
        let encodePlainText = htmEncodeString?.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
        return encodePlainText!
    }
    
    var stringByRemovingCarriageReturnLineFeedCharacterSet: String {
        return self.replacingOccurrences(of: "\r\n", with: "", options: NSString.CompareOptions.literal, range:nil)
    }
    
    /*func getJustifiedString() -> NSAttributedString {
     let paragraphStyle = NSMutableParagraphStyle()
     paragraphStyle.alignment = NSTextAlignment.justified
     let attributedString = NSAttributedString(string: self,
     attributes: [
     NSParagraphStyleAttributeName: paragraphStyle,
     NSBaselineOffsetAttributeName: NSNumber(value: 0 as Float),
     NSFontAttributeName: PRIMARY_FONT(CGFloat(FLOAT_FOR_KEY(kFontSize)!))!])
     return attributedString
     }*/
    
    // Replace space with %20
    func urlEncode() -> String {
        var string = self
        if string.containsEmoji {
            let data: Data = string.data(using: String.Encoding.nonLossyASCII)!
            string = NSString(data: data, encoding: String.Encoding.utf8.rawValue)! as String
            string = string.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        }
        
        if self.contains(" ") || self.contains("+") {
            string = string.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
            if string.contains("+") {
                return string.replacingOccurrences(of: "+", with: "%2B")
            }
            return string
        }
        return string
    }
    
    var containsEmoji: Bool {
        for scalar in unicodeScalars {
            switch scalar.value {
            case 0x1F600...0x1F64F, // Emoticons
            0x1F300...0x1F5FF, // Misc Symbols and Pictographs
            0x1F680...0x1F6FF, // Transport and Map
            0x2600...0x26FF,   // Misc symbols
            0x2700...0x27BF,   // Dingbats
            0xFE00...0xFE0F:   // Variation Selectors
                return true
            default:
                continue
            }
        }
        return false
    }
    
    // To check text field or String is blank or not
    public var isBlank: Bool {
        get {
            let trimmed = trimmingCharacters(in: CharacterSet.whitespaces)
            return trimmed.isEmpty
        }
    }
    
    // Number Checking
    func isNumber() -> Bool {
        let numberCharacters = CharacterSet.decimalDigits.inverted
        return !self.isEmpty && self.rangeOfCharacter(from: numberCharacters) == nil
    }
    
    // Validate Phone number
    var isPhoneNumber: Bool {
        do {
            let detector = try NSDataDetector(types: NSTextCheckingResult.CheckingType.phoneNumber.rawValue)
            let matches = detector.matches(in: self, options: [], range: NSMakeRange(0, self.characters.count))
            if let res = matches.first {
                return res.resultType == .phoneNumber && res.range.location == 0 && res.range.length == self.characters.count
            } else {
                return false
            }
        } catch {
            return false
        }
    }
    
    // Validate Email
    var isValidEmail: Bool {
        
        //HapHealth
        let __firstpart = "[A-Z0-9a-z]([A-Z0-9a-z._%+-]{0,30}[A-Z0-9a-z])?"
        let __serverpart = "([A-Z0-9a-z]([A-Z0-9a-z-]{0,30}[A-Z0-9a-z])?\\.){1,5}"
        let __emailRegex = __firstpart+"@"+__serverpart+"[A-Za-z]{2,63}"
        
        //CiplaMed
        let emailRegEx = "^(?:(?:(?:(?: )*(?:(?:(?:\\t| )*\\r\\n)?(?:\\t| )+))+(?: )*)|(?: )+)?(?:(?:(?:[-A-Za-z0-9!#$%&’*+/=?^_'{|}~]+(?:\\.[-A-Za-z0-9!#$%&’*+/=?^_'{|}~]+)*)|(?:\"(?:(?:(?:(?: )*(?:(?:[!#-Z^-~]|\\[|\\])|(?:\\\\(?:\\t|[ -~]))))+(?: )*)|(?: )+)\"))(?:@)(?:(?:(?:[A-Za-z0-9](?:[-A-Za-z0-9]{0,61}[A-Za-z0-9])?)(?:\\.[A-Za-z0-9](?:[-A-Za-z0-9]{0,61}[A-Za-z0-9])?)*)|(?:\\[(?:(?:(?:(?:(?:[0-9]|(?:[1-9][0-9])|(?:1[0-9][0-9])|(?:2[0-4][0-9])|(?:25[0-5]))\\.){3}(?:[0-9]|(?:[1-9][0-9])|(?:1[0-9][0-9])|(?:2[0-4][0-9])|(?:25[0-5]))))|(?:(?:(?: )*[!-Z^-~])*(?: )*)|(?:[Vv][0-9A-Fa-f]+\\.[-A-Za-z0-9._~!$&'()*+,;=:]+))\\])))(?:(?:(?:(?: )*(?:(?:(?:\\t| )*\\r\\n)?(?:\\t| )+))+(?: )*)|(?: )+)?$"
        
        let emailTest = NSPredicate(format: "SELF MATCHES %@", __emailRegex)
        let result = emailTest.evaluate(with: self)
        return result
    }
    
    func heightWithConstrainedWidth(_ width: CGFloat, font: UIFont) -> CGFloat {
        return self.getLabelSize(forWidth: width, with: font).height
    }
    
    func returnCroppedString(with width: CGFloat, font: UIFont, constantHeight: CGFloat) -> String {
        var wordCount = 0
        var croppedString = ""
        let range = self.startIndex..<self.endIndex
        self.enumerateSubstrings(in: range, options: .byWords) { (substring, substringRange, enclosingRange, stop) in
            if croppedString.heightWithConstrainedWidth(width, font: font) < constantHeight {
                croppedString += " " + substring!
                wordCount += 1
            } else {
                stop = true
            }
        }
        let index: String.Index = croppedString.characters.index(croppedString.startIndex, offsetBy: croppedString.length - Int(width / font.pointSize) - 10)
        return croppedString.substring(to: index) + "..."
    }
}

//MARK:- UIViewController
extension UIViewController {
    func registerForKeyboardWillShowNotification(_ scrollView: UIScrollView, usingBlock block: ((CGSize?) -> Void)? = nil) {
        NotificationCenter.default.addObserver(forName: NSNotification.Name.UIKeyboardWillShow, object: nil, queue: nil, using: { (notification) -> Void in
            let userInfo = notification.userInfo!
            let keyboardSize = (userInfo[UIKeyboardFrameEndUserInfoKey]! as AnyObject).cgRectValue.size
            let contentInsets = UIEdgeInsetsMake(scrollView.contentInset.top, scrollView.contentInset.left, keyboardSize.height, scrollView.contentInset.right)
            
            scrollView.setContentInsetAndScrollIndicatorInsets(contentInsets)
            block?(keyboardSize)
        })
    }
    
    func registerForKeyboardWillHideNotification(_ scrollView: UIScrollView, usingBlock block: ((Void) -> Void)? = nil) {
        NotificationCenter.default.addObserver(forName: NSNotification.Name.UIKeyboardWillHide, object: nil, queue: nil, using: { (notification) -> Void in
            let contentInsets = UIEdgeInsetsMake(scrollView.contentInset.top, scrollView.contentInset.left, 0, scrollView.contentInset.right)
            scrollView.setContentInsetAndScrollIndicatorInsets(contentInsets)
            block?()
        })
    }
}

//MARK:- UIScrollView
extension UIScrollView {
    func setContentInsetAndScrollIndicatorInsets(_ edgeInsets: UIEdgeInsets) {
        self.contentInset = edgeInsets
        self.scrollIndicatorInsets = edgeInsets
    }
}

//MARK:- Int
extension Int {
    var degreesToRadians: Double { return Double(self) * .pi / 180 }
}

//MARK:- Floating Point
extension FloatingPoint {
    var degreesToRadians: Self { return self * .pi / 180 }
    var radiansToDegrees: Self { return self * 180 / .pi }
}

//MARK:- Floating Point
extension NSLayoutConstraint {
    func constraintWithMultiplier(_ multiplier: CGFloat) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: self.firstItem, attribute: self.firstAttribute, relatedBy: self.relation, toItem: self.secondItem, attribute: self.secondAttribute, multiplier: multiplier, constant: self.constant)
    }
}

//MARK:- CGPoint
extension CGPoint {
    
    func distance(toPoint p:CGPoint) -> CGFloat {
        return sqrt(pow(x - p.x, 2) + pow(y - p.y, 2))
    }
}

//MARK:- UIButton 
extension UIButton {
    
    func centerVerticallyWithPadding(padding:CGFloat) {
        
        let imageSize = self.imageView?.frame.size
        let titleSize = self.titleLabel?.frame.size
        
        let totalHeight = (imageSize!.height + titleSize!.height + padding)
        
        self.imageEdgeInsets = UIEdgeInsetsMake(-(totalHeight - imageSize!.height),
                                                0.0,
                                                0.0,
                                                -titleSize!.width)
        
        self.titleEdgeInsets = UIEdgeInsetsMake(0.0,
                                                -imageSize!.width,
                                                -(totalHeight - titleSize!.height),
                                                0.0)
    }
    
    func centerVertically() {
        //Default padding is 6.0
        self.centerVerticallyWithPadding(padding: 6.0)
    }
}

//MARK:- NumberFormatter
extension NumberFormatter {
    
    func stringFromDouble(number:Double) -> String {
        
        if number <= 0.0 {
            return ""
        } else if number > 0.0 && number < 1000.0 {
            return "\(Int(number))"
        } else if number >= 1000.0 && number < 10000.0 {
            return "\(Int(number / 1000.0))K"
        } else if number >= 10000.0 && number < 1000000.0 {
            return "\(Int(number / 10000.0))G"
        } else if number >= 1000000 && number < 1000000000000 {
            return "\(Int(number / 1000000.0))M"
        } else {
            return "\(Int(number / 1000000000000.0))B"
        }
    }
}

//MARK:- Charts
public class BarChartYAxisFormatter: NSObject, IAxisValueFormatter {
    
    let numFormatter: NumberFormatter
    
    override init() {
        numFormatter = NumberFormatter()
    }
    
    public func stringForValue(_ value: Double, axis: AxisBase?) -> String {
        return numFormatter.stringFromDouble(number: NSNumber(floatLiteral: value).doubleValue)
    }
}

//MARK:- Date

extension Date {
    struct Gregorian {
        static let calendar = Calendar(identifier: .gregorian)
    }
    var startOfWeek: Date? {
        return Gregorian.calendar.date(from: Gregorian.calendar.dateComponents([.yearForWeekOfYear, .weekOfYear], from: self))
    }
}

