# Tech Crunch News Feed App

    The app tends to read news feed from the Tech Crunch API and show it in a list and detail screens



## Code Overview

    The code consists of below three modules
    - Feed Module (Where in feeds are downloaded over the network)
    - Feed Detail Module (Where in the details of the feed are shown)
    - Networking Module (Responsible for making network request)



## Architecture Design Pattern

    MVVM 
    - Feed is the Model
    - FeedViewModel is the ViewModel
    
    Protocol Oriented Programming
    - FeedDisplayable
    - NetworkRequestHandler


## Code Structure

    The code is neatly organized in folders/groups depicting different modules

## Testability

    The ViewModels/Models & Networking modules are unit tested

## 3rd Party Libraries

    SwiftyJSON  :   For converting data in easy to read JSON format
    Kingfisher  :   For efficiently downloading images
    
