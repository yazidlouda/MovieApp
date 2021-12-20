//
//  MovieViewModel.swift
//  WalmartLastMileMobileTeam
//
//  Created by Home on 12/14/21.
//

import Foundation
import UIKit
class MovieViewModel{
    var arr : [Movie] = [Movie]()
    var arrgenre = [Genre]()
    var error: Error?
    var index : Int?
    var list = 1
    
    typealias completionHandler = (()->())?
    
    func getData(completion:completionHandler){
        APIHandler.shared.fetchData(list:self.list) {[weak self] movie,error in
            self?.error=error
            if let model = movie?.results, error == nil {
                self?.arr.append(contentsOf: model)
                self?.list += 1
                completion?()
            }
        }
    }
    func getGeneres(completion:completionHandler){
        APIHandler.shared.fetchGenre {[weak self] genre, error in
            self?.error = error
            if let model = genre?.genres,error == nil{
                self?.arrgenre.append(contentsOf: model)
                completion?()
            }
        }
    }
    func getGeneresInfo(arrayIDs:[Int]) -> String{
        let result = arrgenre.filter({ mGen in
            return arrayIDs.contains(mGen.id)
        })
        return result.map({$0.name}).joined(separator: " | ")
        
    }

    func getError()->Error? {
        return error
    }

    func getMovieCount() -> Int?{
        return arr.count
    }
    func getIDs(index:Int)->[Int]?{
        return arr[index].genre_ids
    }
    func registerNib(tableView: UITableView){
        let nib = UINib.init(nibName: "MovieTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "cell")
    }
    func passData(indexPath: IndexPath){
            let model = arr[indexPath.row]
        MovieDetailViewmodel.movieTitle = model.title
        MovieDetailViewmodel.movieOverview = model.overview
        MovieDetailViewmodel.movieReleaseDate = model.release_date
        MovieDetailViewmodel.movieImagUrl = Constants.imageBaseUrl + model.poster_path
        MovieDetailViewmodel.movieGenre = getGeneresInfo(arrayIDs: getIDs(index: indexPath.row) ?? [])
    }
    
}



