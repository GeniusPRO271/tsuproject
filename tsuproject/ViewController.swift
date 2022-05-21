//
//  ViewController.swift
//  tsuproject
//
//  Created by Yousef Abbadi on 15.05.2022.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate{


    @IBOutlet weak var ImageViewFilter: UIImageView!
    @IBOutlet weak var HightInput: UITextField!
    @IBOutlet weak var WidthInput: UITextField!
    var originalimage : UIImage = UIImage()
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    @IBAction func ApplySize(_ sender: Any) {
        let width = Int(WidthInput.text!)
        let hight = Int(HightInput.text!)
        ImageViewFilter.image = ImageViewFilter.image?.resizeImage(targetSize: CGSize(width: width!, height: hight!))
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        HightInput.resignFirstResponder()
        WidthInput.resignFirstResponder()
    }
    
    @IBAction func btnImagePicker(_ sender: Any) {
        
        let picker = UIImagePickerController()
        picker.allowsEditing = true
        picker.delegate = self
        present(picker, animated: true)
    }
    @IBAction func Brighnes(_ sender: Any) {
        ImageViewFilter.image = ImageFilter().applyFilter(.negative, to:  ImageViewFilter.image!)
    }
    
    @IBAction func GreyScale(_ sender: Any) {
        ImageViewFilter.image = ImageFilter().applyFilter(.grayscale, to:  ImageViewFilter.image!)
    }
    
    @IBAction func IncreaseContrast(_ sender: Any) {
        ImageViewFilter.image = ImageFilter().applyFilter(.increaseContrast, to:  ImageViewFilter.image!)
    }
    
    @IBAction func RotateRight(_ sender: Any) {
        ImageViewFilter.image = ImageViewFilter.image!.rotate(radians: (.pi/2))
    }
    
    @IBAction func RotateLeft(_ sender: Any) {
        ImageViewFilter.image = ImageViewFilter.image!.rotate(radians: -(.pi/2))
    }
    
    @IBAction func OriginalImage(_ sender: Any) {
        ImageViewFilter.image = originalimage
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.editedImage] as? UIImage else {return}
        ImageViewFilter.image = image
        originalimage = image
        dismiss(animated: true)
    }
    
}
extension ViewController : UITextViewDelegate{
    func textFildreturn(_ textfield:UITextField) -> Bool{
        textfield.resignFirstResponder()
        return true
        
    }
}

