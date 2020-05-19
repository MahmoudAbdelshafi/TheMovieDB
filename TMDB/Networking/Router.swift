
//
//  Router.swift
//  TMDB
//
//  Created by Mahmoud on 5/17/20.
//  Copyright © 2020 Mahmoud. All rights reserved.
//

import Foundation

class Router {
    
    
    
    static let apiKey = "840d9830ce5ea69425c3f231dbc1f7b3"
    
    enum EndPoints{
        static let imageBase = "https://image.tmdb.org/t/p/w500"
        static let base = "https://api.themoviedb.org/3"
        static let apiKeyParam = "?api_key=\(Router.apiKey)"
        static let languageParam = "&language=en-US"
        static let pageNumber = "&page="
        
        case moviesList
        
        
        var url:String {
            switch self {
            case .moviesList:
                return (EndPoints.base + "/discover/movie" + EndPoints.apiKeyParam + EndPoints.languageParam + EndPoints.pageNumber)
                
                
            }
        }
        
        
        enum HTTPMethod {
            case get
            
            var value: String {
                switch self {
                case .get: return "GET"
                }
            }
        }
        
        
        var method: HTTPMethod {
            switch self {
            case .moviesList: return .get
                
            }
        }
        
        
        
        
        //MARK:- URLRequest Method
        func buildUrlRequest(Page:String?)-> (URLRequest?){
            let urlMovieString = url + Page!
            let movieUrl = URL(string: urlMovieString)
            var urlRequest = URLRequest(url:movieUrl!)
            urlRequest.httpMethod = method.value
            switch self {
            case .moviesList :
                return urlRequest
                
            }
        }
        
        
        
        
        
        
    }
    
    
    
    
    
    
    
    
}
