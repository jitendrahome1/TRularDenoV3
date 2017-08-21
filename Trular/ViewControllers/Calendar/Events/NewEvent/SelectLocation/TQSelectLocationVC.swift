//
//  TQSelectLocationVC.swift
//  Trular
//
//  Created by Shivapurapu Mahendra on 18/07/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit
import GoogleMaps
import CoreLocation
import GooglePlaces

class TQSelectLocationVC: TQBaseViewController,GMSMapViewDelegate,GMSAutocompleteViewControllerDelegate,CLLocationManagerDelegate {
    
    //CallBack
    var selectedLocation:((CLLocationCoordinate2D, String)->Void)?
    
    @IBOutlet weak var gradientView: UIView!
    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var mapView: GMSMapView!
    @IBOutlet weak var resultsView: UIView!

    @IBOutlet weak var pickedLocationLbl: UILabel!
    @IBOutlet weak var pickedLocationNameLbl: UILabel!
    @IBOutlet weak var pickedLocationDescLbl: UILabel!
    
    @IBOutlet weak var currentLocationBtn: UIButton!
    
    var placesClient: GMSPlacesClient!

    var pickedLocation:CLLocationCoordinate2D?
    var pin:GMSMarker?
    
    lazy var locationManager: CLLocationManager = {
        var _locationManager = CLLocationManager()
        _locationManager.delegate = self
        _locationManager.distanceFilter = kCLDistanceFilterNone
        _locationManager.desiredAccuracy = kCLLocationAccuracyBest
        return _locationManager
    }()
    
    var didAddShadow = false, didSearchForPlace = false
    
