//
//  TestView.swift
//  WalmartLastMileMobileTeam
//
//  Created by Home on 12/15/21.
//

import UIKit

class TestView: UIView {

    @IBOutlet weak var contentView: UIView!
   
    @IBOutlet weak var mtitle: UILabel!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var mOverview: UILabel!
    @IBOutlet weak var releaseDate: UILabel!
    @IBOutlet weak var mGenre: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder : aDecoder)
        commonInit()
    }

    private func commonInit(){
        //contentView = UINib(nibName: "TestView", bundle: .main).instantiate(withOwner: nil, options: nil).first as? UIView
        Bundle.main.loadNibNamed("TestView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
}
