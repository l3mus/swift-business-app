//
//  MapViewController.swift
//  DamarisJams-app
//
//  Created by Carlos Lemus on 2/7/17.
//  Copyright © 2017 Carlos Lemus. All rights reserved.
//

import UIKit
import MapKit


class MapViewController: UIViewController {

    @IBOutlet weak var event_location: MKMapView!
    // set initial location in Honolulu
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let initialLocation = CLLocation(latitude: 40.8422, longitude: 74.0024)
        
        centerMapOnLocation(location: initialLocation)
        // Do any additional setup after loading the view.
    }
    
    let regionRadius: CLLocationDistance = 1000
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
                                                                  regionRadius * 2.0, regionRadius * 2.0)
        event_location.setRegion(coordinateRegion, animated: true)
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
