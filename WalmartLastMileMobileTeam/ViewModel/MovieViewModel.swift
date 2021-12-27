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
    //Mark: Get data from fetchData function in ApiHandler
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
    //Mark: Get Genre from fetchGenre function in ApiHandler
    func getGeneres(completion:completionHandler){
        APIHandler.shared.fetchGenre {[weak self] genre, error in
            self?.error = error
            if let model = genre?.genres,error == nil{
                self?.arrgenre.append(contentsOf: model)
                completion?()
            }
        }
    }
    //Mark: join Genres as string array
    func getGeneresInfo(arrayIDs:[Int]) -> String{
        let result = arrgenre.filter({ mGen in
            return arrayIDs.contains(mGen.id ?? 1)
        })
        return result.map({($0.name ?? "na")}).joined(separator: " | ")
        
    }
   //Mark: get Error
    func getError()->Error? {
        return error
    }
  //MARK: get Movie count
    func getMovieCount() -> Int?{
        return arr.count
    }
    //MARK: get ids of genres from JSON file
    func getIDs(index:Int)->[Int]?{
        return arr[index].genre_ids
    }
    //MARK: Register MoviTableViewCell nib to table view
    func registerNib(tableView: UITableView){
        let nib = UINib.init(nibName: "MovieTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "cell")
    }
    //MARK: pass data to MovieDetailViewmodel
    func passData(indexPath: IndexPath){
            let model = arr[indexPath.row]
        MovieDetailViewmodel.movieTitle = model.title ?? "na"
        MovieDetailViewmodel.movieOverview = model.overview ?? "na"
        MovieDetailViewmodel.movieReleaseDate = model.release_date ?? "na"
        MovieDetailViewmodel.movieImagUrl = Constants.imageBaseUrl + model.poster_path!
        MovieDetailViewmodel.movieGenre = getGeneresInfo(arrayIDs: getIDs(index: indexPath.row) ?? [])
    }
    
}



