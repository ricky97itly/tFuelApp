//
//  HomeController.swift
//  tFuel
//
//  Created by Riccardo Mores on 04/07/2019.
//  Copyright © 2019 Riccardo Mores. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
import FittedSheets

class HomeController: UIViewController {
    @IBOutlet weak var mapView: MKMapView!
    let annotation = MKPointAnnotation()
    let locationManager = CLLocationManager()
//    Initial zoom on user
    let regionRadius: CLLocationDistance = 1000
    var previousLocation: CLLocation?
    
        override func viewDidLoad() {
        super.viewDidLoad()
            checkLocationServices()
            queryFuelStations()
    }
    
//    Function that handles the query and serves the annotations to the map
    func queryFuelStations() {
        let request = MKLocalSearch.Request()
//        This function uses natural language querying... Not sure if this can be improved. Set a low prio issue
        request.naturalLanguageQuery = "Petrol Station"
        request.region = mapView.region
        let search = MKLocalSearch(request: request)
        search.start { (response, err) in
            guard let response = response else { return }
            for mapItem in response.mapItems {
//                Creates a new annotation and uses the phone number as description, just a temporary change
                let annotation = MKPointAnnotation()
                annotation.title = mapItem.name
                annotation.coordinate = mapItem.placemark.coordinate
                annotation.subtitle = mapItem.phoneNumber
                self.mapView.addAnnotation(annotation)
            }
        }
    }
    
    //   Zoom on user
    func centerViewOnUserLocation() {
        if let location = locationManager.location?.coordinate {
            let region = MKCoordinateRegion.init(center: location, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
            mapView.setRegion(region, animated: true)
        }
    }
    
    func startTackingUserLocation() {
        mapView.showsUserLocation = true
        centerViewOnUserLocation()
        locationManager.startUpdatingLocation()
        previousLocation = getCenterLocation(for: mapView)
    }
    
    func getCenterLocation(for mapView: MKMapView) -> CLLocation {
        let latitude = mapView.centerCoordinate.latitude
        let longitude = mapView.centerCoordinate.longitude
        
        return CLLocation(latitude: latitude, longitude: longitude)
    }
    
    //    On btn click center user position
    @IBAction func centerMap(_ sender: UIButton) {
    mapView.setUserTrackingMode(MKUserTrackingMode.follow, animated: true)
    }
    
    
    //   Ajust location
    func setupLocationManager() {
        locationManager.delegate = self as CLLocationManagerDelegate
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    //  Location services check
    func checkLocationServices() {
        if CLLocationManager.locationServicesEnabled() {
            setupLocationManager()
            checkLocationAuthorization()
        }
        else {
            Alert.showAlert(on: self, with: "Warning!", message: "You have to allow tFuel to see your position.")
        }
    }
    
    //    Switch to check every case of location
    func checkLocationAuthorization() {
        switch CLLocationManager.authorizationStatus() {
        case .authorizedWhenInUse:
            startTackingUserLocation()
        case .denied:
            Alert.showAlert(on: self, with: "Warning!", message: "You have to allow tFuel to see your position.")
            break
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            Alert.showAlert(on: self, with: "Warning!", message: "Parental control could be on, deactivate it to have complete access on tFuel's functions.")
            break
        case .authorizedAlways:
            break
        @unknown default:
            print("modify")
        }
    }
    
}

extension HomeController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        checkLocationAuthorization()
    }
}

extension HomeController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        if let annotation = view.annotation {
            mapView.setCenter(annotation.coordinate, animated: true)
//            ContextMenu.shared.show(sourceViewController: self, viewController: MapPopUpView(stationTitle: annotation.title!!))
            let controller = MapPopUpView(stationTitle: annotation.title!!)
            let sheetController = SheetViewController(controller: controller)
            
            // Adjust how the bottom safe area is handled on iPhone X screens
            sheetController.blurBottomSafeArea = true
            sheetController.adjustForBottomSafeArea = false
            
            // Turn off rounded corners
            sheetController.topCornersRadius = 0
            
            // Make corners more round
            sheetController.topCornersRadius = 15
            
            // Disable the dismiss on background tap functionality
            sheetController.dismissOnBackgroundTap = true
            
            // Extend the background behind the pull bar instead of having it transparent
            sheetController.extendBackgroundBehindHandle = true
            
            sheetController.handleColor = UIColor(named: "accentcolor")!
            sheetController.overlayColor = UIColor(named: "transparent")!
            
            // It is important to set animated to false or it behaves weird currently
            self.present(sheetController, animated: false, completion: nil)
        }
    }
    
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        let center = getCenterLocation(for: mapView)
//        To convert lat and long
        let geoCoder = CLGeocoder()
        
        guard let previousLocation = self.previousLocation else { return }
        
        guard center.distance(from: previousLocation) > 50 else { return }
        self.previousLocation = center
        
        geoCoder.reverseGeocodeLocation(center) { [weak self] (placemarks, error) in
            guard let self = self else { return }
            
            if let _ = error {
                Alert.showAlert(on: self, with: "Warning!", message: "Is not possible to see where the pointer is.")
                return
            }
            
            guard let placemark = placemarks?.first
                else {
                    Alert.showAlert(on: self, with: "Warning!", message: "Is not possible to see where the pointer is.")
                    return
            }
        }
    }
}

