//
//  CodableExtensions.swift
//  QuitSmoking
//
//  Created by 이경민 on 2022/03/18.
//

import Foundation

extension Bundle{
    func decode<T:Codable>(_ file:String)->T{
        guard let url = self.url(forResource: file, withExtension: nil) else{
            
            fatalError("Failed to locate \(file) in Bundle")
        }
        
        guard let data = try? Data(contentsOf: url) else{
            
            fatalError("Failed to load \(file) from bundle")
        }
        
        let decoder = JSONDecoder()
        
        guard let decodedData = try? decoder.decode(T.self, from: data) else{
            
            fatalError("Failed to decode \(file) in data")
        }
        
        return decodedData
    }
}
