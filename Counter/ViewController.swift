//
//  ViewController.swift
//  Counter
//
//  Created by Nikolai Eremenko on 09.04.2024.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet
    weak var counterLabel: UILabel!
    
    private var counter: Int = 0
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        clearUI()
    }
    
    private func clearUI() {
        counter = 0
        updateUI()
    }
    
    private func updateUI() {
        counterLabel.text = "Значение счётчика: \(counter)"
    }
    
    // MARK: - IBActions
    @IBAction func clearButtonDidTapped(_ sender: UIButton) {
        clearUI()
        print("Debug: Clear button was tapped")
    }
    
    @IBAction func addButtonDidTapped(_ sender: UIButton) {
        counter += 1
        updateUI()
        print("Debug: Add button was tapped")
    }
    
    @IBAction func subtractButtonDidTapped(_ sender: UIButton) {
        if counter > 0 {
            counter -= 1
        }
        updateUI()
        print("Debug: Subtract button was tapped")
    }
}

