//
//  Model.swift
//  NasaWorkdayApp
//
//  Created by Piyush Manghani on 7/3/23.
//

import Foundation
struct Collection: Codable
{
  
    let collection : collection_model?
    struct  collection_model  : Codable {
      
       
        let items : [Items_model]?
        
        struct  Items_model  : Codable {
            let href : String?
            let data : [Itemdata_model]?
            struct  Itemdata_model  : Codable {
                let description : String?
                let title : String?
                let date_created : String?
                let location : String?
                
            }
           
        }
        
    }
    
}
