//
//  HomePageModel.swift
//  ChefaaTask
//
//  Created by Smart Zone on 10/16/20.
//  Copyright © 2020 Smart Zone. All rights reserved.
//

import Foundation
import ObjectMapper
import Alamofire

class HomeModel : BaseModel {
    var data : HomeData = HomeData()
    var code : Int?

    override func mapping(map: Map) {

        data <- map["data"]
        code <- map["code"]
    }
    
    
    func getHomeData(success: SuccessClosure?, failure: FailureClosure?) {
        
        //let parameters: [String: Any] = [:]
//        let request = RequestConfiguraton(withRequestMethod: .get, endpoint: Endpoint.user.homeData.path, encoding: JSONEncoding.default, model: self, bodyParameters: parameters, connectionMandatory: true, headerMandatory: true)
        
        let request = RequestConfiguraton(withRequestMethod: .get, endpoint: Endpoint.user.homeData.path, encoding: JSONEncoding.default, model: self)
        self.startApiRequest(withRequestConfiguration: request, success: success, failure: failure)
    }

}

class HomeData : BaseModel {
    var slider : [Slider] = [Slider]()
    var subCategories : [SubCategories] = [SubCategories]()
    var brands : [Brands] = [Brands]()
    var bestselling : [Bestselling] = [Bestselling]()
    var landingPages : [LandingPages] = [LandingPages]()
    var landing_page_title : String?

    override func mapping(map: Map) {

        slider <- map["slider"]
        subCategories <- map["subCategories"]
        brands <- map["brands"]
        bestselling <- map["bestselling"]
        landingPages <- map["landingPages"]
        landing_page_title <- map["landing_page_title"]
    }

}


class Slider : BaseModel {
    var id : Int = 0
    var title : String = ""
    var image : String = ""
    var url : String  = ""

    override func mapping(map: Map) {

        id <- map["id"]
        title <- map["title"]
        image <- map["image"]
        url <- map["url"]
    }

}

class SubCategories : BaseModel {
    var id : Int = 0
    var title : String = ""
    var image : String = ""
    var slug : String = ""

    override func mapping(map: Map) {

        id <- map["id"]
        title <- map["title"]
        image <- map["image"]
        slug <- map["slug"]
    }

}

class Brands : BaseModel {
    var id : Int = 0
    var title : String = ""
    var title_trans : String = ""
    var slug : String = ""
    var images : [String] = [String]()

    override func mapping(map: Map) {

        id <- map["id"]
        title <- map["title"]
        title_trans <- map["title_trans"]
        slug <- map["slug"]
        images <- map["images"]
    }

}

class LandingPages : BaseModel {
    var id : Int = 0
    var name : String = ""
    var description : String = ""
    var image : String = ""
    var slug : String = ""
    var is_active : Int = 0
    var is_main : Int = 0
    var created_at : Created_at?
    var updated_at : Updated_at?

    override func mapping(map: Map) {

        id <- map["id"]
        name <- map["name"]
        description <- map["description"]
        image <- map["image"]
        slug <- map["slug"]
        is_active <- map["is_active"]
        is_main <- map["is_main"]
        created_at <- map["created_at"]
        updated_at <- map["updated_at"]
    }

}


class Bestselling : BaseModel {
    
    var id : Int = 0
    var title : String = ""
    var title_ar : String = ""
    var title_en : String = ""
    var slug : String = ""
    var is_favorite : Bool = false
    var full_url : String = ""
    var quantity : Int = 0
    var verified : String = ""
    var status : String = ""
    var is_outofstock : Int = 0
    var views : Int = 0
    var is_notified : Bool = false
    var pharmacy_branch_id : String = ""
    var purchase_count : Int = 0
    var discount : Int = 0
    var brands : String = ""
    var discount_type : String = ""
    var sub_category_id : Int = 0
    var sub_category_title : String = ""
    var sub_category_name : String = ""
    var sub_category_name_en : String = ""
    var sub_category_name_ar : String = ""
    var main_category_id : Int = 0
    var category_name_en : String = ""
    var category_name_ar : String = ""
    var brand : String = ""
    var images : [String] = [String]()
    var coupon_description : String = ""
    var description : String = ""
    var description_ar : String = ""
    var description_en : String = ""
    var price : Int = 0
    var final_discount : Int = 0
    var addresses : [String] = [String]()
    var coupon_description_ar : String = ""


    override func mapping(map: Map) {

        id <- map["id"]
        title <- map["title"]
        title_ar <- map["title_ar"]
        title_en <- map["title_en"]
        slug <- map["slug"]
        is_favorite <- map["is_favorite"]
        full_url <- map["full_url"]
        quantity <- map["quantity"]
        verified <- map["verified"]
        status <- map["status"]
        is_outofstock <- map["is_outofstock"]
        views <- map["views"]
        is_notified <- map["is_notified"]
        pharmacy_branch_id <- map["pharmacy_branch_id"]
        purchase_count <- map["purchase_count"]
        discount <- map["discount"]
        brands <- map["brands"]
        discount_type <- map["discount_type"]
        sub_category_id <- map["sub_category_id"]
        sub_category_title <- map["sub_category_title"]
        sub_category_name <- map["sub_category_name"]
        sub_category_name_en <- map["sub_category_name_en"]
        sub_category_name_ar <- map["sub_category_name_ar"]
        main_category_id <- map["main_category_id"]
        category_name_en <- map["category_name_en"]
        category_name_ar <- map["category_name_ar"]
        brand <- map["brand"]
        images <- map["images"]
        coupon_description <- map["coupon_description"]
        description <- map["description"]
        description_ar <- map["description_ar"]
        description_en <- map["description_en"]
        price <- map["price"]
        final_discount <- map["final_discount"]
        addresses <- map["addresses"]
        coupon_description_ar <- map["coupon_description_ar"]
    }

}

class Created_at : BaseModel {
    var date : String?
    var timezone_type : Int?
    var timezone : String?
    
    override func mapping(map: Map) {

        date <- map["date"]
        timezone_type <- map["timezone_type"]
        timezone <- map["timezone"]
    }

}

class Updated_at : BaseModel {
    var date : String?
    var timezone_type : Int?
    var timezone : String?

    override func mapping(map: Map) {

        date <- map["date"]
        timezone_type <- map["timezone_type"]
        timezone <- map["timezone"]
    }

}



