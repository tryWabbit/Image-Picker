# Image-Picker

Image Picker is a custom picker create by combining Sharaku library to retrieve an image either by Photo Library or Camera and apply beautiful filters.

---
![Swift](https://img.shields.io/badge/Swift-v4.2-orange.svg) ![Xcode](https://img.shields.io/badge/XCode-10.0-blue.svg)

![Screen Shot 2019-04-20 at 5 27 04 PM](https://user-images.githubusercontent.com/20557360/56456997-e3840a80-6391-11e9-940a-4888e112dc97.png)

## How to use?
### Step-1 - Add these keys into your Info.plist

    <key>NSCameraUsageDescription</key>
    <string>This app requires access to the camera.</string>
    <key>NSPhotoLibraryUsageDescription</key>
    <string>This app requires access to the photo library.</string>

### Step-2 - Copy the resources of Picker Controller folder in your project
### Step-3 - Initialise PickerController and enjoy
    let picker = PickerController()
    picker.applyFilter = true // to apply filter after selecting the picture by default false
    picker.selectImage(self){ image in
        DispatchQueue.main.async {
            self.imageview.image = image
        }
    }
        

---
### Sharaku Author 
#### [makomori](https://github.com/makomori/Sharaku), makomori26@gmail.com, Twitter: @makomori26
## MIT License

Copyright (c) 2019 Wabbit

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:


The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

The Software Is Provided "As Is", Without Warranty Of Any Kind, Express Or
Implied, Including But Not Limited To The Warranties Of Merchantability,
Fitness For A Particular Purpose And Noninfringement. In No Event Shall The
Authors Or Copyright Holders Be Liable For Any Claim, Damages Or Other
Liability, Whether In An Action Of Contract, Tort Or Otherwise, Arising From,
Out Of Or In Connection With The Software Or The Use Or Other Dealings In The Software.

