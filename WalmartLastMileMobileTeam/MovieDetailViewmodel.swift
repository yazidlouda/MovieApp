//
//  MovieDetailViewmodel.swift
//  WalmartLastMileMobileTeam
//
//  Created by Home on 12/17/21.
//

import Foundation
import UIKit
class MovieDetailViewmodel{
    static var movieTitle = ""
    static var movieImagUrl = ""
    static var movieOverview = ""
    static var movieGenre = ""
    static var movieReleaseDate = ""
    func setupDetailData(myViewViewModel: TestView!){
        myViewViewModel.mtitle.text = MovieDetailViewmodel.movieTitle
        myViewViewModel.mOverview.text = MovieDetailViewmodel.movieOverview
        myViewViewModel.mGenre.text = "Genre :" + " " + MovieDetailViewmodel.movieGenre
        myViewViewModel.releaseDate.text = "Released on :" + " " + MovieDetailViewmodel.movieReleaseDate
        let imageUrl = URL(string: MovieDetailViewmodel.movieImagUrl)
        DispatchQueue.global().async {
            let data = try? Data(contentsOf: imageUrl!)
            DispatchQueue.main.async {
                myViewViewModel.img.image = UIImage(data: data!)
            }

    }
    }
    
}
