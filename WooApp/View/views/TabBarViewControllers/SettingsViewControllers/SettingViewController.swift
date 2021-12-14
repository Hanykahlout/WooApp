//
//  SettingViewController.swift
//  WooApp
//
//  Created by Dev. Hany Alkahlout on 22/11/2021.
//

import UIKit

class SettingViewController: UIViewController {
    
    @IBOutlet weak var appLogoImageView: UIImageView!
    @IBOutlet weak var brandImageView: UIImageView!
    @IBOutlet weak var addImageStackView: UIStackView!
    @IBOutlet weak var whatsappMessageLabel: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initlization()

    }
    
    private func initlization(){
        
        addImageStackView.isUserInteractionEnabled = true
        addImageStackView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(addImageAction)))
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        whatsappMessageLabel.text = UserDefaults.standard.string(forKey: "WhatsappMessage") ?? ""
        if let imageData = UserDefaults.standard.data(forKey: "AppLogo") {
            appLogoImageView.image = UIImage(data: imageData)
            brandImageView.image = UIImage(data: imageData)
        }
    }
    
    
    @objc private func addImageAction(){
        setImageBy(source: .photoLibrary)
    }
    
    @IBAction func saveAction(_ sender: Any) {
        if !whatsappMessageLabel.text!.isEmpty{
            UserDefaults.standard.setValue(whatsappMessageLabel.text!, forKey: "WhatsappMessage")
            GeneralActions.shard.showAlert(viewController: self, title: "Successfully Saved", message: "")
        }else{
            GeneralActions.shard.showAlert(viewController: self, title: "Error", message: "Invalid input !!")
        }
    }
    
    
    @IBAction func whatappAction(_ sender: Any) {
        if let appURL = URL(string: "https://api.whatsapp.com/send?phone=5521980083354"){
            if UIApplication.shared.canOpenURL(appURL) {
                UIApplication.shared.open(appURL)
            }
        }
    }
    
}

extension SettingViewController : UIImagePickerControllerDelegate , UINavigationControllerDelegate{
    private func setImageBy(source:UIImagePickerController.SourceType){
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        imagePicker.sourceType = source
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let editingImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            appLogoImageView.image = editingImage
            brandImageView.image = editingImage
        }else if let orginalImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            appLogoImageView.image = orginalImage
            brandImageView.image = orginalImage
        }
        if let imgData = brandImageView.image!.jpegData(compressionQuality: 0.5){
            UserDefaults.standard.setValue(imgData, forKey: "AppLogo")
        }
        dismiss(animated: true, completion: nil)
    }
    
}


