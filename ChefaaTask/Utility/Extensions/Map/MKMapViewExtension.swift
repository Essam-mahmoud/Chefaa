//
//  MKMapViewExtension.swift
//  glamera
//
//  Created by Smart Zone on 12/23/19.
//  Copyright © 2019 Kerolos Rateeb. All rights reserved.
//

import Foundation
import MapKit

extension MKMapView {
    
    func zoomToLocatiom(location : CLLocation,level: Float) {
        let viewRegion = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: CLLocationDistance(level), longitudinalMeters: CLLocationDistance(level))
        self.setRegion(viewRegion, animated: true)
    }
    
    func drawRouts(routs : [MKRoute]) {
        for route in routs {
            
            if !self.overlays(in: .aboveRoads).isEmpty {
                self.removeOverlays(self.overlays(in: .aboveRoads))
            }
            self.addOverlay(route.polyline, level:.aboveRoads)
        }
    }
    
    
    func parseAddress(selectedItem: MKPlacemark) -> String {
        
        // put a space between "4" and "Melrose Place"
        let firstSpace = (selectedItem.subThoroughfare != nil &&
            selectedItem.thoroughfare != nil) ? " " : " "
        
        // put a comma between street and city/state
        let comma = (selectedItem.subThoroughfare != nil || selectedItem.thoroughfare != nil) &&
            (selectedItem.subAdministrativeArea != nil || selectedItem.administrativeArea != nil) ? ", " : " "
        
        // put a space between "Washington" and "DC"
        let secondSpace = (selectedItem.subAdministrativeArea != nil &&
            selectedItem.administrativeArea != nil) ? " " : " "
        
        let addressLine = String(
            format:"%@%@%@%@%@%@%@",
            // street number
            selectedItem.subThoroughfare ?? " ",
            firstSpace,
            // street name
            selectedItem.thoroughfare ?? " ",
            comma,
            // city
            selectedItem.locality ?? " ",
            secondSpace
            ,
            // state
            selectedItem.administrativeArea ?? " "
        )
        return addressLine
    }

}
