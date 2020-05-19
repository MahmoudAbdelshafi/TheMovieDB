//
//  UserList.swift
//  TMDB
//
//  Created by Mahmoud on 5/18/20.
//  Copyright © 2020 Mahmoud. All rights reserved.
//

import Foundation
import UIKit



class UserList {
    var title:String?
    var date:String?
    var overview:String?
    var poserImage:UIImage?
    
    init(title: String, date: String, overview: String, poserImage: UIImage?) {
        self.title = title
        self.date = date
        self.overview = overview
        self.poserImage = poserImage
    }
}
