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
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        search_bar.delegate = self
        
    }


    // calling when search button click on keyboard to hide keyboard.
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar)
    {
            searchBar.resignFirstResponder()
    }
   
}

extension SearchVC : UITableViewDelegate, UITableViewDataSource
{
    // Assign count value to show number of rows in tableview.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return 10
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
