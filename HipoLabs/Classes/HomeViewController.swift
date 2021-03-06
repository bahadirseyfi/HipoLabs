//
//  HomeViewController.swift
//  HipoLabs
//
//  Created by bahadir on 27.03.2021.
//

import UIKit

protocol AddNewMemberProtocol {
    func addMember()->Member
}

class HomeViewController: UIViewController {
    
    private var interactor: HomeViewInteractor = HomeViewInteractor()
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchTextField: UITextField!
    
    var delegate: AddNewMemberProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        tableView.dataSource = self
        tableView.delegate = self
    }
    
   private func setupUI(){
        searchTextField.addTarget(self, action: #selector(textFieldDidChanged(_:)), for: .editingChanged)
        interactor.membersArray {
            self.tableView.reloadData()
        }
        if let newMember = delegate?.addMember(){
            interactor.filtered_members.append(newMember)
        }
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }

    private func redirectTo(member: Member) {
        
        self.view.endEditing(true)
        searchTextField?.text = nil
        let viewController = DetailViewController.instantiateViewController(with: "DetailViewController")
        viewController.initializer(with: member)
        viewController.modalPresentationStyle = .fullScreen
        self.showDetailViewController(viewController, sender: nil)
    }
    
    @IBAction func sortBtnClicked(_ sender: UIButton) {

    }
    
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return interactor.filtered_members.count
 }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MembersCell") as! MembersCell
        let member = interactor.filtered_members[indexPath.row]
        cell.setupUI(for: member)
        return cell
 }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selected_member = interactor.filtered_members[indexPath.row]
        redirectTo(member: selected_member)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }


}
extension HomeViewController : UITextFieldDelegate {
    
    @objc func textFieldDidChanged(_ sender: UITextField) {
        interactor.filterArray(by: searchTextField?.text, completion: {
            self.tableView?.reloadData()
        })
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
