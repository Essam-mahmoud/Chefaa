//
//  HomePagePresenter.swift
//  ChefaaTask
//
//  Created by Smart Zone on 10/16/20.
//  Copyright © 2020 Smart Zone. All rights reserved.
//

import UIKit

class HomePagePresenter{
    var homeData = HomeModel()
    var homeVC: HomePageViewController?
    
    init(homeVC: HomePageViewController) {
        self.homeVC = homeVC
    }
}

