//
//  MainViewController.swift
//  KidsFly
//
//  Created by Alex Shillingford on 9/27/19.
//  Copyright © 2019 Alex Shillingford. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var loginTypeSegmentedControl: UISegmentedControl!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var phoneTextField: UITextField!
    
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var addressTextField: UITextField!
    
    @IBOutlet weak var airportLabel: UILabel!
    @IBOutlet weak var airportTextField: UITextField!
    
    @IBOutlet weak var signUpButton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpSubViews()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginTypeChanged(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            signUpButton.setTitle("Sign Up", for: .normal)
            
            usernameLabel.isHidden = false
            usernameTextField.isHidden = false
            
            passwordLabel.isHidden = false
            passwordTextField.isHidden = false
            
            phoneLabel.isHidden = false
            phoneTextField.isHidden = false
            
            emailLabel.isHidden = false
            emailTextField.isHidden = false
            
            nameLabel.isHidden = false
            nameTextField.isHidden = false
            
            addressLabel.isHidden = false
            addressTextField.isHidden = false
            
            airportLabel.isHidden = false
            airportTextField.isHidden = false
        } else {
            signUpButton.setTitle("Sign In", for: .normal)
            
            usernameLabel.isHidden = false
            usernameTextField.isHidden = false
            
            passwordLabel.isHidden = false
            passwordTextField.isHidden = false
            
            phoneLabel.isHidden = true
            phoneTextField.isHidden = true
            
            emailLabel.isHidden = true
            emailTextField.isHidden = true
            
            nameLabel.isHidden = true
            nameTextField.isHidden = true
            
            addressLabel.isHidden = true
            addressTextField.isHidden = true
            
            airportLabel.isHidden = true
            airportTextField.isHidden = true
        }
        
        
    }
    
    @IBAction func signUpButtonTapped(_ sender: UIButton) {
        if let username = usernameTextField.text,
            !username.isEmpty,
            let password = passwordTextField.text,
            !password.isEmpty,
            let phone = phoneLabel.text,
            !phone.isEmpty,
            let email = emailTextField.text,
            !email.isEmpty,
            let name = nameTextField.text,
            !name.isEmpty,
            let address = addressTextField.text,
            !address.isEmpty,
            let airport = airportTextField.text,
            !airport.isEmpty {
            let traveler = TravelerRepresentation(parentid: nil, username: username, password: password, phone: phone, email: email, name: name, address: address, airport: airport, status: nil, trips: [])
            
            TravelController.shared.signUp(with: traveler)
            TravelController.shared.createTraveler(with: traveler)
            performSegue(withIdentifier: "TravelerSegue", sender: sender)
        } else {
            DispatchQueue.main.async {
                let alertController = UIAlertController(title: "Whoops! Missing some information!", message: "In order to properly sign you up, we need every text field filled with the required information.", preferredStyle: .alert)
                let alertAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
                alertController.addAction(alertAction)
                self.present(alertController, animated: true, completion: nil)
            }
        }
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "TravelerSegue" {
            if let homeVC = segue.destination as? HomeTripsViewController {
                
            }
        }
    }
    
    func setUpSubViews() {
        signUpButton.layer.cornerRadius = 24.0
    }
}
