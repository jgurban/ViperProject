//
//  Quote.swift
//  VIPER-SimpsonQuotes
//
//  Created by Zafar on 1/2/20.
//  Copyright © 2020 Zafar. All rights reserved.
//

import ObjectMapper

struct Quote: Mappable {
    
//    var quote: String?
      var character: String?
      var image: String?
      var characterDirection: String?
//
//    init?(map: Map) {}
//
//    mutating func mapping(map: Map) {
//        quote              <- map["quote"]
//        character          <- map["character"]
//        image              <- map["image"]
//        characterDirection <- map["characterDirection"]
//    }
    
    
//    "albumId": 1,
//        "id": 1,
//        "title": "accusamus beatae ad facilis cum similique qui sunt",
//        "url": "https://via.placeholder.com/600/92c952",
//        "thumbnailUrl": "https://via.placeholder.com/150/92c952"
    
    var quote: String?
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
             quote            <- map["url"]
            character          <- map["title"]
            image              <- map["url"]
     }
    
}
