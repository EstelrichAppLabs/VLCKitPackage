# VLCKit Package
Package used to provide Service Package Manager to the [official mirror repository of VLC for iOS and tvOS application](https://github.com/videolan/vlc-ios).

## Frameworks
- MobileVLCKit
- TVVLCKit

## Steps to update the package when frameworks receive a new version update
- In Terminal, set your path into the Demo project folder.
- Run 'pod install' and or 'pod update' if needed.
- From the 'Sample/Demo/Pod' folder, move the framework files `MobileVLCKit` and `TVVLCKit` into an external folder.
- Create a separate zip of those frameworks.
- Remove the CocoaPod dependencies on the Demo project by running 'pod deintegrate'. 
- Still on the same folder, get the checksum value for both by running:
    ```
        swift package compute-checksum TVVLCKit.xcframework.zip
    ```
    
    ```
        swift package compute-checksum MobileVLCKit.xcframework.zip
    ```
- Update version number and checksum on the package binary target. (eg. `3.6.0` and `5c3169e59f9cce4ba4d6c8b36c51c93c13d6cf0e48d11344efb64bb909e35c6a`)
- Release new version with this same version number and upload the new frameworks in .zip as attachments in the release.

## Check if uploaded zip files match the checksum number
    ```
        curl -L -o TVVLCKit.xcframework.zip https://github.com/EstelrichAppLabs/VLCKitPackage/releases/download/3.6.0/TVVLCKit.xcframework.zip
        swift package compute-checksum TVVLCKit.xcframework.zip
    ```
    
    ```
        curl -L -o MobileVLCKit.xcframework.zip https://github.com/EstelrichAppLabs/VLCKitPackage/releases/download/3.6.0/MobileVLCKit.xcframework.zip
        swift package compute-checksum MobileVLCKit.xcframework.zip
    ```
