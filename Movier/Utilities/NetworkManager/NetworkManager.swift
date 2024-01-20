//
//  NetworkManager.swift
//  Movier
//
//  Created by Min Nageh on 20/01/2024.
//

import Foundation
import Network
class NetworkManager:ObservableObject{
    let monitor = NWPathMonitor()
    let networkQueue  =  DispatchQueue(label:"Network")
    @Published var isConnected = true
    
    init(isConnected: Bool = true) {
        monitor.pathUpdateHandler = { path in
            DispatchQueue.main.async{
                self.isConnected = path.status == .satisfied
            }
        }
    }
    func startMonitoring(){
        monitor.start(queue: networkQueue)
    }
    func stopMonitoring(){
        monitor.cancel()
    }
}
