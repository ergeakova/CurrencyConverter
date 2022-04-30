//
//  ViewController.swift
//  CurrencyConverter
//
//  Created by Erge Gevher Akova on 30.04.2022.
//

import UIKit

class ViewController: UIViewController {
 
    @IBOutlet weak var lblTry: UILabel!
    @IBOutlet weak var lblUsd: UILabel!
    @IBOutlet weak var lblJpy: UILabel!
    @IBOutlet weak var lblGbp: UILabel!
    @IBOutlet weak var lblChf: UILabel!
    @IBOutlet weak var lblCad: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func getRates(_ sender: Any) {
        print("get rates")
    }
    
}

