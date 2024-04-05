//
//  ViewController.swift
//  ExampleProject
//
//  Created by Ashton Watson on 4/5/24.
//

import UIKit

class ViewController: UIViewController, DataViewModelDeleagte {
    
    @IBOutlet var enterButton: UIButton!
    
    let dataView = DataViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataView.deleagte = self
        dataView.getDtataFromNetworkManger()
        enterButton.isEnabled = false
        
    }
    
    
    func finishLoad() {
        print("Did Finish loading")
        DispatchQueue.main.async {
            self.enterButton.isEnabled = true
        }
        
    }
    
    
    @IBAction func buttonPushed(_ sender: Any) {
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SegueToTableView"
        {
            let vc = segue.destination as? TableViewController
            vc!.data = dataView.getDataObject()
            
        }
    }
    
}

