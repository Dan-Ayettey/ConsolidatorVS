//
//  ActivitiesRequest.swift
//  CosolidatorVs
//
//  Created by STIelev on 2020-02-06.
//  Copyright © 2020 STIelev. All rights reserved.
//

import Foundation
import UIKit


class CollectionsDataSourceActivitiesLogg: UICollectionView, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) ->
       
       UICollectionViewCell {
        
        

        
          
          let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "activitiesCell", for: indexPath) as! CollectionCellElements
        
           func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
               
               
            
               return  data.count
           }
        
          
          cell.cellData.text = data[indexPath.item]
          
         
             
           
             cell.backgroundColor = UIColor.lightText
              return cell
         
         
    
       
         //cell.backgroundColor = UIColor.lightGray
          
      
          
          
      }
    
  


    weak var update: UIButton!;
    
    let head = ["Project","Date","View","Update","Delete"]
    var data = ["Amazon", "2020/4/30","       (◉)","        ✎","        ☒","Amazon","2020/4/30","       (◉)","        ✎","        ☒"]
    
   
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
               
        
        
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "activitiesHeader", for: indexPath) as! CollectionCellElements
        
        
              headerView.head.text = head[0]
              headerView.head1.text = head[1]
              headerView.head2.text = head[2]
              headerView.head3.text = head[3]
              headerView.head4.text = head[4]
      (collectionView.collectionViewLayout as? UICollectionViewFlowLayout)?.sectionHeadersPinToVisibleBounds = true
        
        
        return headerView;

    }
    
   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        
        print(head.count)
     
        return  head.count
    }

    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {

       
       
             let paddingSpace = sectionInsets.left * (itemsPerRow
        + 9)
            let availableWidth = collectionView.frame.width - paddingSpace
              let widthPerItem = availableWidth / itemsPerRow
              
            return CGSize(width:widthPerItem, height: 40.0)
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
 
class  CollectionsDataSourceActivities: UICollectionView, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
           private let sectionInsets = UIEdgeInsets(top: 1.0,
                                                    left: 1.0,
           bottom: 1.0,
           right: 1.0)

         private let itemsPerRow: CGFloat = 5
    private var dateoftheweek=["Day","Month","Date","Hours","Minute","GMT"];

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 1.0, left: 58.0, bottom:1.0 , right: 1.0)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 46, height:30)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.item)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dateoftheweek.count;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:"dateoftheweek", for: indexPath) as! CollectionCellElements
        
        
        cell.dateoftheweek.text=dateoftheweek[indexPath.item]
        
        
        return cell;
     
    }
       
}
