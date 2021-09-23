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
        setValue(for: redValueLabel, greenValueLabel, blueValueLabel)
        setValue(for: redValueTextField, greenValueTexField, blueValueTextField)
        
        
    }
    
    // MARK: - IBActions
    
    @IBAction func rgbSlider(_ sender: UISlider) {
        
        switch sender {
        case redSlider:
            setValue(for: redValueLabel)
            setValue(for: redValueTextField)
        case greenSlider:
            setValue(for: greenValueLabel)
            setValue(for: greenValueTexField)
        default:
            setValue(for: blueValueLabel)
            setValue(for: blueValueTextField)
        }
        mixingColors()
    }
    @IBAction func doneButtonPressed(_ sender: Any) {
        delegate.setColor(colorView.backgroundColor ?? .white)
        dismiss(animated: true)
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
        
        private func setValue(for labels: UILabel...) {
            labels.forEach { label in
                switch label {
                case redValueLabel: label.text = string(from: redSlider)
                case greenValueLabel: label.text = string(from: greenSlider)
                default: label.text = string(from: blueSlider)
                }
            }
        }
        
        private func setValue(for textFields: UITextField...) {
            textFields.forEach { textField in
                switch textField {
                case redValueTextField: textField.text = string(from: redSlider)
                case greenValueTexField: textField.text = string(from: greenSlider)
                default: textField.text = string(from: blueSlider)
                }
            }
        }
        
        private func string(from slider: UISlider) -> String {
            String(format: "%.2f", slider.value)
        }
    }

