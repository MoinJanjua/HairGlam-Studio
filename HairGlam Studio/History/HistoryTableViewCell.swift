//
//  HistoryTableViewCell.swift
//  HairGlam Studio
//
//  Created by Farrukh UCF on 07/10/2024.
//

import UIKit

class HistoryTableViewCell: UITableViewCell {

    @IBOutlet weak var imagev: UIImageView!
    
    @IBOutlet weak var Titlelbl: UILabel!
    
    @IBOutlet weak var Datelbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        roundCorneView(image:imagev)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
