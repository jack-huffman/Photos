//
//  PhotoViewController.swift
//  Photos
//
//  Created by Jack Huffman on 3/12/19.
//  Copyright © 2019 Jack Huffman. All rights reserved.
//

import UIKit

class PhotoViewController: UIImagePickerController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var imageView: UIImageView!
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func takePhoto(_ sender: UIBarButtonItem) {
       
        guard PhotoViewController.isSourceTypeAvailable(.camera) else {
            let alert = UIAlertController(title: "Camera not found", message: "The camera could not be found for this device", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        imagePicker.sourceType = .camera
        imagePicker.allowsEditing = true
        imagePicker.delegate = self
        
        self.present(imagePicker, animated: true)
    }
    
    @IBAction func selectPhoto(_ sender: UIBarButtonItem) {
        guard PhotoViewController.isSourceTypeAvailable(.photoLibrary) else {
            let alert = UIAlertController(title: "Photo Library not found", message: "The Photo Library could not be found for this device", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = true
        imagePicker.delegate = self
        
        self.present(imagePicker, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: { () in
            
            // get image
            guard let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage else {
                print("No image found")
                return
            }
            self.imageView.image = image
        })
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        defer {
            picker.dismiss(animated: true)
        }
        print("Cancelled")
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
