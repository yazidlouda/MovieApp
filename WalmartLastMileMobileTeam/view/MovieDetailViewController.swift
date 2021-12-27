//
//  MovieDetailViewController.swift
//  WalmartLastMileMobileTeam
//
//  Created by Home on 12/14/21.
//

import UIKit

class MovieDetailViewController: UIViewController {

    let vmd = MovieDetailViewmodel()
    @IBOutlet weak var myView: TestView!
    override func viewDidLoad() {
        super.viewDidLoad()

        vmd.setupDetailData(myViewViewModel: myView)
}
}
