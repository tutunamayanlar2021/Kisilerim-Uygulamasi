//
//  KisilerHucreTableViewCell.swift
//  KisilerUygulamasi
//
//  Created by Kader Oral on 3.08.2023.
//

import UIKit

class KisilerHucre: UITableViewCell {

    @IBOutlet weak var labelKisiAd: UILabel!
    
    @IBOutlet weak var labelKisiTel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
