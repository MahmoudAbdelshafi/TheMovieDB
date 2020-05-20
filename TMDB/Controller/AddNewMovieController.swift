//
//  AddNewMovieController.swift
//  TMDB
//
//  Created by Mahmoud on 5/18/20.
//  Copyright © 2020 Mahmoud. All rights reserved.
//

import UIKit



  //
 //MARK:- Passing New MovieList Protocol ->
//
protocol PassDataToUserListController {
    func passData(_ newMovie: UserList)
}



class AddNewMovieController: UIViewController, UINavigationControllerDelegate {
    
    
     //
    //MARK:- Properties
   //
    var userList:UserList?
    var deleget:PassDataToUserListController!
    let defultImage:UIImage = UIImage(named: "movie_poster")!
    let datePicker = UIDatePicker()
    
      //
     //MARK:- IBOutlets
    //
    @IBOutlet weak var addPhotoButton: UIButton!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var overviewTextField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        creatDatePicker()
        hideKeyboardWhenTappedAround()
        
    }
    
    
    
     //
    //MARK:- IBActions
   //
    @IBAction func addImagePressed(_ sender: Any) {
        addImage()
        
    }
    
    
    @IBAction func donePressed(_ sender: Any) {
        handelAddingNewMovie()
    }
    
}



//MARK:- Private Functions
extension AddNewMovieController{
    
    fileprivate func creatDatePicker(){
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(handelDoneButton))
        toolBar.setItems([doneButton], animated: true)
        dateTextField.inputAccessoryView = toolBar
        dateTextField.inputView = datePicker
        datePicker.datePickerMode = .date
    }
    
    
    @objc fileprivate func handelDoneButton(){
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.dateFormat = "yyyy-MM-dd"
        dateTextField.text = formatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }
    
    fileprivate func handelAddingNewMovie(){
        guard let title = titleTextField.text else { return }
        guard let date = dateTextField.text else { return }
        guard let overview = overviewTextField.text else { return }
        var image = addPhotoButton.imageView?.image
        if image == nil {
            image = defultImage
        }
        if title.isEmpty && date.isEmpty && overview.isEmpty {
            navigationController?.popViewController(animated: true )
            return
        }else{
            userList = UserList(title: title, date: date, overview: overview, poserImage: image)
            deleget.passData(userList!)
            navigationController?.popViewController(animated: true )
        }
    }
}






  //
 //MARK:- UIImagePicker Controller Deleget
//
extension AddNewMovieController:UIImagePickerControllerDelegate{
    fileprivate func addImage(){
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.allowsEditing = true
        imagePickerController.modalPresentationStyle = .fullScreen
        present(imagePickerController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let originalImage = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerOriginalImage")] as? UIImage{
            addPhotoButton.setImage(originalImage.withRenderingMode(.alwaysOriginal), for: .normal)
            
        }
        else if let editedImage = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] as? UIImage{
            addPhotoButton.setImage(editedImage.withRenderingMode(.alwaysOriginal), for: .normal)
            
        }
        dismiss(animated: true, completion: nil)
        addPhotoButton.layer.masksToBounds = true
        addPhotoButton.imageView?.contentMode = .scaleAspectFill
        
    }
    
}
