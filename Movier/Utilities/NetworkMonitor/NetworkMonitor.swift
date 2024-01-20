//
//  NetworkManager.swift
//  Movier
//
//  Created by Min Nageh on 20/01/2024.
//

import Foundation
import Network
class NetworkMonitor:ObservableObject{
    let monitor = NWPathMonitor()
    let networkQueue  =  DispatchQueue(label:"Network")
    @Published var notConnected = false
    
    init(isConnected: Bool = true) {
        monitor.pathUpdateHandler = { path in
            DispatchQueue.main.async{
                self.notConnected = path.status == .unsatisfied
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
