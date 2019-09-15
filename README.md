Howdy Imgur (Hello Imgur)
======================================

Howdy Imgur is an iOS app written in Swift language (Swift 5.0). Xcode IDE version used for developing this app is Xcode Version 10.3 (10G8).


About
======================================

Howdy Imgur app contains a single view which searches for the top images of the week from the Imgur gallery and display it in a list view. App needs to provide user the ability to input text as part of the search query before displaying relevant results. 

The app uses a single REST API (https://api.imgur.com/3/gallery/search/top/week?q=) , for fethcing data from the server.

The Design pattern/Architecture used for Howdy Imgur app is 'VIPER' architecture. Unit tests for UI as well as APIs are written and the app is having a good code coverage.

Howdy Imgur app is a universal iOS app which runs in iPhone as well as in iPad (and in portrait and landscpe mode). 



Installation
======================================

1. Clone the repository, "https://github.com/ipran/Howdy-Imgur" , from a Mac OS
2. Go inside the project folder, and open "Howdy Imgur.xcworkspace"
3. It will open the Xcode with Howdy Imgur project
4. If the Xcode display nothing or showing some error message, go to terminal and cd to project folder and type "pod install", this will install the third party libraries.
5. Open "Howdy Imgur.xcworkspace" again from the project folder and click run button. 
