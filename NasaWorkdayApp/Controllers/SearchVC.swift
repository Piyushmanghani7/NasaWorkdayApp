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
        
    }
    
    // calling when search button click on keyboard to hide keyboard.
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar)
    {
        searchBar.resignFirstResponder()
    }
    
    //Calling API based on the search text
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        //Clear the array
        self.Searched_items.removeAll()
        
        // Reload the table view to reflect the empty data
        self.tableview.reloadData()
        
        // API request with the updated search value
        Searcheddata(withSearchText: searchText)
        
        //Progressbar
        let hud = JGProgressHUD(style: .light)
        hud.textLabel.text = "Processing..."
        hud.show(in: self.view)
        hud.dismiss(animated: true)
        
        
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
                print("pagecount",self.pagecount!)
                
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
        
        cell.item_title?.text = self.Searched_items[indexPath.row].data?[0].title
        
        // Convert the date format using DateFormatter() function.
        let datename = (self.Searched_items[indexPath.row].data?[0].date_created)!
        let inputDateFormatter = DateFormatter()
        inputDateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        
        
        if let inputDate = inputDateFormatter.date(from: datename) {
            let outputDateFormatter = DateFormatter()
            outputDateFormatter.dateStyle = .medium
            
            
            let outputDateString = outputDateFormatter.string(from: inputDate)
            cell.item_date.text = outputDateString
        }
        
        //Calling Download function to convert the image string format to UIImage.
        let completelink = self.Searched_items[indexPath.row].links?[0].href
        cell.Item_img.downloaded(from: completelink!)
        cell.Item_img.contentMode = .scaleAspectFill
        
        
        
        
        return cell
    }
    
    //For navigating to other VC with table view cell data.
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let DetailedVC = self.storyboard?.instantiateViewController(withIdentifier: "DetailedVC") as! DetailedVC
        
        DetailedVC.Image = (self.Searched_items[indexPath.row].links?[0].href)!
        DetailedVC.titles = (self.Searched_items[indexPath.row].data?[0].title)!
        DetailedVC.descriptions = (self.Searched_items[indexPath.row].data?[0].description)!
        DetailedVC.date = (self.Searched_items[indexPath.row].data?[0].date_created)!
        DetailedVC.location = (self.Searched_items[indexPath.row].data?[0].location) ?? "USA"
        self.navigationController?.pushViewController(DetailedVC, animated: false)
        
    }
    
    //Assigning height to tableview cell.
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
    
    //API pagination.
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath)
    {
        print(indexPath.row)
        // Apply pagination condition
        if indexPath.row == (pagecount! - 1) * self.initialpage
        {
            initialpage += 1
            Searcheddata(withSearchText: search_bar.text!)
            
        }
        
        
    }
}

//  Function to convert the image url into UIImage.
extension UIImageView {
    func downloaded(from url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
            else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
    func downloaded(from link: String, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}

