# Imgur Search with SwiftUI

The goal is to build an iOS application that fetches images from Imgur API. 

### Install
Just download the project, open the .xcodeproj, build and run. **Important:** my Imgur client_id is in the code, but will probably be deactivated. To generate your own, go to [ImgurAPIDocs](https://apidocs.imgur.com/#intro). Once you get your own client_id, replace the `Key` variable in `ImgurAPI.swift`

### Choices
 - **SwiftUI:** I want to test the capabilities of this new framework. It's not there yet :(
 - **MVVM:** SwiftUI goes easily with MVVM architecture and the other options were time consuming.
 - **Alamofire:** Just for the sake of simplicity, and why not?
 - **SDWebImage:** Manually recreating an asynchronous image loader? Hell no. SDWebImageSwiftUI works good.
 - **Swift Package Manager:** Simple to use and works well with the packages above.

### Requirements:
- iOS 14+
- Xcode 12+
