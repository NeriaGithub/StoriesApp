//
//  Story.swift
//  StoriesApp
//
//  Created by Neria Jerafi on 7.6.2019.
//  Copyright © 2019 Neria Jerafi. All rights reserved.
//

import Foundation
struct Story:Decodable {
    let id:Int
    let title:String
    let url:String?
}
