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
    
    @IBOutlet
    weak var historyTextView: UITextView!
    
    private var counter: Int = 0
    private var history: String = "История изменений:"
    
    private var timeStamp: String {
        let currentDateTime = Date()
        let formatter = DateFormatter()
        formatter.timeStyle = .medium
        formatter.dateStyle = .short
        return formatter.string(from: currentDateTime)
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        historyTextView.text = history
        clearUI()
    }
    
    private func clearUI() {
        counter = 0
        updateUI()
    }
    
    private func updateUI() {
        counterLabel.text = "Значение счётчика: \(counter)"
        historyTextView.text = history
        // Scroll to bottom
        let bottom = NSMakeRange(historyTextView.text.count - 1, 1)
        historyTextView.scrollRangeToVisible(bottom)
    }
    
    // MARK: - IBActions
    @IBAction func clearButtonDidTapped(_ sender: UIButton) {
        history.append(contentsOf: "\n [\(timeStamp)]: значение сброшено")
        clearUI()
    }
    
    @IBAction func addButtonDidTapped(_ sender: UIButton) {
        counter += 1
        history.append(contentsOf: "\n [\(timeStamp)]: значение изменено на +1")
        updateUI()
    }
    
    @IBAction func subtractButtonDidTapped(_ sender: UIButton) {
        if counter > 0 {
            counter -= 1
            history.append(contentsOf: "\n [\(timeStamp)]: значение изменено на -1")
        } else {
            history.append(contentsOf: "\n [\(timeStamp)]: попытка уменьшить значение счётчика ниже 0")
        }
        updateUI()
    }
}

