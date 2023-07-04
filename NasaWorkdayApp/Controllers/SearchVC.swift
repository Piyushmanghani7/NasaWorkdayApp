//
//  ViewController.swift
//  NasaWorkdayApp
//
//  Created by Piyush Manghani on 7/3/23.
//

import UIKit
import JGProgressHUD
class SearchVC: UIViewController, UISearchBarDelegate {
    
    @IBOutlet weak var search_bar: UISearchBar!
    
    @IBOutlet weak var tableview: UITableView!
    
    var pagecount : Int? = 0
    private var Searched_items = [Collection.collection_model.Items_model]()
    var initialpage : Int = 1
    override func viewDidLoad() {
        super.viewDidLoad()
        search_bar.delegate = self
        Searcheddata(withSearchText: search_bar.text!)
    }
    
    
    // calling when search button click on keyboard to hide keyboard.
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar)
    {
        searchBar.resignFirstResponder()
    }
    
    // RESTAPI data fetching
    private func Searcheddata(withSearchText searchText:String)
    {
        
        let hud = JGProgressHUD(style: .light)
        hud.textLabel.text = "Processing..."
        hud.show(in: self.view)
        
        
        // calling RestAPI class function to fetch the data using searchbar value as parameter.
    
        RestAPI.sharedService.SearchFetch(SearchName: searchText, Page: initialpage){ (item_updates, error) in
            
            DispatchQueue.main.async {
                print("item_updates", item_updates!)
                //check condition of data != nil to append in local var.
                if item_updates != nil && error == nil
                {
                    
                    // Update the array using append function.
                    self.Searched_items.append(contentsOf: item_updates!)
                    // Reload Tableview
                    self.tableview.reloadData()
                    hud.dismiss(animated: true)
                }
                else{
                    
                    print("Data not fetched", error!)
                    
                }
                
                // update the page count value for pagination condition.
                self.pagecount = item_updates?.count
                print(self.pagecount!)
                
            }
            
        }
    }
    
    
}

extension SearchVC : UITableViewDelegate, UITableViewDataSource
{
    // Assign count value to show number of rows in tableview.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.Searched_items.count
    }
    
    //Showing API data in cell.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenubarCell", for: indexPath) as! MenubarCell
        
        return cell
    }
    
    //For navigating to other VC with table view cell data.
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    //Assigning height to tableview cell.
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
    
    //API pagination.
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath)
    {
        
        
    }
}
