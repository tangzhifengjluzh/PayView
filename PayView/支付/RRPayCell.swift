//
//  RRPayCell.swift
//  RRSTCOURIER
//
//  Created by mac on 2018/12/17.
//  Copyright © 2018 YANGGQ. All rights reserved.
//

import UIKit

class RRPayCell: UITableViewCell {
    @IBOutlet weak var imagepic: UIImageView!
    @IBOutlet weak var lablename: UILabel!
    @IBOutlet weak var imagechcek: UIImageView!
    //    public var myrow:NSInteger = NSInteger(){
//                didSet {
//                    switch myrow {
//                    case 0:
//                        do {
//                            self.imagepic.image = UIImage(named: "")
//                            self.lablename.text = "";
//                        }
//                    case 1:
//                        do {
//                            self.imagepic.image = UIImage(named: "账户充值_03")
//                            self.lablename.text = "";
//                        }
//                    case 2:
//                        do {
//                            self.imagepic.image = UIImage(named: "账户充值_10")
//                            self.lablename.text = "";
//                        }
//                    default:
//
//                    }
//        }
//    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
