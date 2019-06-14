//
//  StoryCell.swift
//  StoriesApp
//
//  Created by Neria Jerafi on 7.6.2019.
//  Copyright © 2019 Neria Jerafi. All rights reserved.
//

import UIKit

class StoryCell: UITableViewCell {

    @IBOutlet weak var storyTitleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setCell(storyId:Int)  {
        if let story = DataManager.getDataManager().getSpesificStoryFromDictionay(id: storyId) {
            self.storyTitleLabel.text = story.title
        }
        else{
            DispatchQueue.global(qos: .background).async {
                ServerManager.getServerManager().getSpesificStory(storyId: storyId, completion: { (data) in
                    if let storyData = data{
                        DataManager.getDataManager().addStoryToDictionay(id: storyData.id, story: storyData)
                        DispatchQueue.main.async {
                           self.storyTitleLabel.text = storyData.title
                        }
                    }
                })
            }
        }
    }
    
}
