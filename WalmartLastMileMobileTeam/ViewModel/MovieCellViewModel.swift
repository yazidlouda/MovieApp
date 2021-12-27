//
//  MovieCellViewModel.swift
//  WalmartLastMileMobileTeam
//
//  Created by Home on 12/17/21.
//

import Foundation
import UIKit

class MovieCellViewModel{
    var titleLbl: UILabel?
    var popularityLbl :UILabel?
    var releaseDateLbl: UILabel?
    var genreLbl: UILabel?
    var img: UIImageView?
    //Mark: Getting UIViews
    func getViews(titleLbl: UILabel?, popularityLbl :UILabel?, releaseDateLbl: UILabel?, genreLbl: UILabel?,img: UIImageView?){
        self.titleLbl = titleLbl
        self.popularityLbl = popularityLbl
        self.releaseDateLbl = releaseDateLbl
        self.genreLbl = genreLbl
        self.img = img
    }
    //Mark: Set data for MovieCell
    func setData(imageUrl: String,mtitle: String, mGenre: String,mpopularity: Float,mReleaseDate: String){
        titleLbl?.text = mtitle
        genreLbl?.text = mGenre
        popularityLbl?.text = "\(mpopularity)"
        releaseDateLbl?.text = mReleaseDate
        let imageUrl = URL(string:(Constants.imageBaseUrl + imageUrl))
        DispatchQueue.global().async {
            let data = try? Data(contentsOf: imageUrl!)
            DispatchQueue.main.async {
                self.img?.image = UIImage(data: data!)
            }
    }
       
    }
}

