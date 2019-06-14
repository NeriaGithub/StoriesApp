//
//  StoriesTableVC.swift
//  StoriesApp
//
//  Created by Neria Jerafi on 7.6.2019.
//  Copyright © 2019 Neria Jerafi. All rights reserved.
//

import UIKit

class StoriesTableVC: UIViewController {
    @IBOutlet weak var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initVC()
       getData()
    }
    
    
    func initVC() {
        self.table.rowHeight = UITableView.automaticDimension
        self.table.estimatedRowHeight = 40
        let nib = UINib(nibName: "StoryCell", bundle: nil)
        self.table.register(nib, forCellReuseIdentifier: "StoryCell")
        self.table.tableFooterView = UIView(frame: .zero)
    }
    
    func getData()  {
        DispatchQueue.global(qos: .background).async {
            ServerManager.getServerManager().getAllStoriesId(completion: { (data) in
                if let storiesId = data {
                DataManager.getDataManager().setStoriesId(storiesId: storiesId)
                    DispatchQueue.main.async {
                        self.table.reloadData()
                    }
                }
            })
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let VC = segue.destination as! StoryVC
        guard let indexPath = self.table.indexPathForSelectedRow else { return }
        if let story = DataManager.getDataManager().getSpesificStoryFromDictionay(id: DataManager.getDataManager().getStoriesId()[indexPath.row]) {
            VC.story = story
        }
        else{
            return
        }
        
        
        
    }
}
extension StoriesTableVC:UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataManager.getDataManager().getStoriesId().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StoryCell") as! StoryCell;
        cell.setCell(storyId: DataManager.getDataManager().getStoriesId()[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(DataManager.getDataManager().getStoriesId()[indexPath.row])
        performSegue(withIdentifier: Constants.storiesSegue, sender: self)
    }
    
    
}

