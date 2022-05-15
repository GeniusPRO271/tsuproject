//
//  ViewController.swift
//  tsuproject
//
//  Created by Yousef Abbadi on 15.05.2022.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{


    @IBOutlet weak var ImageViewFilter: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnImagePicker(_ sender: Any) {
        
        let picker = UIImagePickerController()
        picker.allowsEditing = true
        picker.delegate = self
        present(picker, animated: true)
    }
    
    @IBAction func GreyScale(_ sender: Any) {
        ImageViewFilter.image = ImageFilter().applyFilter(.grayscale, to:  ImageViewFilter.image!)
    }
    
    @IBAction func IncreaseContrast(_ sender: Any) {
        ImageViewFilter.image = ImageFilter().applyFilter(.increaseContrast, to:  ImageViewFilter.image!)
    }
    
    @IBAction func RotateRight(_ sender: Any) {
        ImageViewFilter.transform = ImageViewFilter.transform.rotated(by: .pi/2)
    }
    
    @IBAction func RotateLeft(_ sender: Any) {
        ImageViewFilter.transform = ImageViewFilter.transform.rotated(by: -(.pi/2))
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.editedImage] as? UIImage else {return}
        ImageViewFilter.image = image
        dismiss(animated: true)
    }
    
}

