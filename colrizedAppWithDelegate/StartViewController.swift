//
//  StartViewController.swift
//  colrizedAppWithDelegate
//
//  Created by Alexander Burtsev on 18.09.2021.
//

import UIKit

protocol SettingsViewControllerDelegate {
    func setColor(_ color: UIColor)
}

class StartViewController: UIViewController {

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let settingsVC = segue.destination as! SettingsViewController
        settingsVC.viewColor = view.backgroundColor
        settingsVC.delegate = self
    }
    
}

// MARK: - ColorDelegate
extension StartViewController: SettingsViewControllerDelegate {
    func setColor(_ color: UIColor) {
        view.backgroundColor = color
    }
}
