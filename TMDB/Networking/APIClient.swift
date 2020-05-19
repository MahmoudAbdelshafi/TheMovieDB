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
    class func getMoviesListRequest(completion: @escaping (MoviesList?, Error?) -> Void){
        
        let urlRequest = Router.EndPoints.moviesList.url
        
        print(urlRequest)
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
               print("docoding error")
            }
            }
        task.resume()
        
    }
    
    
    
    
    
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
    
    
    class func getData(_ page:Int ,completion: @escaping (MoviesList?, Error?) -> Void){
        let url = URL(string:"https://api.themoviedb.org/3/movie/popular?api_key=840d9830ce5ea69425c3f231dbc1f7b3&language=en-US&page="+"\(page)")
                      
               URLSession.shared.dataTask(with: url!) { (data, response, error) in
                   if error != nil{
                       print(error!)
                      completion(nil,error)
                   }
                do{
                    let decoder = JSONDecoder()
                    let moviesList = try decoder.decode(MoviesList.self, from: data!)
                   completion(moviesList,nil)
                }catch{
                    completion(nil,error)
                    print(error)
                }
                
               }.resume()
    }
    
    
    }
    
    

