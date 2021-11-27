//
//  OffersInMemoryStorage.swift
//  TrackingSampleApp
//
//  Created by Marcin Borek on 27/11/2021.
//

struct OffersInMemoryStorage: Repository {
    func findFirst(machineName: String) -> Offer? {
        findAll().first(where: { $0.machineName == machineName} )
    }
    
    func findAll() -> [Offer] {
        var result = [Offer]()
        
        for i in 1...8 {
            let title = TextGenerator.offerTitle(id: i)
            let machineName = title.machineName
            let subtitle = TextGenerator.subtitle(id: i)
            let text = TextGenerator.text(id: i)
            let widgets = [Widget]()
            
            let entity = Offer(
                machineName: machineName,
                title: title,
                subtitle: subtitle,
                description: text,
                imageFilename: "offer.png",
                price: Float(i*10 + i*5)
            )
            result.append(entity)
        }
        
        return result
    }
}
