//
//  SharedData.swift
//  NearMe4
//
//  Created by Shivum telang on 10/17/24.
//

import Foundation

class SharedData: ObservableObject {
    @Published var userName:String = ""
    @Published var name:String = ""
    @Published var phone:String = ""
    @Published var rating:Double = 0
    @Published var address:String = ""
    @Published var locationCity:String = ""
    @Published var locationState:String = ""
    
}
