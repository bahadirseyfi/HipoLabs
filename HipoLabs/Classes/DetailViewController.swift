//
//  DetailViewController.swift
//  HipoLabs
//
//  Created by bahadir on 27.03.2021.
//

import UIKit
import MapKit

class DetailViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var githubLabel: UILabel!
    @IBOutlet weak var hipoYearsLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    
 
    private var interactor: DetailViewInteractor = DetailViewInteractor()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        
        if #available(iOS 13.0, *) {
            self.overrideUserInterfaceStyle = .dark
        }
        
    }
    
    
    private func redirectTo(){
        
        self.view.endEditing(true)
        let viewController = GitHubViewController.instantiateViewController(with: "GitHubViewController")
        if let githubName = interactor.member?.github {
            viewController.initializer(github: githubName)
        }
        viewController.modalPresentationStyle = .fullScreen
        self.showDetailViewController(viewController, sender: nil)
    }
    
    func initializer(with member: Member){
        interactor.initialize(with: member)
    }

    func setupUI(){
        
        interactor.setupMap(map: mapView)
        
        nameLabel.text = interactor.member?.name
        if let age = interactor.member?.age {
            ageLabel.text = String(age)
        }
        if let hipoYears = interactor.member?.hipo?.years_in_hipo {
            hipoYearsLabel.text = String(hipoYears)
        }
        githubLabel.text = interactor.member?.github
        locationLabel.text = interactor.member?.location
    }
    
    @IBAction func backButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func githubBtnClicked(_ sender: UIButton) {
        redirectTo()
    }

}


