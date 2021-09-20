//
//  StartViewController.swift
//  colrizedAppWithDelegate
//
//  Created by Alexander Burtsev on 18.09.2021.
//

import UIKit

class StartViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingsVC = segue.destination as? SettingsViewController else { return }
    }
    
}

