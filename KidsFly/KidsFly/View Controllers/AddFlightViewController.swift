//
//  AddFlightViewController.swift
//  KidsFly
//
//  Created by Andrew Ruiz on 9/25/19.
//  Copyright © 2019 Alex Shillingford. All rights reserved.
//

import UIKit

class AddFlightViewController: UIViewController {

    @IBOutlet weak var airportNameTextField: UITextField!
    @IBOutlet weak var airlineNameTextField: UITextField!
    @IBOutlet weak var departureTimeTextField: UITextField!
    @IBOutlet weak var numberOfBagsTextField: UITextField!
    @IBOutlet weak var numberOfKidsTextField: UITextField!
    @IBOutlet weak var specialNeedsTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    @IBAction func scheduleButtonPressed(_ sender: Any) {
    }
}
