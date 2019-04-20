//
//  PickerController.swift
//  Image Picker
//
//  Created by ajm on 4/20/19.
//  Copyright © 2019 Wabbits. All rights reserved.
//

import UIKit
class PickerController: NSObject {
    
    var picker = UIImagePickerController();
    var alert = UIAlertController(title: "Select any option", message: nil, preferredStyle: .actionSheet)
    var viewController: UIViewController?
    var pickImageCallback : ((UIImage) -> ())?;
    var applyFilter : Bool = false

    func selectImage(_ viewController: UIViewController, _ callback: @escaping ((UIImage) -> ())) {
        pickImageCallback = callback;
        self.viewController = viewController;
        
        let cameraAction = UIAlertAction(title: "Camera", style: .default){
            UIAlertAction in
            self.openCamera()
        }
        let gallaryAction = UIAlertAction(title: "Gallary", style: .default){
            UIAlertAction in
            self.openGallery()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel){
            UIAlertAction in
        }

        picker.delegate = self
        alert.addAction(cameraAction)
        alert.addAction(gallaryAction)
        alert.addAction(cancelAction)
        alert.popoverPresentationController?.sourceView = self.viewController!.view
        viewController.present(alert, animated: true, completion: nil)
    }
    func openCamera(){
        alert.dismiss(animated: true, completion: nil)
        if(UIImagePickerController .isSourceTypeAvailable(.camera)){
            picker.sourceType = .camera
            self.viewController!.present(picker, animated: true, completion: nil)
        }
    }
    func openGallery(){
        picker.sourceType = .photoLibrary
        picker.allowsEditing = false
        self.viewController!.present(picker, animated: true, completion: nil)
    }
}
extension PickerController: SHViewControllerDelegate {
    func shViewControllerImageDidFilter(image: UIImage) {
        pickImageCallback?(image)
    }
    
    func shViewControllerDidCancel() {
    }
}
extension PickerController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        guard let image = info[.originalImage] as? UIImage else { return }
        if applyFilter {
            DispatchQueue.main.async {
                let image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
                let vc = SHViewController(image: image)
                vc.delegate = self
                self.viewController!.present(vc, animated: true, completion: nil)
            }
        }else {
            pickImageCallback?(image)
        }
    }
}
