# NasaWorkdayApp
Workday iOS position Project
I have used the 'Alamofire', '~> 5.0' library for fetching API data (GET request with some parameters). Add Alamofire as a dependency using Swift Package Manage
I have used "GProgressHUD" a third-party library that provides an easy way to display progress indicators in our applications and to show loading indicators that are temporary visual feedback to the user.
The architecture of this application is MVC(Model-View-Controllers). I created a model class using a struct that encapsulates the data structures. The view contains the table view cell components and controllers like SearchVC and detailVC representing the  connection between model class and view.
Build & Run - I have set the deployment target as per my simulator settings on iOS 14. Please update as per your comfortability. Just simply build the application by choosing the appropriate simulator. It will show the first screen on which the user needs to enter the search query. On pressing the search button API data will fetch the items and show on the table view cells with paginations.
