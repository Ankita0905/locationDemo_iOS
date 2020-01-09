//
//  ViewController.swift
//  locationDemo_iOS
//
//  Created by Ankita Jain on 2020-01-09.
//  Copyright © 2020 Ankita Jain. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //set latitude na d longitude
        let latitude:CLLocationDegrees = 43.64
        let longitude:CLLocationDegrees = -79.38
        
        //set delta longitude and latitude
        let latDelta:CLLocationDegrees = 0.05
        let longDelta:CLLocationDegrees = 0.05
        
        //set the span
        let span=MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: longDelta)
        
        //set the location
        let location = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        
        //set the region
        let region = MKCoordinateRegion(center: location, span: span)
        
        //set the region on map
        mapView.setRegion(region, animated: true)
        
        //adding annotation for map
        let annotation = MKPointAnnotation()
        annotation.title = "Toronto City"
        annotation.subtitle = "City of Dreams"
        annotation.coordinate = location
        mapView.addAnnotation(annotation)
        
        //add long press gesture
        let lngPress=UILongPressGestureRecognizer(target: self, action: #selector(longPress))
        mapView.addGestureRecognizer(lngPress)

    }
    
    @objc func longPress(gestureRecognizer:UIGestureRecognizer)
    {
        let touchPoint = gestureRecognizer.location(in: mapView)
        let coordinate = mapView.convert(touchPoint, toCoordinateFrom: mapView)
        
        let annotation = MKPointAnnotation()
        annotation.title = "Place to Visit"
        annotation.coordinate = coordinate
        mapView.addAnnotation(annotation)
        
    }


}

