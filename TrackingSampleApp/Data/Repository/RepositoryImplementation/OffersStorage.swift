//
//  OffersStorage.swift
//  TrackingSampleApp
//
//  Created by Marcin Borek on 27/11/2021.
//

struct OffersStorage: OffersRepository {
    func findFirst(machineName: String) -> Offer? {
        findAll().first(where: { $0.machineName == machineName} )
    }
    
    func findAll() -> [Offer] {
        var result = [Offer]()
        
        // Generate offers
        for i in 1...30 {
            result.append(ContentGenerator.makeOffer(id: i))
        }
        
        return result
    }
}
