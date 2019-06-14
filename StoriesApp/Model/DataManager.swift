//
//  DataManager.swift
//  StoriesApp
//
//  Created by Neria Jerafi on 7.6.2019.
//  Copyright © 2019 Neria Jerafi. All rights reserved.
//

import Foundation

class DataManager {
    private static var sharedInstance:DataManager?;
    private var storiesId:[Int] = []
    private var StoriesDict:[Int:Story] = [:]
    private init(){}
    public  static func getDataManager()->DataManager
    {
        if DataManager.sharedInstance == nil{
            DataManager.sharedInstance = DataManager();
        }
        return DataManager.sharedInstance!
    }
    func setStoriesId(storiesId:[Int]) {
        self.storiesId = storiesId
    }
    func getStoriesId() -> [Int] {
        return self.storiesId
    }
    
    func addStoryToDictionay(id:Int,story:Story)  {
        self.StoriesDict[id] = story
    }
    func getSpesificStoryFromDictionay(id:Int)-> Story?  {
        if let story = self.StoriesDict[id] {
            return story
        }
        else{
            return nil
        }
    }
    
}
