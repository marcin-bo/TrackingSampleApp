//
//  ArticlesInMemoryStorage.swift
//  TrackingSampleApp
//
//  Created by Marcin Borek on 26/11/2021.
//

struct ArticlesStorage: Repository {
    func findFirst(machineName: String) -> Article? {
        findAll().first(where: { $0.machineName == machineName} )
    }
    
    func findAll() -> [Article] {
        var result = [Article]()
        
        for i in 1...30 {
            result.append(ContentGenerator.makeArticle(id: i))
        }
        
        return result
    }
}
