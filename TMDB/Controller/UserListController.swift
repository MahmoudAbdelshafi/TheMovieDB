//
//  UserListController.swift
//  TMDB
//
//  Created by Mahmoud on 5/18/20.
//  Copyright © 2020 Mahmoud. All rights reserved.
//

import UIKit

class UserListController: UIViewController{
   
    

    //MARK:- Properties
    private var list:UserList?
    private var userList = [UserList]()
    
       
    
   
    
    
    //MARK:- IBOutlets
    @IBOutlet weak var tbView: UITableView!
    
  
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    

    //MARK:- IBActions
    @IBAction func addPressed(sender: AnyObject) {
    let AddNewMovieController = storyboard?.instantiateViewController(withIdentifier: "AddNewMovieController") as! AddNewMovieController
        AddNewMovieController.deleget = self
         navigationController?.pushViewController(AddNewMovieController, animated: true)
    }

  

}


//MARK: TableView DataSource Methods
extension UserListController: UITableViewDataSource{
  
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "My Movies"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell", for: indexPath) as! ListCell
        cell.dateLabel.text = userList[indexPath.item].date
        cell.titleLabel.text = userList[indexPath.item].title
        cell.overviewLabel.text = userList[indexPath.item].overview
        cell.posterImage?.image = userList[indexPath.item].poserImage
        return cell
    }

}




//MARK:- Passing Data
extension UserListController:PassDataToUserListController {
    func passData(_ newMovie: UserList) {
        userList.append(newMovie)
        tbView.reloadData()
    }
    
    
}

