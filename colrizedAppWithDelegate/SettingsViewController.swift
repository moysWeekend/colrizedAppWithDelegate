//
//  SettingsViewController.swift
//  colrizedAppWithDelegate
//
//  Created by Alexander Burtsev on 20.09.2021.
//

import UIKit

class SettingsViewController: UIViewController {
    // MARK: - IBOutlets
    
    @IBOutlet var colorView: UIView!
    
    @IBOutlet var redValueLabel: UILabel!
    @IBOutlet var greenValueLabel: UILabel!
    @IBOutlet var blueValueLabel: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    
    @IBOutlet var redValueTextField: UITextField!
    @IBOutlet var greenValueTexField: UITextField!
    @IBOutlet var blueValueTextField: UITextField!
    
    var viewColor: UIColor!
    var delegate: SettingsViewControllerDelegate!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorView.layer.cornerRadius = 10
        colorView.backgroundColor = viewColor
        
        setSliders()
        
    }
    
    // MARK: - IBActions
    
    @IBAction func rgbSlider(_ sender: UISlider) {
        
        switch sender {
        case redSlider:
            redValueLabel.text = String(format: "%.2f", redSlider.value)
            redValueTextField.text = String(format: "%.2f", redSlider.value)
        case greenSlider:
            greenValueLabel.text = String(format: "%.2f", greenSlider.value)
            greenValueTexField.text = String(format: "%.2f", greenSlider.value)
        case blueSlider:
            blueValueLabel.text = String(format: "%.2f", blueSlider.value)
            blueValueTextField.text = String(format: "%.2f", blueSlider.value)
        default:
            break
        }
        mixingColors()
    }
}

// MARK: - Private Methods
extension SettingsViewController {
    
    private func mixingColors() {
        colorView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value), alpha: 1
        )
    }
    private func setSliders() {
        let ciColor = CIColor(color: viewColor)
        
        redSlider.value = Float(ciColor.red)
        greenSlider.value = Float(ciColor.green)
        blueSlider.value = Float(ciColor.blue)
    }
}


