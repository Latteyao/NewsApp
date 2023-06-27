//
//  String.swift
//  NewsApp
//
//  Created by MacBook Pro on 2023/6/27.
//

import Foundation


extension String{
    
    var removingAllWhitespace:Self  {
        self.filter{!$0.isWhitespace}
    }   //Use isWhitespace to handle newlines and blanks in content
    
}
