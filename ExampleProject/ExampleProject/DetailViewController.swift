//
//  DetailViewController.swift
//  ExampleProject
//
//  Created by Ashton Watson on 4/5/24.
//

import UIKit

class DetailViewController: UIViewController {
    var data: [Building]!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        for i in data{
            print(i.number)
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
