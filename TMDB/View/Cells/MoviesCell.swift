//
//  MoviesCell.swift
//  TMDB
//
//  Created by Mahmoud on 5/17/20.
//  Copyright © 2020 Mahmoud. All rights reserved.
//

import UIKit

class MoviesCell: UITableViewCell {
    


        
    
      
    
    //MARK:- IBOutlets
    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
   
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
