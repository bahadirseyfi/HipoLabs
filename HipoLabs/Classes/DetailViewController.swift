//
//  DetailViewController.swift
//  HipoLabs
//
//  Created by bahadir on 27.03.2021.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    
    var initName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .red
        
        nameLabel.text = initName
    }
    
    @IBAction func backButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
