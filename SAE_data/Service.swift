//
//  service.swift
//  SAE_data
//
//  Created by Neo Chou on 2020/3/23.
//  Copyright © 2020 Neo Chou. All rights reserved.
//


import UIKit
import Alamofire

public typealias DataResponse = Alamofire.DataResponse

@objc protocol ServiceDelegate {
    @objc optional func requestCoverDataResult ( _result : HeroListDataModel?)
    @objc optional func requestRaidBuffDataResult ( _result : [RaidRelicDataModel]?)
    @objc optional func requestArtifacDataResult ( _result : [ArtifactDataModel]?)
    @objc optional func requesTopOfTimeDataResult ( _result : [HeroData]?)
}

class Service: NSObject {
    
    var delegate: ServiceDelegate?
    
    static let AFManager: Alamofire.SessionManager = {
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = SessionManager.defaultHTTPHeaders
        configuration.timeoutIntervalForRequest = TimeInterval(TIMEOUT_INTERVAL)
        return Alamofire.SessionManager(configuration: configuration)
    }()
    
    
    func requestCoverData() {
        
        let url = API_TITLE + HEROINTRO_DATA_URL
        
        self.request(url:url, method: .get, parameters: nil) { (response) in
            switch response.result {
                case .success:
                    guard let data = response.data else {
                        self.delegate?.requestCoverDataResult?(_result: nil)
                        return
                    }
                    let decoder = JSONDecoder()
                    guard let result = try? decoder.decode(HeroListDataModel.self, from: data) else {
                        self.delegate?.requestCoverDataResult?(_result: nil)
                        return
                    }
                    self.delegate?.requestCoverDataResult?(_result: result)
                case .failure:
                    self.delegate?.requestCoverDataResult?(_result: nil)
                }
           }
      }
    
    
    func requestRaidBuffData() {
      
      let url = API_TITLE + RAIDBUFF_DATA_URL
      
      self.request(url:url, method: .get, parameters: nil) { (response) in
          switch response.result {
              case .success:
                  guard let data = response.data else {
                      self.delegate?.requestRaidBuffDataResult?(_result: nil)
                      return
                  }
                  let decoder = JSONDecoder()
                  guard let result = try? decoder.decode([RaidRelicDataModel].self, from: data) else {
                      self.delegate?.requestRaidBuffDataResult?(_result: nil)
                      return
                  }
                  self.delegate?.requestRaidBuffDataResult?(_result: result)
              case .failure:
                  self.delegate?.requestRaidBuffDataResult?(_result: nil)
              }
         }
    }
    
    func requesArtifacData() {
         
         let url = API_TITLE + ARTIFACT_DATA_URL
         
         self.request(url:url, method: .get, parameters: nil) { (response) in
             switch response.result {
                 case .success:
                     guard let data = response.data else {
                         self.delegate?.requestArtifacDataResult?(_result: nil)
                         return
                     }
                     let decoder = JSONDecoder()
                     guard let result = try? decoder.decode([ArtifactDataModel].self, from: data) else {
                         self.delegate?.requestArtifacDataResult?(_result: nil)
                         return
                     }
                     self.delegate?.requestArtifacDataResult?(_result: result)
                 case .failure:
                     self.delegate?.requestArtifacDataResult?(_result: nil)
                 }
            }
       }
    
    
    func requesTopOfTimeData() {
      
      let url = API_TITLE + TOPOFTIMEARENA_DATA_URL
      
      self.request(url:url, method: .get, parameters: nil) { (response) in
          switch response.result {
              case .success:
                  guard let data = response.data else {
                      self.delegate?.requesTopOfTimeDataResult?(_result: nil)
                      return
                  }
                  let decoder = JSONDecoder()
                  guard let result = try? decoder.decode([HeroData].self, from: data) else {
                      self.delegate?.requesTopOfTimeDataResult?(_result: nil)
                      return
                  }
                  self.delegate?.requesTopOfTimeDataResult?(_result: result)
              case .failure:
                  self.delegate?.requesTopOfTimeDataResult?(_result: nil)
              }
         }
    }
    
    
    
    func request(url: String, method: HTTPMethod, parameters: Parameters?, _ callback:@escaping (DataResponse<Any>) -> Void) {
           Service.AFManager.request(url, method: method, parameters: parameters, encoding: method == HTTPMethod.post ? JSONEncoding.default : URLEncoding.default, headers: nil).validate().responseJSON { (response) in
               callback(response)
           }
       }
    
}
