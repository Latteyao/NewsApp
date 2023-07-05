//
//  URL.swift
//  NewsApp
//
//  Created by MacBook Pro on 2023/7/5.
//

import Foundation


extension URL:Identifiable{
    public var id:String{
        self.absoluteString
    }
}
