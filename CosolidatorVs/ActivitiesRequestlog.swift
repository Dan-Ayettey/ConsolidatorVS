//
//  ActivitiesRequest.swift
//  CosolidatorVs
//
//  Created by STIelev on 2020-02-06.
//  Copyright © 2020 STIelev. All rights reserved.
//

import Foundation
import UIKit

class ActivitiesRequestlog: UICollectionView, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    


    weak var update: UIButton!;
    let head = ["Project","Date","View","Update","Delete"]
    var data = ["Amazon", "2020/4/30","       (◉)","        ✎","        ☒","Amazon","2020/4/30","       (◉)","        ✎","        ☒"]
    
   
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
       
        
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "activitiesCellHead", for: indexPath) as! ActivitiesRequestViewCell;
        
              headerView.head.text = head[0]
              headerView.head1.text = head[1]
              headerView.head2.text = head[2]
              headerView.head3.text = head[3]
              headerView.head4.text = head[4]
      (collectionView.collectionViewLayout as? UICollectionViewFlowLayout)?.sectionHeadersPinToVisibleBounds = true
        
        return headerView

    }
    
   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        
     
        return  data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {

       
       
             let paddingSpace = sectionInsets.left * (itemsPerRow
        + 9)
            let availableWidth = collectionView.frame.width - paddingSpace
              let widthPerItem = availableWidth / itemsPerRow
              
            return CGSize(width:widthPerItem, height: 40.0)
           }
 
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      
      
      
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "activitiesCell", for: indexPath) as! ActivitiesRequestViewCell
      
         
      
        cell.event.text = data[indexPath.item]
        
       
           
         
           cell.backgroundColor = UIColor.lightText
            return cell
       
       
  
     
       //cell.backgroundColor = UIColor.lightGray
        
    
        
        
    }
    
    
        
        private let sectionInsets = UIEdgeInsets(top: 1.0,
                                                 left: 1.0,
        bottom: 1.0,
        right: 1.0)

      private let itemsPerRow: CGFloat = 5
       func collectionView(_ collectionView: UICollectionView,
                            layout collectionViewLayout: UICollectionViewLayout,
                            sizeForItemAt indexPath: IndexPath) -> CGSize {
          //2
       
    
          let paddingSpace = sectionInsets.left * (itemsPerRow
    + 1)
        let availableWidth = collectionView.frame.width - paddingSpace
          let widthPerItem = availableWidth / itemsPerRow
          
        return CGSize(width:widthPerItem, height: 30.0)
        }
        
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
        print(indexPath.item)
    }
    
}

