//
//  Constants.swift
//  StoriesApp
//
//  Created by Neria Jerafi on 7.6.2019.
//  Copyright © 2019 Neria Jerafi. All rights reserved.
//

import Foundation

struct Constants {
     private static let  baseUrl = "https://hacker-news.firebaseio.com/v0/"
    static let allStoriesIdUrl = "\(Constants.baseUrl)topstories.json"
    static func getSpesificStoryUrlById (storyId:Int) ->String {
        return "\(Constants.baseUrl)item/\(storyId).json"
    }
     static let storiesSegue = "storiesSegue"
}
