//
//  DetailCarViewController.swift
//  Carros
//
//  Created by Wladmir  on 23/09/20.
//

import UIKit

class DetailCarViewController: UIViewController {

    var car: Car?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let car = car {
            print(car)
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
