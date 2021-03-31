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
    
    private var currentMember: Member?
    var coordinate: CLLocationCoordinate2D?
    
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
        if let githubName = currentMember?.github {
            viewController.initializer(github: githubName)
        }
        
      //  viewController.initialize(with: member)
        viewController.modalPresentationStyle = .fullScreen
        self.showDetailViewController(viewController, sender: nil)
    }
    
    func setupUI(){
        
        setupMap()
        nameLabel.text = currentMember?.name
        if let age = currentMember?.age {
            ageLabel.text = String(age)
        }
        if let hipoYears = currentMember?.hipo?.years_in_hipo {
            hipoYearsLabel.text = String(hipoYears)
        }
        githubLabel.text = currentMember?.github
        locationLabel.text = currentMember?.location
    }
    
    func initialize(with member: Member){
        self.currentMember = member
    }
    
    @IBAction func backButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func githubBtnClicked(_ sender: UIButton) {
        redirectTo()
    }
    
    
    func setupMap(){
        
        guard let cityName = currentMember?.location else { return }
        let adress = cityName
        
        getCoordinateFrom(address: adress) { coordinate, error in
            guard let coordinate = coordinate, error == nil else { return }
            
            DispatchQueue.main.async {
                self.coordinate = coordinate
                let initialLocation = CLLocation(latitude: coordinate.latitude, longitude: coordinate.longitude)
                self.mapView.centerToLocation(initialLocation)
            }
        }
    }
    func getCoordinateFrom(address: String, completion: @escaping(_ coordinate: CLLocationCoordinate2D?, _ error: Error?) -> () ) {
        CLGeocoder().geocodeAddressString(address) { completion($0?.first?.location?.coordinate, $1) }
    }

}
private extension MKMapView {
  func centerToLocation(
    _ location: CLLocation,
    regionRadius: CLLocationDistance = 1000
  ) {
    let coordinateRegion = MKCoordinateRegion(
      center: location.coordinate,
      latitudinalMeters: regionRadius,
      longitudinalMeters: regionRadius)
    setRegion(coordinateRegion, animated: true)
  }
}

