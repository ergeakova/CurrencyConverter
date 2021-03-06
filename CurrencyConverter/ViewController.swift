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
        let url = URL(string: "http://api.apilayer.com/fixer/latest?apikey=<YOUR API KEY>")
        let session = URLSession.shared
        let task = session.dataTask(with: url!) { (data, response, error) in
            if error != nil{
                let alert = UIAlertController(title: "Error!", message: error?.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
                alert.addAction(okButton)
                self.present(alert, animated: true, completion: nil)
            }else{
                if data != nil{
                    do{
                        let jsonResponse = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! Dictionary<String, Any>
                        DispatchQueue.main.async {
                            
                            if let rates = jsonResponse["rates"] as? [String : Any]{
                                
                                if let cad = rates["CAD"] as? Double {
                                    self.lblCad.text = "CAD: \(cad)"
                                }
                                if let chf = rates["CHF"] as? Double {
                                    self.lblChf.text = "CHF: \(chf)"
                                }
                                if let gbp = rates["GBP"] as? Double {
                                    self.lblGbp.text = "GBP: \(gbp)"
                                }
                                if let jpy = rates["JPY"] as? Double {
                                    self.lblJpy.text = "JPY: \(jpy)"
                                }
                                if let usd = rates["USD"] as? Double {
                                    self.lblUsd.text = "USD: \(usd)"
                                }
                                if let tl = rates["TRY"] as? Double {
                                    self.lblTry.text = "TRY: \(tl)"
                                }
                            }
                        }
                    } catch {
                        print("error!")
                    }
                }
            }
        }
        task.resume()

    }
    
}

