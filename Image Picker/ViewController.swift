//
//  ViewController.swift
//  Image Picker
//
//  Created by ajm on 4/20/19.
//  Copyright © 2019 Wabbits. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imageview: UIImageView!

    @IBAction func testButtonPressed(_ sender: UIButton) {
        let picker = PickerController()
        picker.applyFilter = true // to apply filter after selecting the picture by default false
        picker.selectImage(self){ image in
            DispatchQueue.main.async {
                self.imageview.image = image
            }
        }
    }
}

