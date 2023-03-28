//
//  marketingStrategyViewController.swift
//  ChatAI
//
//  Created by Jordyn Fulbright on 3/27/23.
//
import UIKit

class marketingStrategyViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Create a UILabel
        let label = UILabel()
        label.text = "Welcome to the Marketing Strategy screen!"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 24)
        label.textAlignment = .center

        // Add the label to the view
        view.addSubview(label)

        // Position the label using Auto Layout
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}
