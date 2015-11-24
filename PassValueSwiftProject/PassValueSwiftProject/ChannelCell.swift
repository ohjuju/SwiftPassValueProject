//
//  ChannelCell.swift
//  PassValueSwiftProject
//
//  Created by OKAR OU (EUCD-EUC-ISD-OOCLL/ZHA) on 11/23/15.
//  Copyright © 2015 OKAR OU. All rights reserved.
//

import UIKit

class ChannelCell: UITableViewCell {

    @IBOutlet var channelIconView: UIImageView!
    @IBOutlet var channelTitle: UILabel!
    @IBOutlet var channelSwitch: UISwitch!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
