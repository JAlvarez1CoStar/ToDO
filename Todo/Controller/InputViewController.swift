//
//  InputViewController.swift
//  Todo
//
//  Created by Jose Alvarez on 7/28/17.
//  Copyright © 2017 CoStar. All rights reserved.
//

import UIKit
import CoreLocation

class InputViewController: UIViewController {
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!

    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    
    let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        return dateFormatter
    }()
    
    lazy var geocoder = CLGeocoder()
    var itemManager: ItemManager?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    func save() {
        guard let titleString = titleTextField.text,
            titleString.characters.count > 0 else { return }
        let date: Date?
        if let dateText = self.dateTextField.text,
            dateText.characters.count > 0 {
            date = dateFormatter.date(from: dateText)
        } else {
            date = nil
        }
        let descriptionString = descriptionTextField.text
        if let locationName = locationTextField.text,
            locationName.characters.count > 0 {
            if let address = addressTextField.text,
                address.characters.count > 0 {
                geocoder.geocodeAddressString(address) {
                    [unowned self] (placeMarks, error) -> Void in
                    
                    
                    let placeMark = placeMarks?.first
                    
                    
                    let item = ToDoItem(
                        title: titleString,
                        itemDescription: descriptionString,
                        timestamp: date?.timeIntervalSince1970,
                        location: Location(
                            name: locationName,
                            coordinate: placeMark?.location?.coordinate))
                    
                    
                    self.itemManager?.add(item) 
                } 
            } 
        }    
    }
}
