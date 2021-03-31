//
//  MembersCell.swift
//  HipoLabs
//
//  Created by bahadir on 27.03.2021.
//

import UIKit

class MembersCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupUI(for member: Member){
        nameLabel.text = member.name
    }

}
