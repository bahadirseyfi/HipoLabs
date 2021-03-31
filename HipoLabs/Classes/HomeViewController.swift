//
//  HomeViewController.swift
//  HipoLabs
//
//  Created by bahadir on 27.03.2021.
//

import UIKit

class HomeViewController: UIViewController, AddMemberDelegate {
    
    // PROTOKOL --------------------
    
    func reload(member: Member) {
        interactor.membersModel?.members?.append(member)
        self.loadData()
    }
    
    func loadData(){
        tableView.reloadData()
    }
 
    // -------------------------------
    
    private var interactor: HomeViewInteractor = HomeViewInteractor()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        interactor.fetchModel()
    }
    
    private func redirectTo(member: Member) {
        
        self.view.endEditing(true)
        let viewController = DetailViewController.instantiateViewController(with: "DetailViewController")
        viewController.initialize(with: member)
        viewController.modalPresentationStyle = .fullScreen
        self.showDetailViewController(viewController, sender: nil)
    }
    
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return (interactor.membersModel?.members?.count)! // ! -------
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MembersCell") as! MembersCell
        let member = interactor.membersModel?.members![indexPath.row]
        cell.setupUI(for: member!) // ! ---------
            return cell
       
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        60
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        guard let memberModel = interactor.membersModel else { return }
        
        //--------- ! -------
        let memo = memberModel.members![indexPath.row]
        redirectTo(member: memo)
        
   
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }

}

