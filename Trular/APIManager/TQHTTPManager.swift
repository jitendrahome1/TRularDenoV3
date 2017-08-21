//
//  TQHTTPManager.swift
//  Trular
//
//  Created by Shivapurapu Mahendra on 25/07/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit
import Alamofire
import Reqres

func +=< K, V > (left: inout [K: V], right: [K: V]) {
    for (k, v) in right {
        left[k] = v
    }
}
class TQHTTPManager: SessionManager {

    static let sharedManager: TQHTTPManager = {
        var manager: TQHTTPManager?
        #if DEBUG
            let configuration = Reqres.defaultSessionConfiguration()
            configuration.httpAdditionalHeaders = SessionManager.defaultHTTPHeaders
            manager = TQHTTPManager(configuration: configuration)
        #else
            manager = TQHTTPManager()
        #endif
        
        return manager!
    }()
    
    internal var currentTask: Alamofire.Request?
    fileprivate var baseURL = applicationBaseURL
    //	private var baseURL_UAT = "http://cplmed-dev.cloudapp.net/"
    //	var tempProdBase = applicationBaseURL
    fileprivate static let apiKey = ""
    fileprivate let parameterEncoding: ParameterEncoding = JSONEncoding.default
    internal var header: [String: String] = ["Content-Type": "application/json"]
    var requestsWithLoader = [String]()
    
    // MARK: Reachability Check
    let network = NetworkReachabilityManager()
    func isReachable() -> (Bool) {
        if network?.isReachable ?? false {
            if ((network?.isReachableOnEthernetOrWiFi) != nil) {
                return true
            } else if (network?.isReachableOnWWAN)! {
                return true
            }
        }
        else {
            return false
        }
        return false
    }

}
