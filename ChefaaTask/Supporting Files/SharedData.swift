//
//  SharedData.swift
//  CarWash
//
//  Created by Mohammad Farhan on 22/12/1710/11/17.
//  Copyright © 2017 CarWash. All rights reserved.
//


import UIKit

class SharedData{
    
    static let SharedInstans = SharedData()
    let defaults = UserDefaults.standard

    let IsLogin = "IsNewLogin"
     let IsActive = "IsActive"
    let Language = "Language"
    let CurrencyAr = "CurrencyAr"
    let CurrencyEn = "CurrencyEn"
    let AccountName = "SiteName"
    let AccountImage = "ImageURL"
    let countryCode = "CountryId"
    let userEmail = "Email"
    let phoneNumber = "phone"
    let userPassword = "password"
    let countryName = "CountryName"
    let countryNameAR = "CountryNameAR"
    let countryCID = "CountryCID"
    let companyID = "CompnayId"
    func SetIsLogin(_ isLogin:Bool){
        defaults.set(isLogin, forKey: IsLogin)
    }
    
    func GetIsLogin()->Bool{
        if (UserDefaults.standard.object(forKey: IsLogin) != nil) {
            return defaults.bool(forKey: IsLogin)
        }else{
            return false
        }
    }
    
    // fuction to remove pref
    func RemoveLoginStatus(){
        defaults.removeObject(forKey: IsLogin)
    }
    
    func SetIsActive(_ isActive:Bool){
        defaults.set(isActive, forKey: IsActive)
    }
    
    func GetIsActive()->Bool{
        if (UserDefaults.standard.object(forKey: IsActive) != nil) {
            return defaults.bool(forKey: IsActive)
        }else{
            return false
        }
    }
    
    func setLanguage(_ language:String){
        defaults.set(language, forKey: Language)
    }
    
    func getLanguage()->String{
        if (UserDefaults.standard.object(forKey: Language) != nil) {
            return defaults.string(forKey: Language)!
        }else{
            return "en"
        }
    }
    
    func setCurrencyAr(_ currency:String){
        defaults.set(currency, forKey: CurrencyAr)
    }
    func getCurrencyAr() -> String{
        if (UserDefaults.standard.object(forKey: CurrencyAr) != nil) {
            return defaults.string(forKey: CurrencyAr)!
        }else{
            return "ج.م"
        }
    }
    
    
    func setCurrencyEn(_ currency:String){
        defaults.set(currency, forKey: CurrencyEn)
    }
    func getCurrencyEn() -> String{
        if (UserDefaults.standard.object(forKey: CurrencyEn) != nil) {
            return defaults.string(forKey: CurrencyEn)!
        }else{
            return "EGP"
        }
    }
    func setAccountName(_ name:String){
        defaults.set(name, forKey: AccountName)
    }
    func getAccountName() -> String{
        if (UserDefaults.standard.object(forKey: AccountName) != nil) {
            return defaults.string(forKey: AccountName)!
        }else{
            return "Unknown"
        }
    }
    
    func setImageURL(_ url:String){
        defaults.set(url, forKey: AccountImage)
    }
    func getImageURL() -> String{
        if (UserDefaults.standard.object(forKey: AccountImage) != nil) {
            return defaults.string(forKey: AccountImage)!
        }else{
            return "Unknown"
        }
    }
    
    func setCountryCode(_ company:String){
        defaults.set(company, forKey: countryCode)
    }
    func getCountryCode() -> String{
        if (UserDefaults.standard.object(forKey: countryCode) != nil) {
            return defaults.string(forKey: countryCode)!
        }else{
            return "1938"
        }
    }
    
    func setCountryName(_ name:String){
        defaults.set(name, forKey: countryName)
    }
    func getCountryName() -> String{
        if (UserDefaults.standard.object(forKey: countryName) != nil) {
            return defaults.string(forKey: countryName)!
        }else{
            return "Egypt"
        }
    }
    
    func setCountryNameAR(_ name:String){
        defaults.set(name, forKey: countryNameAR)
    }
    func getCountryNameAR() -> String{
        if (UserDefaults.standard.object(forKey: countryNameAR) != nil) {
            return defaults.string(forKey: countryNameAR)!
        }else{
            return "مصر"
        }
    }
    func setCountryCID(_ CID:String){
        defaults.set(CID, forKey: countryCID)
    }
    func getCountryCID() -> String{
        if (UserDefaults.standard.object(forKey: countryCID) != nil) {
            return defaults.string(forKey: countryCID)!
        }else{
            return "101"
        }
    }
    
    func setEmail(_ email:String){
        defaults.set(email, forKey: userEmail)
    }
    func getEmail() -> String{
        if (UserDefaults.standard.object(forKey: userEmail) != nil) {
            return defaults.string(forKey: userEmail)!
        }else{
            return "test@someDomain.com"
        }
    }
    
    func setPhoneNumber(_ phone:String){
        defaults.set(phone, forKey: phoneNumber)
    }
    
    func getPhoneNumber() -> String{
        if (UserDefaults.standard.object(forKey: phoneNumber) != nil) {
            return defaults.string(forKey: phoneNumber)!
        }else{
            return "0123456789"
        }
    }
    
    func setPassword(_ password:String){
        defaults.set(password, forKey: userPassword)
    }
    
    func getPassword() -> String{
        if (UserDefaults.standard.object(forKey: userPassword) != nil) {
            return defaults.string(forKey: userPassword)!
        }else{
            return "0123456789"
        }
    }
    
    
    func getAccountSetupId() -> String{
        if (UserDefaults.standard.object(forKey: "AccoutSetupId") != nil) {
            return defaults.string(forKey: "AccoutSetupId")!
        }else{
            return ""
        }
    }
    
    func ShowHome() {
        
        let sb = UIStoryboard(name: "Booking", bundle: nil)
        let delegate = UIApplication.shared.delegate as! AppDelegate
        delegate.window?.rootViewController = sb.instantiateInitialViewController()
        
    }


    
}
