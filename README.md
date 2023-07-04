# NasaWorkdayApp
Workday iOS position Project
I have used the 'Alamofire', '~> 5.0' library for fetching API data (GET request with some parameters). Add Alamofire as a dependency using Swift Package Manage
I have used "GProgressHUD" a third-party library that provides an easy way to display progress indicators in our applications and to show loading indicators that are temporary visual feedback to the user.
The architecture of this application is MVC(Model-View-Controllers). I created a model class using a struct that represents the encapsulates the data structures. View contain the table view cell components and controllers like SearchVC and detailVC represents the  connection between model class and view.
Build & Run - I have set the deployment target as per my simulator settings with on iOS 14. Please update as per your comfortability. Just simply build the application by choosing appropriate simulator. It will show first screen on which user need to enter the search query. On pressing search button API data will fetch the items and show on the table view cells with paginations.
