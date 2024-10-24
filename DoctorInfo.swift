//
//  DoctorInfo.swift
//  NearMe4
//
//  Created by Shivum telang on 10/17/24.
//

import Foundation

struct DoctorInfo: Identifiable{
    var id = UUID()
    var name:String
    var phone:String
    var rating:Double
    var address:String
    var location:String
}
