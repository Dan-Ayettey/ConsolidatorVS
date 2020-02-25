//
//  ConsolidatorMap.swift
//  CosolidatorVs
//
//  Created by STIelev on 2020-02-22.
//  Copyright © 2020 STIelev. All rights reserved.
//

import Foundation
import MapKit
import CoreLocation
class ConsolidatorMap:ViewController,  CLLocationManagerDelegate{
    @IBOutlet  var  mainMapView : MKMapView!
    
    @IBOutlet weak var zoomSlider: UISlider!
    
    @IBOutlet weak var MapToFullScreen: UIButton!;
    private var locationManager = CLLocationManager();
    private var isMapMinimize = true;  override func
        
        
     viewDidLoad() {
        super.viewDidLoad()
        
        mainMapView.showsUserLocation = true
        zoomSlider.transform = CGAffineTransform(rotationAngle: .pi/2)
    
    if (CLLocationManager.locationServicesEnabled())
    {
        
     
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation();
        mapUpdate(longit: 59.33258,lati: 18.0649);
          mapUpdate(longit: 59.33208,lati: 18.0649);
          mapUpdate(longit: 59.33228,lati: 18.0649);
    }
        
        
    }
    @IBAction func MapProjectToFullScreen(_ sender: UIButton, forEvent event:
      

      
        
        
        UIEvent) {
       
        if(isMapMinimize){
            mainMapView.frame = self.view.bounds
            isMapMinimize = false;
            sender.transform = .init(rotationAngle: .pi)
            
            
        }else{
            mainMapView.frame = .init(x: 0, y:503, width:415 , height: 279)
             sender.transform = .init(rotationAngle: .pi/76)
            isMapMinimize = true;
        }
        
       
    
       
}
    @IBAction func zoomSliderValueChange(_ sender: UISlider) {
        
        mainMapView.isPitchEnabled = true;
        
        mainMapView.camera.altitude = Double(sender.value)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
       
    }
    
    func mapUpdate( longit: Double,
        lati: Double )
    {
     
        let center =  CLLocationCoordinate2D(latitude: longit, longitude:lati )
        let region = MKCoordinateRegion(center: center, latitudinalMeters: 100.0, longitudinalMeters: 100.0)
        
        mainMapView.setRegion(region, animated: true)
        MarkVistArea(map: mainMapView,longitude: longit, latitude: lati,placeName: "Interaction",subName: "Data Center")
    }
    

    
    func MarkVistArea(map: MKMapView,longitude: Double, latitude:Double,placeName: String, subName : String){
        let marker = MKPointAnnotation();
        marker.title = placeName;
         marker.subtitle = subName;
        let coord = CLLocationCoordinate2D(latitude: longitude, longitude: latitude);        marker.coordinate = coord
        mainMapView.addAnnotation(marker)
       }
}
