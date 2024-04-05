//
//  NewtorkManger.swift
//  ExampleProject
//
//  Created by Ashton Watson on 4/5/24.
//

import Foundation

class NetworkManger{
    
    static let shared = NetworkManger()
    var delagte: NetworkMangerDelagte?
    
    private init(){}
    
    func getData(stringUrl: String){
        
        guard let url = URL.init(string: stringUrl) else {return}
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            self.delagte?.didGetData(data: data!)
        }.resume()
        
    }
    
}

protocol NetworkMangerDelagte{
    func didGetData(data: Data)
}
