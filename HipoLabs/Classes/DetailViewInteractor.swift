//
//  DetailViewInteractor.swift
//  HipoLabs
//
//  Created by bahadir on 1.04.2021.
//

import Foundation
import MapKit


class DetailViewInteractor {
    
    var member: Member?
    private var coordinate: CLLocationCoordinate2D?
     
    
    func initialize(with member: Member){
        self.member = member
    }

    func setupMap(map: MKMapView){
        guard let adress = member?.location else { return }
        getCoordinateFrom(address: adress) { coordinate, error in
            guard let coordinate = coordinate, error == nil else { return }
            DispatchQueue.main.async {
                self.coordinate = coordinate
                let initialLocation = CLLocation(latitude: coordinate.latitude, longitude: coordinate.longitude)
                map.centerToLocation(initialLocation)
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
