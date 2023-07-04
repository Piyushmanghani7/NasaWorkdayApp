//
//  DetailedVC.swift
//  NasaWorkdayApp
//
//  Created by Piyush Manghani on 7/3/23.
//

import UIKit

class DetailedVC: UIViewController {
    @IBOutlet weak var detailImage: UIImageView!
    
    @IBOutlet weak var date_lbl: UILabel!
    @IBOutlet weak var location_lbl: UILabel!
 
    @IBOutlet weak var description_lbl: UILabel!
   
    @IBOutlet weak var title_lbl: UILabel!
    
    public var Image: String = ""
    public var titles: String = ""
    public var descriptions: String = ""
    public var date: String = ""
    public var location: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // calling download func to convert the image url into UIImage.
        detailImage.downloaded(from: Image)
        detailImage.contentMode = .scaleAspectFill
        
        title_lbl.text = titles
        description_lbl.text = descriptions
        location_lbl.text = location
        // Convert the date format using DateFormatter() function.
        let inputDateFormatter = DateFormatter()
        inputDateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        

    if let inputDate = inputDateFormatter.date(from: date) {
            let outputDateFormatter = DateFormatter()
            outputDateFormatter.dateStyle = .medium
            

        let outputDateString = outputDateFormatter.string(from: inputDate)
        date_lbl.text = outputDateString
        }
        
    }
    

}
