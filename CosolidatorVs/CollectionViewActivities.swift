//
//  CollectionViewActivities.swift
//  CosolidatorVs
//
//  Created by STIelev on 2020-02-04.
//  Copyright © 2020 STIelev. All rights reserved.
//

import Foundation
import UIKit
class CollectionViewActivities: UICollectionView, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return item.count
    }
    
    
    let reusable = "cell"
    var item = ["Monday","Tuesday","Wenesday","Thursday", "Friday","Saturday","Sunday"]
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
        print("Sleep")
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
     
        
      //  withAttributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12.0)]
        
       let size: CGSize = item[indexPath.row].size()
        return CGSize(width: size.width + 10 , height: collectionView.bounds.size.height)

    }

     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
     
     let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reusable, for: indexPath as IndexPath) as! CollectionViewCellActivities

            cell.dayOftheWeek.text = item[indexPath.item]
 
   
         return cell;
     }


 
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        
        let cell = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "cellHeader", for: indexPath )
        as! CollectionViewCellActivities
        cell.monday.text = item[indexPath.row]
       // cell.textLabel.sizeToFit()
        
        // Customize cell height
        
        
        return cell
     
     
        // cellHea is your identifier
 
        /*
        header.monday.text = "Monday"
        header.tursday.text = "Tursday"
        header.wenesday.text = "Wenesday"
        header.thursday.text = "Thursday"
        header.friday.text = "Friday"
        header.saturday.text = "Saturday"
        header.sunday.text = "Sunday"
 */
     
        

        
    
        
    }
    
   
    
}
