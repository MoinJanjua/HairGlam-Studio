//
//  HomeTableViewCell.swift
//  HairGlam Studio
//
//  Created by Farrukh UCF on 07/10/2024.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    
    @IBOutlet weak var roundview: UIView!
    @IBOutlet weak var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        roundCornerView(view:roundview)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
