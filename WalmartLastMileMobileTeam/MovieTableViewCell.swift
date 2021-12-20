//
//  MovieTableViewCell.swift
//  WalmartLastMileMobileTeam
//
//  Created by Home on 12/14/21.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
let vmc = MovieCellViewModel()
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var genre: UILabel!
    @IBOutlet weak var popularity: UILabel!
    @IBOutlet weak var releaseDate: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    func setUpData(imageUr: String,mtitl: String, mGenr: String,mpopularit: Float,mReleaseDat: String){
        vmc.getViews(titleLbl: title, popularityLbl: popularity, releaseDateLbl: releaseDate, genreLbl: genre, img: img)
        vmc.setData(imageUrl: imageUr, mtitle: mtitl, mGenre: mGenr, mpopularity: mpopularit, mReleaseDate: mReleaseDat)
    }
    
}
