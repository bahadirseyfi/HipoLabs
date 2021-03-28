//
//  HomeViewController.swift
//  HipoLabs
//
//  Created by bahadir on 27.03.2021.
//

import UIKit

class HomeViewController: UIViewController {
 
    let array = ["ali","selami","zafer","mehmet"]

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        
    }
    
    
    private func redirectTo(to name: String) {
        
        self.view.endEditing(true)
    
        let viewController = DetailViewController.instantiateViewController(with: "DetailViewController")
    
        viewController.initName = name
      //  self.performSegue(withIdentifier: "toDetail", sender: self)
        viewController.modalPresentationStyle = .fullScreen
        self.showDetailViewController(viewController, sender: nil)
        
        
    }

    
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MembersCell") as! MembersCell
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        60
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        let index = array[indexPath.row]
        redirectTo(to: index)
        
        
        
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }

}

