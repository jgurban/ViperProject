//
//  QuoteService.swift
//  VIPER-SimpsonQuotes
//
//  Created by Zafar on 1/2/20.
//  Copyright © 2020 Zafar. All rights reserved.
//

import ObjectMapper

class QuoteService {
    
    static let shared = { QuoteService() }()
    
    func getQuotes(count: Int, success: @escaping (Int, [Quote]) -> (), failure: @escaping (Int) -> ()) {
        
      //  let urlString = self.configureApiCall(Endpoints.QUOTES, "count", "\(count)")
        
     //   print(urlString)
        
        let urlString = "http://jsonplaceholder.typicode.com/photos"
        
        APIClient.shared.getArray(urlString: urlString, success: { (code, arrayOfQuotes) in
            success(code, arrayOfQuotes)
            
        }) { (code) in
            failure(code)
        }
    }
    
    func configureApiCall(_ baseURL: String, _ parameter: String, _ value: String) -> String {
        return baseURL + "?" + parameter + "=" + value
    }
}
