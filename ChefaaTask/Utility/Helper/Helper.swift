//
//  Helper.swift
//  SAl
//
//  Created by ahmed ezz on 2/6/18.
//  Copyright © 2018 Abdelrahman Ahmed Shawky. All rights reserved.
//

//import UIKit
//import AVKit
//import AVFoundation
//import CoreLocation
//import FBSDKCoreKit
//import FacebookCore
//import FirebaseAnalytics
//import ZDCChat
//import SwiftyJSON
//protocol isInternet {
//    func isConnected(connected:Bool)
//}
//class Helper  {
//    private static let defaults:UserDefaults = UserDefaults.standard
//    private static var bsaeUrl = "https://api.glamour-plan.com/api/"
//    public static var currentView:UIViewController!
//    public static var onDismiss:OnDismiss!
//    private static var isConnected:isInternet!
//    private static var blurView:UIView!
//    public static var isFirst = true
//    public static var actionsDic = ["0":""]
//    public static func getBaseUrl ()->String
//    {
//        return Helper.bsaeUrl
//    }
//    // valid email
//    public static func isValidEmail(testStr:String) -> Bool {
//        // print("validate calendar: \(testStr)")
//        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
//        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
//        return emailTest.evaluate(with: testStr)
//    }
//    public static func getCurrentView()->UIViewController
//    {
//        if currentView.isKind(of: MenuVC.self)
//        {
//            for vc in (currentView.navigationController?.viewControllers)!
//            {
//                if vc .isKind(of: HomeVC.self)
//                {
//                    return vc
//                }
//            }
//        }
//        return currentView
//    }
//    public static func setTopController(currentView:UIViewController)
//    {
//        self.currentView = currentView
//    }
//    // valid name
//    public static func isValiName(testStr:String)->Bool
//    {
//        let nameRegEx = "^[A-Za-zء-ي-\\s]+$"
//        let nameTest = NSPredicate(format:"SELF MATCHES %@", nameRegEx)
//        return nameTest.evaluate(with: testStr)
//    }
//    // show alert message
//    public static func showAlert(message:String,buttonTitle:String,mainController:UIViewController,onComplete: @escaping () -> () )
//    {
//        let customDialogVC = UIStoryboard.init(name:"Main", bundle: nil).instantiateViewController(withIdentifier: "CustomDialogVC") as! CustomDialogVC
//               customDialogVC.setController(controller: mainController, onDismiss: onDismiss,message: message)
//        mainController.present(customDialogVC, animated: true, completion: nil)
//    }
// 
//    // check if button in array
//    public static func isInArray(checkBoxesArray:[UIButton],checkBoxIndex:Int)->Bool
//    {
//        for checkBox in checkBoxesArray
//        {
//            if checkBox.tag == checkBoxIndex
//            {
//                return true
//            }
//        }
//        return false
//    }
//    // get from user default
//    public static func getFromDefault(key:String)->String
//    {
//        if let value:String  = defaults.string(forKey: key)
//        {
//            return value
//
//        }
//        return ""
//    }
//    // savein default
//    public static func saveInDefault(key:String,value:String)
//    {
//        defaults.set(value , forKey: key)
//    }
//    public static func getCurrentLanguage()->String
//    {
//        return Helper.getFromDefault(key: "language").isEmpty ? "en" : Helper.getFromDefault(key: "language")
//    }
//    public static func setAppLanguage(value:String)
//    {
//        let locale = Locale.current
//        let countryName = Helper.getFromDefault(key: "region").isEmpty ? (locale.regionCode ?? "EG") : Helper.getFromDefault(key: "region")
//        let langValue = value == "en" ? value : countryName == "EG" ? "ar" : "ar-\(countryName)"
//        print("user selected language::",langValue)
//        Helper.saveInDefault(key: "language", value: langValue)
//    }
//    
//    public class func removeAllUserDefualtKey(){
//        Helper.saveInDefault(key: "userId", value: "")
//        Helper.saveInDefault(key: "token", value: "")
//    }
//    
//    public static func share(shareUrl:String,mainController:UIViewController)
//    {
//        if let link = NSURL(string: shareUrl) {
//            let objectsToShare = ["",link] as [Any]
//            let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
//            mainController.present(activityVC, animated: true, completion: nil)
//        }
//        else
//        {
//            let objectsToShare = [shareUrl]
//            let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
//            mainController.present(activityVC, animated: true, completion: nil)
//        }
//    }
//    
//    //check string value
//    public static func checkStringValue(value:String?)->String
//    {
//        return value != nil ? value! : ""
//    }
//    static func getLocationName(location:CLLocation,onComplete: @escaping (String) -> ())
//    {
//        let ceo: CLGeocoder = CLGeocoder()
//        let loc: CLLocation = location
//        ceo.reverseGeocodeLocation(loc, completionHandler:
//            {(placemarks, error) in
//                if (error != nil)
//                {
//                    print("reverse geodcode fail: \(error!.localizedDescription)")
//                }
//                else
//                {
//                    let pm = placemarks! as [CLPlacemark]
//                    
//                    if pm.count > 0
//                    {
//                        let pm = placemarks![0]
//                        print("country:\(String(describing: pm.country))")
//                        print("locality:\(String(describing: pm.locality))")
//                        print("subLocality:\(String(describing: pm.subLocality))")
//                        print("thoroughfare:\(String(describing: pm.thoroughfare))")
//                        print("postalCode:\(String(describing: pm.postalCode))")
//                        print("subThoroughfare:\(String(describing: pm.subThoroughfare))")
//                        var addressString : String = ""
//                        if pm.thoroughfare != nil
//                        {
//                            addressString = addressString + pm.thoroughfare! + ", "
//                        }
//                        if pm.subLocality != nil && pm.thoroughfare == nil
//                        {
//                            addressString = addressString + pm.subLocality! + ", "
//                        }
//                        if pm.locality != nil
//                        {
//                            addressString = addressString + pm.locality! + ", "
//                        }
//                        if pm.country != nil
//                        {
//                            addressString = addressString + pm.country! + ", "
//                        }
//                        if(addressString.contains(","))
//                        {
//                            let endIndex = addressString.index(addressString.endIndex, offsetBy: -2)
//                            addressString = addressString.substring(to: endIndex)
//                        }
//                        print(addressString)
//                        onComplete(addressString)
//                    }
//                }
//        })
//    }
//    // image as circle
//    public static  func imageAsCircle(selectImageview:UIImageView,borderColor:UIColor = UIColor.clear,borderWidth:CGFloat = 1.0)  {
//        selectImageview.layer.borderWidth = borderWidth
//        selectImageview.layer.borderColor = borderColor.cgColor
//        selectImageview.layer.cornerRadius = selectImageview.layer.bounds.width / 2
//        selectImageview.clipsToBounds = true
//    }
//    public static func setBorder(view:UIView,borderColor:UIColor = UIColor.white,cornerRadious:Int = 15)
//    {
//        view.clipsToBounds = true
//        view.layer.borderColor = borderColor.cgColor
//        view.layer.borderWidth = 1.0
//        view.layer.cornerRadius = CGFloat(cornerRadious)
//    }
//    static func widthForView(text:String, font:UIFont, height:CGFloat) -> CGFloat{
//        let label:UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: CGFloat.greatestFiniteMagnitude, height: height))
//        label.lineBreakMode = NSLineBreakMode.byWordWrapping
//        label.numberOfLines = 0
//        label.font = font
//        label.text = text
//        label.sizeToFit()
//        return label.frame.width
//    }
//    public static func showLanguageDialog(language:String,controller:UIViewController,onComplete: @escaping (String) -> ())
//    {
//        let alert = UIAlertController(title: nil, message:"Are Your Sure You Want Change Language".localized, preferredStyle: .alert)
//        let cancelButton = UIAlertAction(title: "Cancel".localized, style: UIAlertAction.Style.cancel, handler:{ (action) -> Void in
//            onComplete("cancel")
//        })
//        let doneButton = UIAlertAction(title: "Ok".localized, style: .default, handler: { (action) -> Void in
//            onComplete("ok")
//        })
//        alert.addAction(doneButton)
//        alert.addAction(cancelButton)
//        controller.present(alert, animated: true, completion: nil)
//    }
//    public static func search(navigationController:UINavigationController)
//    {
//        Helper.sendAction(actionId: UserJourneyEnum.Search.value, content: "search")
//        let searchVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SearchVC") as! SearchVC
//        navigationController.pushViewController(searchVC, animated: true)
//    }
//    public static func showFilter(navigationController:UINavigationController,onSelected:OnSelected)
//    {
//        let filterVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "FilterVC") as! FilterVC
//        filterVC.setSelectedListner(onSelected: onSelected)
//        navigationController.pushViewController(filterVC, animated: true)
//    }
//    public static func moveToProvider(salonId:Int,navigationController:UINavigationController!,isEdit : Bool = false,isReorder:Bool = false)
//    {
//        let providerVC = UIStoryboard.init(name: "Provider", bundle: nil).instantiateViewController(withIdentifier: "ProviderVC") as! ProviderVC
//        providerVC.setSalonId(id: salonId,isEdit: isEdit,isReorder:isReorder)
//        navigationController.pushViewController(providerVC, animated: true)
//    }
//    static func roundCorner(corners: UIRectCorner, radius: CGFloat,view:UIView,fullScreen:Bool = true) {
//        let bounds = fullScreen ? UIScreen.main.bounds : view.bounds
//        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
//        let mask = CAShapeLayer()
//        mask.path = path.cgPath
//        view.layer.mask = mask
//    }
//    static func heightForView(text:String, font:UIFont, width:CGFloat) -> CGFloat{
//        let label:UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: width, height: CGFloat.greatestFiniteMagnitude))
//        label.lineBreakMode = NSLineBreakMode.byWordWrapping
//        label.numberOfLines = 0
//        label.font = font
//        label.text = text
//        label.sizeToFit()
//        return label.frame.height
//    }
//    static func moveToSchedule(navigationController:UINavigationController!,bookingId:Int = 0 , isEdit:Bool = false,isReorder:Bool = false)
//    {
//        let scheduleVC = UIStoryboard.init(name: "Provider", bundle: nil).instantiateViewController(withIdentifier: "ScheduleVC") as! ScheduleVC
//        scheduleVC.setEditData(bookingId: bookingId,isEdit:isEdit,isReorder: isReorder)
//        navigationController.pushViewController(scheduleVC, animated: true)
//    }
//    public static func convertEndTime(time:String)->String
//    {
//        let dateFormatter = CustomDateFormatter()
//        dateFormatter.dateFormat = "HH:mm"
//        var date = dateFormatter.date(from: time)
//        dateFormatter.dateFormat = "h:mm a"
//        let Date24 = dateFormatter.string(from: date!)
//        return Date24
//    }
//    public static func startChat()
//    {
//        ZDCChat.start { config in
//                        config?.tags = ["subscription", "mobile_app"]
//                        config?.preChatDataRequirements.message = .optional
//                        config?.preChatDataRequirements.name = .optionalEditable
//                        config?.preChatDataRequirements.email = .required
//                        config?.preChatDataRequirements.phone = .optional
//                        config?.preChatDataRequirements.department = .optionalEditable
//                        config?.preChatDataRequirements.message = .required
//                        ZDCChat.updateVisitor { user in
//                            user?.phone = Helper.getFromDefault(key: "phone")
//                            user?.name = Helper.getFromDefault(key: "name")
//                            user?.email = Helper.getFromDefault(key: "email")
//        //                    user?.addNote("This is a Swift note")
//
//                        }
//                    }
//    }
//    public static func convertIsoTime(time:String)->String
//    {
//        if time.isEmpty
//        {
//            return ""
//        }
//        let dateFormatter = CustomDateFormatter()
//        let array = time.split(separator: ".")
//        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
//        var date = dateFormatter.date(from: array[0].description)
//        dateFormatter.dateFormat = "EEE , dd MMM hh:mm a"
//        let Date24 = dateFormatter.string(from: date!)
//        return Date24
//    }
//    public static func showFailMessage(message:String)
//    {
//        if let topController = UIApplication.topViewController()
//        {
//            if let lastView = topController.navigationController?.viewControllers.last as? UIViewController
//            {
//                Helper.showAlert(message: message, buttonTitle: "Ok".localized, mainController: lastView, onComplete: {(
//                )})
//            }
//            else if let lastView = topController as? UIViewController
//            {
//                Helper.showAlert(message: message, buttonTitle: "Ok".localized, mainController: lastView, onComplete: {(
//                )})
//            }
//        }
//    }
//    
//    public static func moveToVerify(mobile:String,password:String)
//    {
//        if let topController = UIApplication.topViewController() {
//            let navController = topController.navigationController
//            let verifyVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "VerificationVC") as! VerificationVC
//            verifyVC.setVerificationData(mobile: mobile, userId: "", countryCode: "", password: password)
//            navController?.pushViewController(verifyVC, animated: true)
//        }
//    }
//    public static func checkIntValue(value : Int?)->Int
//    {
//        return value == nil ? 0 : value!
//    }
//    public static func checkDoubleValue(value : Double?)->Double
//    {
//        return value == nil ? 0.0 : value!
//    }
//    public static func isConnectingToInternet( completion: @escaping (Bool) -> ())
//    {
//        let reachability = Reachability()!
//        
//        var isConnet = false
//        reachability.whenReachable =
//            { reachability in
//                if reachability.connection == .wifi
//                {
//                    
//                    print("Reachable via WiFi")
//                }
//                else
//                {
//                    print("Reachable via Cellular")
//                }
//                isConnet = true
//                completion(isConnet)
//                
//        }
//        reachability.whenUnreachable =
//            { _ in
//                print("Not reachable")
//                isConnet = false
//                completion(isConnet)
//        }
//        
//        do {
//            try reachability.startNotifier()
//        } catch {
//            print("Unable to start notifier")
//        }
//    }
//    
//    public static func showInternetMessage(isConnect:isInternet? = nil)
//    {
//        let internetVC = UIStoryboard.init(name: "Provider", bundle: nil).instantiateViewController(withIdentifier: "NoInternertVC") as! NoInternertVC
//        internetVC.isConnected = isConnect
//        internetVC.modalPresentationStyle = .fullScreen
//        UIApplication.topViewController()?.present(internetVC, animated: true, completion: nil)
//    }
//    static func checkInternetConnection(isConnected:isInternet)
//    {
//        isConnectingToInternet(completion: {(isConnect) -> Void in
//            if isConnect
//            {
//                isConnected.isConnected(connected: true)
//            }
//            else
//            {
//               showInternetMessage(isConnect: isConnected)
//            }
//        })
//    }
//    public static func logEvent(eventName:AppEvents.Name , params:[String:Any])
//    {
//        AppEvents.logEvent(eventName, parameters: params)
//    }
//    public static func fBlogEvent(eventName:String , params:[String:Any])
//    {
//        Analytics.logEvent(eventName, parameters: params)
//    }
//    public static func createBlurView(controller:UIViewController)
//    {
//        blurView = UIView()
//        blurView.backgroundColor = UIColor.black
//        blurView.alpha = 0.5
//        blurView.frame = controller.view.bounds
//        controller.view.addSubview(blurView)
//    }
//    public static func removeBlurView()
//    {
//        blurView.removeFromSuperview()
//    }
//    // start whatsapp chatting
//    public static func startWhatsApp(telephone:String) -> Bool
//    {
//        // open whats app
//        let urlWhats = "whatsapp://send?phone=\(telephone)"
//        if let urlString = urlWhats.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed)
//        {
//            if let whatsappURL = URL(string: urlString)
//            {
//                if UIApplication.shared.canOpenURL(whatsappURL)
//                {
//                    return UIApplication.shared.openURL(whatsappURL)
//                }
//                else
//                {
//                    print("Install Whatsapp")
//                }
//            }
//        }
//        
//        return false
//    }
//    static func goToLoginVC(navigationController:UINavigationController){
//        if isFirst
//        {
//            isFirst = false
//            let loginVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
//            loginVC.backToRoot = false
//            navigationController.pushViewController(loginVC, animated: false)
//        }
//        else
//        {
//            isFirst = true
//        }
//        
//    }
//    public static func sendAction(actionId:Int,content:String)
//    {
//        if Helper.isActionFound(actionId: actionId)
//        {
//            let UUIDValue = UIDevice.current.identifierForVendor!.uuidString
//                   let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
//            let params =  ["ActionId":actionId,"AppId":1,"Code":0,"Content":content,"CountryId":Info.shared.getCountryId(),"DeviceId":UUIDValue,"DeviceName":UIDevice.current.name,"DeviceType":"Ios","GlameraUserId":Info.shared.userID(),"Lang":Helper.getCurrentLanguage(),"RowStatus":1,"Token":AppDelegate.sessionId,"IosVersion":UIDevice.current.systemVersion,"VersionCode":appVersion?.description] as [String : Any]
//            Connection.sendJsonObject(url: "UserJourney/Create", jsonObject: params, showLoading: false, onComplete: {(response)->Void in
//                
//            })
//        }
//    }
//    
//    public static func getActions()
//    {
//        var params = ["AppId":1,"Lang":Helper.getCurrentLanguage(),"PagingEnabled":false,"VisibleToGlamera":true] as [String : Any]
//        
//        if Info.shared.getCountryId().count > 0
//        {
//            params["CountryId"] = Info.shared.getCountryId()
//        }
//        Connection.sendJsonObject(url: "UserJourneyAction/GetActiveActions", jsonObject: params, showLoading: false, onComplete: {(response)->Void in
//            if response as? String != "fail"
//            {
//                let json = JSON(response)
//                if let jsonDic = json.dictionary
//                {
//                    if jsonDic["State"]?.int == 100
//                    {
//                        if let jsonArray = jsonDic["Result"]?.array
//                        {
//                            for object in jsonArray
//                            {
//                                if let jsonDic = object.dictionary
//                                {
//                                    let code = Helper.checkIntValue(value: jsonDic["Code"]?.int)
//                                    Helper.actionsDic[code.description] = code.description
//                                }
//                            }
//                            print(Helper.actionsDic.count)
//                        }
//                    }
//                }
//            }
//        })
//    }
//    
//    private static func isActionFound(actionId:Int)->Bool
//    {
//        print(Helper.actionsDic[actionId.description],"\(actionId)")
//        return Helper.actionsDic[actionId.description] == nil ? false : true
//    }
//
//}
//extension UIApplication {
//    class func topViewController(controller: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
//        if let navigationController = controller as? UINavigationController {
//            return topViewController(controller: navigationController.visibleViewController)
//        }
//        if let tabController = controller as? UITabBarController {
//            if let selected = tabController.selectedViewController {
//                return topViewController(controller: selected)
//            }
//        }
//        if let presented = controller?.presentedViewController {
//            return topViewController(controller: presented)
//        }
//        return controller
//    }
//    
//}
