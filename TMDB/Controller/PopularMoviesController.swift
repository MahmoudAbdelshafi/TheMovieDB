//
//  ViewController.swift
//  TMDB
//
//  Created by Mahmoud on 5/17/20.
//  Copyright © 2020 Mahmoud. All rights reserved.
//

import UIKit

class PopularMoviesController: UIViewController {
    
    
    
    //MARK:- Properties
    private var cellId = "MoviesCell"
    
    private var gettingData = false
    private var currentPage = 1
    private var refresher:UIRefreshControl?
    private var results:[Result]?
    private var moviesData:MoviesList?{
        didSet{
            let data = moviesData?.results
            results = data
        }
    }
    
    
    
    
    
    
    
    
    
    //MARK:- IBOutlets
    @IBOutlet weak var tbView: UITableView!
    @IBOutlet private weak var spinner: UIActivityIndicatorView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        spinner.stopAnimating()
        handelDataRequest()
        
    }
    
    
    
}





//MARK:- Private Functions
extension PopularMoviesController{
    fileprivate func handelDataRequest(){
        APIClient.getData(currentPage) { (movies, error) in
            if let movies = movies{
                self.moviesData = movies
                DispatchQueue.main.async {
                    self.tbView.reloadData()
                }
            }
        }
    }
    
    
  
    fileprivate func getNextPageData(){
        if currentPage < moviesData!.totalPages{
            gettingData = true
            currentPage += 1
            APIClient.getData(currentPage) { (movies, error) in
                if let movies = movies{
                    self.results?.append(contentsOf: movies.results)
                    DispatchQueue.main.async {
                        self.spinner.stopAnimating()
                        self.tbView.reloadData()
                    }
                }
            }
            self.gettingData = false
        }else{
            self.spinner.stopAnimating()
            return
        }
    }
    
    
    
}





//MARK:- TableView DataSource Methods
extension PopularMoviesController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results?.count ?? 0
    }
    
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! MoviesCell
        let images = results
        if let image = images?[indexPath.item].posterPath {
            //get Images Request
            if moviesData != nil{
                APIClient.getPosterImage(image) { (imagData, error) in
                    if let error = error{
                        print(error)
                        return
                    }
                    DispatchQueue.main.async {
                        cell.posterImage.image = imagData
                    }
                }
            }
        }
        cell.titleLabel.text = results?[indexPath.item].title
        cell.dateLabel.text = results?[indexPath.item].releaseDate
        cell.overviewLabel.text = results?[indexPath.item].overview
        
        return cell
    }
    
  
    
    
    
    //Set Header section title
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "All Movies"
    }
}





//MARK:- TableView Prefetching Method
extension PopularMoviesController:UITableViewDataSourcePrefetching {
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        for  index in indexPaths{
            if index.row == results!.count - 1 {
                if !gettingData{
                    gettingData = true
                    spinner.startAnimating()
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        self.getNextPageData()
                    }
                }
            }
        }
        
    }
    
    
}
