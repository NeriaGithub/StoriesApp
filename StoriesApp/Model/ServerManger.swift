//
//  ServerManger.swift
//  StoriesApp
//
//  Created by Neria Jerafi on 7.6.2019.
//  Copyright © 2019 Neria Jerafi. All rights reserved.
//

import Foundation

class  ServerManager {
    private static var sharedInstance:ServerManager?;
    private init(){}
    public  static func getServerManager()->ServerManager
    {
        if ServerManager.sharedInstance == nil{
            ServerManager.sharedInstance = ServerManager();
        }
        return ServerManager.sharedInstance!
    }
    
    func getAllStoriesId(completion:@escaping([Int]?)->())  {
        guard let url  = URL(string: Constants.allStoriesIdUrl) else { return  }
        URLSession.shared.dataTask(with:url) { (data, respone, error) in
            if error == nil{
                do{
                    let jsonResponse = try JSONSerialization.jsonObject(with:
                        data!, options: [])
                    let storiesId = jsonResponse as! [Int];
                    completion(storiesId)
                    
                }
                catch{
                    completion(nil)
                }
            }
            else{
                completion(nil)
            }
            }.resume()
    }
    
    func getSpesificStory(storyId:Int,completion:@escaping(Story?)->()) {
        guard let url = URL(string: Constants.getSpesificStoryUrlById(storyId: storyId)) else { return  }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error == nil{
                do{
                    let story = try JSONDecoder().decode(Story.self, from: data!);
                    completion(story)
                }
                catch{
                    print("error")
                    completion(nil)
                }
            }
            else{
                completion(nil)
            }
            
        }.resume()
    }
}
