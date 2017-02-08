//
//  MapViewController.swift
//  DamarisJams-app
//
//  Created by Carlos Lemus on 2/7/17.
//  Copyright © 2017 Carlos Lemus. All rights reserved.
//

import UIKit
import MapKit


class MapViewController: BaseViewController, MKMapViewDelegate
{

    @IBOutlet weak var event_location: MKMapView!
    // set initial location in Honolulu
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let initialLocation = CLLocation(latitude: 36.110611, longitude: -115.207461)
        
        centerMapOnLocation(location: initialLocation)
        
        // show artwork on map
        let location = Location(title: "Jackpot Bar and Grill",
                              locationName: "4360 S Decatur Blvd Las Vegas, NV 89103",
                              discipline: "Bar and Gril",
                              coordinate: CLLocationCoordinate2D(latitude: 36.110611, longitude: -115.207461))
        
        event_location.addAnnotation(location)
        event_location.delegate = self
        
        
        self.navigationItem.title = "Concerts"
        
        self.addSlideMenuButton()
    }
    
    let regionRadius: CLLocationDistance = 1000
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius * 2.0, regionRadius * 2.0)
        event_location.setRegion(coordinateRegion, animated: true)
        
    }
    
    // 1
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if let annotation = annotation as? Location {
            let identifier = "pin"
            var view: MKPinAnnotationView
            if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
                as? MKPinAnnotationView { // 2
                dequeuedView.annotation = annotation
                view = dequeuedView
            } else {
                // 3
                view = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                view.canShowCallout = true
                view.calloutOffset = CGPoint(x: -5, y: 5)
            }
            return view
        }
        return nil
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
