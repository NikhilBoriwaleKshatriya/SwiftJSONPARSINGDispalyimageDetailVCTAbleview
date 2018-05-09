//
//  JsonModel.swift
//  swiftyjson
//
//  Created by Yogesh Patel on 16/04/18.
//  Copyright © 2018 Yogesh Patel. All rights reserved.
//

import Foundation

struct JsonModel{
    var artistName: String = ""
    var trackCensoredName: String = ""
    var artworkUrl100: String = ""
    var releaseDate :String = ""
    var collectionPrice :String = ""
    var collectionExplicitness :String = ""
    var currency :String = ""
    var country :String = ""
    
    init(){
        
    }
    
    init(json:JSON){
        artistName = json["artistName"].stringValue
        trackCensoredName = json["trackCensoredName"].stringValue
        artworkUrl100 = json["artworkUrl100"].stringValue
        releaseDate = json["releaseDate"].stringValue
        collectionPrice = json["collectionPrice"].stringValue
        collectionExplicitness = json["collectionExplicitness"].stringValue
        currency = json["currency"].stringValue
        country = json["country"].stringValue
    }
}
