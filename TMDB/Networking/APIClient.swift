//
//  MoviesList.swift
//  TMDB
//
//  Created by Mahmoud on 5/17/20.
//  Copyright © 2020 Mahmoud. All rights reserved.
//

import Foundation
import UIKit

class APIClient {
    
    
    //MARK:- Get MoviesList Request
    class func getMoviesListRequest(page:Int ,completion: @escaping (MoviesList?, Error?) -> Void){
        let pageNumber = (String(describing: page))
        guard let urlRequest = Router.EndPoints.moviesList.buildUrlRequest(Page: pageNumber) else {return }
        let session = URLSession.shared
        let task = session.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error{
                completion( nil ,error)
            }
            guard let data = data else {return}
            let decoder = JSONDecoder()
            do{
                let moviesList = try decoder.decode(MoviesList.self, from: data)
                completion(moviesList , nil)
            }catch{
                completion( nil ,nil)
                print("docoding error")
            }
        }
        task.resume()
        
    }
    
    
    
    
    //MARK:- Get Poster Image Request
    class func getPosterImage(_ imagePram:String , completion:@escaping (UIImage?,Error? )->Void){
        let url = URL(string: Router.EndPoints.imageBase + imagePram)
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if error != nil{
                print(error!)
                completion(nil,error)
            }
            guard let dataImage = UIImage(data: data!) else {return}
            completion(dataImage,nil)
        }.resume()
        
    }
    
    
    
    
}



