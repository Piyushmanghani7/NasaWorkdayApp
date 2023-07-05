//
//  RestAPI.swift
//  NasaWorkdayApp
//
//  Created by Piyush Manghani on 7/3/23.
//

import Foundation
import Alamofire

struct RestAPI {

    // Base API url
    static let base_api = "https://images-api.nasa.gov"
    
}

extension RestAPI
{
    static let sharedService = RestAPI()
    
    //Function to featch the API data using parameters and returns the decoded data.
func SearchFetch(SearchName: String, Page: Int, completion: @escaping([Collection.collection_model.Items_model]?, _ error: Error?) -> ()) {
        
        let urlStr = RestAPI.base_api + "/search"
    
    //Parameter array to pass in API
        let parameters: [String: Any] = ["q": SearchName, "media_type": "image", "page" : Page]
    
    //API request using alamofire library.
    AF.request(urlStr, method: .get, parameters: parameters, encoding: URLEncoding.default).responseJSON{ response in
        
        guard response.error == nil else {return}
            guard let data = response.data
            else {
                completion(nil, nil)
                
                return
            }
            print("\(String(data: data, encoding: String.Encoding.utf8) ?? "No Data Found")")
            do {
                
                let decoder = JSONDecoder()
                let serverData = try decoder.decode(Collection.self, from: data)
                
                //Check the data
                print("serverData",serverData)
                
                completion(serverData.collection?.items, nil )
                
                
            }
            
            catch {
                print("error fetching",error.localizedDescription)
                completion(nil, error)
            }
        }
    }
}
