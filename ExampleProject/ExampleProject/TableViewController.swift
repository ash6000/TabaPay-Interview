//
//  TableViewController.swift
//  ExampleProject
//
//  Created by Ashton Watson on 4/5/24.
//

import UIKit

class TableViewController: UIViewController,  UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    
    var data: [Building]!
    var uniqueEmployeeNumbers: Set<String> = []
    var dataToPass = [Building]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        for building in data {
            
            if !uniqueEmployeeNumbers.contains(building.number) {
                uniqueEmployeeNumbers.insert(building.number)
                
            }
        }
        
        tableView.reloadData()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        uniqueEmployeeNumbers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let uniqueNumbersArray = Array(uniqueEmployeeNumbers)
        cell.textLabel?.text = uniqueNumbersArray[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var messageString = ""

        if let selectedText = tableView.cellForRow(at: indexPath)?.textLabel?.text {
            print("Selected text: \(selectedText)")
            
            var num = 0
            for _ in data{
                if data[num].number == selectedText{
                    dataToPass.append(data[num])
                    let string = "\(data[num].attendance): \(data[num].dataAndTime), \(data[num].buildingNumber), \(data[num].codeNumber)\n"
                    messageString += string
                }
                num += 1
            }
            showAlert(title: selectedText, message: messageString)

        }
    }
    
    func showAlert(title: String, message: String) {
         let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
         let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
         alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
         
     }
    
    
}
