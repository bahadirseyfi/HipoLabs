//
//  AddMemberViewController.swift
//  HipoLabs
//
//  Created by bahadir on 29.03.2021.
//

import UIKit


class AddMemberViewController: UIViewController, UITextFieldDelegate, AddNewMemberProtocol {
    
    func addMember()->Member {
        return createMember()
    }
    
    private var interactor: HomeViewInteractor = HomeViewInteractor()

    // Mark: - Properties
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var surnameTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var githubTextField: UITextField!
    @IBOutlet weak var yearsHipo: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        toNextTextfield()
        tapHideKeyboard()
        
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        let stepperValue = Int(sender.value)
        if stepperValue == 0 {
            yearsHipo.text = "Intern"
        } else {
            yearsHipo.text = stepperValue.description
        }
    }
    
    @IBAction func backBtn(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func addMmbrButton(_ sender: UIButton) {
        
        let viewController = HomeViewController.instantiateViewController(with: "HomeViewController")
        viewController.delegate = self
        viewController.modalPresentationStyle = .fullScreen
        self.showDetailViewController(viewController, sender: nil)

    }
    
    func createMember()->Member{
        let createMember = Member()
        
        if let nameLabel = nameTextField.text, let surnameLabel = surnameTextField.text {
            createMember.name = nameLabel + " " + surnameLabel
        }
        if let age = ageTextField.text {
            createMember.age = Int(age)
        }
        if let yearHipo = yearsHipo.text {
            createMember.hipo?.years_in_hipo = Int(yearHipo)
        }
        createMember.location = locationTextField.text
        createMember.github = githubTextField.text
        
        return createMember
    }

    
    // Mark: - Helpers (TextField & Keyboard)
    
    func tapHideKeyboard(){
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(sender:)), name: UIResponder.keyboardWillShowNotification, object: nil);
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(sender:)), name: UIResponder.keyboardWillHideNotification, object: nil);
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    func toNextTextfield() {
        self.nameTextField.delegate = self
        self.surnameTextField.delegate = self
        self.locationTextField.delegate = self
        self.ageTextField.delegate = self
        self.githubTextField.delegate = self
        
        self.nameTextField.tag = 0
        self.surnameTextField.tag = 1
        self.locationTextField.tag = 2
        self.ageTextField.tag = 3
        self.githubTextField.tag = 5
    }
    
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @objc func keyboardWillShow(sender: NSNotification) {
         self.view.frame.origin.y = -170
    }

    @objc func keyboardWillHide(sender: NSNotification) {
         self.view.frame.origin.y = 0
    }
    private func tagBasedTextField(_ textField: UITextField) {
        let nextTextFieldTag = textField.tag + 1

        if let nextTextField = textField.superview?.viewWithTag(nextTextFieldTag) as? UITextField {
            nextTextField.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.tagBasedTextField(textField)
        return true
    }
    
    private func switchBasedNextTextField(_ textField: UITextField) {
            switch textField {
            case self.nameTextField:
                self.nameTextField.becomeFirstResponder()
            case self.surnameTextField:
                self.surnameTextField.becomeFirstResponder()
            case self.locationTextField:
                self.locationTextField.becomeFirstResponder()
            case self.ageTextField:
                self.ageTextField.becomeFirstResponder()
            case self.githubTextField:
                self.githubTextField.becomeFirstResponder()
            default:
                self.githubTextField.resignFirstResponder()
            }
        }

}


    
    
   
    

