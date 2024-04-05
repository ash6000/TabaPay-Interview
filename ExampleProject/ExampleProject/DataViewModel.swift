//
//  DataViewModel.swift
//  ExampleProject
//
//  Created by Ashton Watson on 4/5/24.
//

import Foundation

protocol DataViewModelDeleagte{
    
    func finishLoad()
}

class DataViewModel: NetworkMangerDelagte{
    
    
    private var dataString = String()
    private var error: Error?
    private var dataArray = [Building]()
    var deleagte: DataViewModelDeleagte?
    
    func getDtataFromNetworkManger(){
        NetworkManger.shared.delagte = self
        NetworkManger.shared.getData(stringUrl: "https://demos.sandbox.tabapay.net/small.txt")
    }
    

    func grabData() -> String{
        return dataString
    }
    
    func getDataObject() -> [Building]{
        return dataArray
    }
    
    
    
    func didGetData(data: Data) {
        let stringData = String(data: data, encoding: .utf8)
        dataString = stringData ?? "no data"
        let components = dataString.components(separatedBy: "\n")
        var num = 0
        for _ in components{
            let sep = components[num].components(separatedBy: ",")
            if sep[0] != ""{
                dataArray.append(Building(attendance: sep[0], dataAndTime: sep[1], number: sep[2], buildingNumber: sep[3], codeNumber: sep[4]))
                num += 1
            }
        }
        deleagte?.finishLoad()
    }
    
}
