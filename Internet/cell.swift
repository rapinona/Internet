//
//  cell.swift
//  Internet
//
//  Created by Piñón Ayala Rodrigo  on 29/10/22.
//

import UIKit
import WebKit

class cell: UITableViewCell {

    
    @IBOutlet var personajeImage: WKWebView!
    @IBOutlet var namePersonaje: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
