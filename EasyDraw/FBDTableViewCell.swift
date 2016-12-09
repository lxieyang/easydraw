//
//  FBDTableViewCell.swift
//  EasyDraw
//
//  Created by Hanling on 2016/12/9.
//  Copyright © 2016年 saifjilani. All rights reserved.
//

import UIKit

class FBDTableViewCell: UITableViewCell {

    
    @IBOutlet weak var thumbnailCanvasImageView: UIImageView!
    
    
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        
        // Initialization code
        
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        
        super.setSelected(selected, animated: animated)
        
        
        // Configure the view for the selected state
        
    }


}