    //MARK:- View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.setupMap()
        self.setupLocationManager()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        if !didAddShadow {
            self.setupUI()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        self.hideNavigationBar = false
        
        self.setLeftNavigationButtons(leftButtonType: .Back, backImage: #imageLiteral(resourceName: "BackWhite"), barTintColor: .clear, itemTintColor: .white,isBarTranslucent: true)
        
        self.setNavigationTitle(title: "Vendors", titleColor: .white, subtitle: "ID: 456454", subtitleColor: .white)
        
        self.extendedLayoutIncludesOpaqueBars = true
        self.edgesForExtendedLayout = .top
        self.showSidePanel = false
    }
    
    //MARK:- Initial Setup
    func setupUI() {
        
        print("shadowSetup")
        let gradient = CAGradientLayer()
        gradient.frame = self.gradientView.bounds
        gradient.colors = [UIColor.init(colorLiteralRed: 98.0/255.0, green: 98.0/255.0, blue: 98.0/255.0, alpha: 1.0).cgColor,UIColor.init(colorLiteralRed: 98.0/255.0, green: 98.0/255.0, blue: 98.0/255.0, alpha: 0.7).cgColor,UIColor.init(colorLiteralRed: 98.0/255.0, green: 98.0/255.0, blue: 98.0/255.0, alpha: 0.3).cgColor,UIColor.clear.cgColor]
        
        gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradient.endPoint = CGPoint(x: 0.0, y: 1.0)
        
        self.gradientView.layer.insertSublayer(gradient, at: 0)
        
        self.searchView.layer.cornerRadius = 2
        
        self.searchView.layer.shadowRadius = 2.0
        self.searchView.layer.shadowColor = UIColor.darkGray.cgColor
        self.searchView.layer.shadowOpacity = 0.5
        self.searchView.layer.shadowOffset = CGSize(width: 0.0, height: 0.5)
        self.searchView.layer.masksToBounds = false
        
        self.resultsView.layer.shadowPath = UIBezierPath.init(roundedRect: CGRect.init(x: 0, y: 0, width: self.resultsView.frame.width, height: 5.0), cornerRadius: 2.0).cgPath
        self.resultsView.layer.shadowRadius = 2.0
        self.resultsView.layer.shadowColor = UIColor.darkGray.cgColor
        self.resultsView.layer.shadowOpacity = 0.5
        self.resultsView.layer.shadowOffset = CGSize(width: 0.0, height: -0.5)
        self.resultsView.layer.masksToBounds = false
        
        self.currentLocationBtn.layer.cornerRadius = 25
        
        self.currentLocationBtn.layer.shadowRadius = 2.0
        self.currentLocationBtn.layer.shadowColor = UIColor.darkGray.cgColor
        self.currentLocationBtn.layer.shadowOpacity = 0.5
        self.currentLocationBtn.layer.shadowOffset = CGSize(width: 0.0, height: 0.5)
        self.currentLocationBtn.layer.masksToBounds = false
        
        didAddShadow = true
    }
    
    func setupLocationManager() {
        
        if(CLLocationManager.authorizationStatus() == .notDetermined) {
            locationManager.requestWhenInUseAuthorization()
        }
        self.locationManager.startUpdatingLocation()
        placesClient = GMSPlacesClient()
    }
    
    func setupMap() {
        
        self.mapView.isMyLocationEnabled = false
        self.pickedLocationLbl.text = "Enter Location"
        self.pickedLocationNameLbl.text = ""
        self.pickedLocationDescLbl.text = ""
        
        pin = GMSMarker.init(position: self.mapView.projection.coordinate(for: mapView.center))
        pin!.appearAnimation = .pop
        pin!.groundAnchor = CGPoint.init(x: 0.5, y: 0.5)
        pin!.map = self.mapView
    }

    //MARK:- Google Maps Delegates
    func mapView(_ mapView: GMSMapView, idleAt position: GMSCameraPosition) {
        
        let mapCenter = self.mapView.projection.coordinate(for: mapView.center)
        
        let geocoder = GMSGeocoder()
        geocoder.reverseGeocodeCoordinate(mapCenter) { (response, error) in
            
            if let error = error {
                print("Unable to Reverse Geocode Location (\(error))")
                self.pickedLocationLbl.text = "\(mapCenter.latitude, mapCenter.longitude)"
                self.pickedLocationNameLbl.text = "\(mapCenter.latitude, mapCenter.longitude)"
                self.pickedLocationDescLbl.text = ""

            } else {
                
                if let results = response?.results() {
                    
                    var address = "", shortAddress = ""
                    for str in (results.first?.lines)! {
                        address += str
                    }
                    
                    if let thoroughfare = results.first?.thoroughfare {
                        shortAddress += thoroughfare
                    }
                    
                    if let locality = results.first?.locality {
                        
                        if shortAddress.characters.count > 0 {
                            shortAddress += ","+locality
                        } else {
                            shortAddress += locality
                        }
                    }
                    
                    if let subLocality = results.first?.subLocality {
                        
                        if shortAddress.characters.count > 0 {
                            shortAddress += ","+subLocality
                        } else {
                            shortAddress += subLocality
                        }
                    }
                    
                    self.pickedLocationLbl.text = shortAddress
                    self.pickedLocationNameLbl.text = shortAddress
                    self.pickedLocationDescLbl.text = address
                } else {
                    self.pickedLocationLbl.text = "\(mapCenter.latitude, mapCenter.longitude)"
                    self.pickedLocationNameLbl.text = "\(mapCenter.latitude, mapCenter.longitude)"
                    self.pickedLocationDescLbl.text = ""
                }
            }
        }
        self.pickedLocation = mapCenter
        pin!.appearAnimation = .pop
        pin!.position = mapCenter
        pin!.groundAnchor = CGPoint.init(x: 0.5, y: 0.5)
        pin!.map = mapView
    }
    
    //MARK:- Button Actions
    
    @IBAction func showLocationSearch(_ sender: UIButton) {
        print("showAutocomplete")
        let autocompleteController = GMSAutocompleteViewController()
        autocompleteController.delegate = self
        present(autocompleteController, animated: true, completion: nil)
    }
    
    @IBAction func goToCurrentLocationAction(_ sender: UIButton) {
        
        self.locationManager.startUpdatingLocation()
    }
    
    @IBAction func saveAction(_ sender: UIButton) {
        
        if (self.selectedLocation != nil) {
            
            if (self.pickedLocationDescLbl.text?.characters.count)! > 0 {
                self.selectedLocation!(self.pickedLocation!,self.pickedLocationDescLbl.text!)
            } else if (self.pickedLocationNameLbl.text?.characters.count)! > 0 {
                self.selectedLocation!(self.pickedLocation!,self.pickedLocationNameLbl.text!)
            } else {
                self.selectedLocation!(self.pickedLocation!,"")
            }
        }
        TQNavigationHelper.sharedInstance.contentMainNavVC.popViewController(animated: true)
    }
    
    //MARK:- GMSAutoCompleteControllerDelegates
    func viewController(_ viewController: GMSAutocompleteViewController, didAutocompleteWith place: GMSPlace) {
        print("Place name: \(place.name)")
        print("Place address: \(String(describing: place.formattedAddress))")
        print("Place attributions: \(String(describing: place.attributions))")
        dismiss(animated: true, completion: nil)
        
        pin!.position = place.coordinate
        pin!.groundAnchor = CGPoint.init(x: 0.5, y: 0.5)
        pin!.map = mapView
        
        self.mapView.animate(toLocation: place.coordinate)
        pickedLocation = place.coordinate
        self.pickedLocationLbl.text = "\(place.name)"
        self.pickedLocationNameLbl.text = "\(place.name)"
        self.pickedLocationDescLbl.text = "\(place.formattedAddress!)"
        self.pickedLocation = place.coordinate
    }
    
    func viewController(_ viewController: GMSAutocompleteViewController, didFailAutocompleteWithError error: Error) {
        // TODO: handle the error.
        print("Error: ", error.localizedDescription)
    }
    
    // User canceled the operation.
    func wasCancelled(_ viewController: GMSAutocompleteViewController) {
        dismiss(animated: true, completion: nil)
    }
    
    // Turn the network activity indicator on and off again.
    func didRequestAutocompletePredictions(_ viewController: GMSAutocompleteViewController) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    
    func didUpdateAutocompletePredictions(_ viewController: GMSAutocompleteViewController) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }
    
    //MARK:- Location Manager Delegate
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let location: CLLocation = locations.last!
        
        let camera = GMSCameraPosition.camera(withLatitude: location.coordinate.latitude,
                                              longitude: location.coordinate.longitude,
                                              zoom: 15.0)
        mapView.animate(to: camera)
        updateCurrentPlace()
        locationManager.stopUpdatingLocation()
    }
    
    func updateCurrentPlace() {
        
        placesClient.currentPlace(callback: { (placeLikelihoodList, error) -> Void in
            if let error = error {
                print("Pick Place error: \(error.localizedDescription)")
                return
            }
            
            if let placeLikelihoodList = placeLikelihoodList {
                for likelihood in placeLikelihoodList.likelihoods {
                    let place = likelihood.place
                    
                    self.pin!.position = place.coordinate
                    self.pin!.groundAnchor = CGPoint.init(x: 0.5, y: 0.5)
                    self.mapView.animate(toLocation: place.coordinate)
                    self.pickedLocation = place.coordinate
                    
                    self.pickedLocationLbl.text = "\(place.name)"
                    self.pickedLocationNameLbl.text = "\(place.name)"
                    
                    if let address = place.formattedAddress  {
                        self.pickedLocationDescLbl.text = "\(address)"
                    }
                }
            }
        })
    }
}
