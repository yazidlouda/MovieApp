//
//  APIHandler.swift
//  WalmartLastMileMobileTeam
//
//  Created by Home on 12/14/21.
//

import Foundation

class APIHandler {
    
    static let shared = APIHandler.init()
    private init(){}
    typealias completionHandler = ((Result?,Error?)->())?
    typealias genreCompletionHandler = ((Genres?,Error?)->())?
    
    func fetchData(list:Int = 1, completion:completionHandler) {
        if let url = URL(string: Constants.movieUrlp1 + "\(list)" + Constants.movieUrlp2){
            URLSession.shared.dataTask(with: url,completionHandler: {  data, response, error in
                if error != nil{
                    completion?(nil,error)
                }
                if let data = data {
                    let model = try? JSONDecoder().decode(Result.self, from: data)
                    completion?(model, nil)
                    
                }
            }).resume()
        }
       
    }
    func fetchGenre(completion:genreCompletionHandler){
        if let url = URL(string: Constants.genreUrl){
            URLSession.shared.dataTask(with: url,completionHandler:  { data, response, error in
                if error != nil{
                    completion?(nil,error)
                }
                if let data = data{
                    let model = try? JSONDecoder().decode(Genres.self, from: data)
                    completion?(model,nil)
                }
            }).resume()
        }
    } 
}

