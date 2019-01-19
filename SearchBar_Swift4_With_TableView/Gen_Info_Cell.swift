//
//  Gen_Info_Cell.swift
//  SearchBar_Swift4_With_TableView
//
//  Created by DeEp KapaDia on 07/07/18.
//  Copyright © 2018 DeEp KapaDia. All rights reserved.
//

import UIKit

class Gen_Info_Cell: UITableViewCell {

    @IBOutlet weak var nameLBL: UILabel!
    @IBOutlet weak var WorkLBL: UILabel!
    @IBOutlet weak var img: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
