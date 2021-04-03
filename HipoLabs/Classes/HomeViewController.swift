//
//  HomeViewController.swift
//  HipoLabs
//
//  Created by bahadir on 27.03.2021.
//

import UIKit

class HomeViewController: UIViewController {
    
    private var interactor: HomeViewInteractor = HomeViewInteractor()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        tableView.dataSource = self
        tableView.delegate = self
      
    }
    
    func setupUI(){
        interactor.fetchModel {
            self.tableView.reloadData()
        }
    }

    private func redirectTo(member: Member) {
        
        self.view.endEditing(true)
        let viewController = DetailViewController.instantiateViewController(with: "DetailViewController")
        viewController.initializer(with: member)
        viewController.modalPresentationStyle = .fullScreen
        
        self.showDetailViewController(viewController, sender: nil)
    }
    
    @IBAction func sortBtnClicked(_ sender: UIButton) {
        
        let new = Member()
        new.name = "bahadir"
        new.age = 31
        new.github = "bahadirseyfi"
        new.location = "istanbul"
        new.hipo?.position = "ios"
        new.hipo?.years_in_hipo = 12
        
        interactor.membersModel?.members?.append(new)
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let members = interactor.membersModel?.members else { return 0 }
        return members.count
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
        guard let member = memberModel.members else { return }
        let selected_member = member[indexPath.row]
        redirectTo(member: selected_member)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }

}

extension HomeViewController: AddMemberDelegate {
    func reload(member: Member) {
        interactor.membersModel?.members?.append(member)
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        
    }
}
