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
        [
            Offer(
                machineName: "offer-1",
                title: "Offer 1",
                subtitle: "Mauris dictum elit et metus vehicula varius.",
                description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris dictum elit et metus vehicula varius. In tempor ultrices felis ac facilisis. Praesent ut feugiat nibh. Mauris orci dolor, blandit at nulla et, lacinia scelerisque est. Etiam at velit eget metus congue hendrerit ac at neque. Sed et enim aliquet, vehicula felis vitae, elementum justo.",
                imageFilename: "offer.png",
                price: 5
            ),
            Offer(
                machineName: "offer-2",
                title: "Offer 2",
                subtitle: "orbi semper, orci ac tempus lobortis",
                description: "Maecenas scelerisque egestas ante, ac imperdiet enim sodales vitae. Morbi semper, orci ac tempus lobortis, augue mi elementum turpis, nec pellentesque libero tellus eget leo. Vestibulum pulvinar, nisi ac sollicitudin porta, velit arcu vulputate ligula, in efficitur nibh quam quis enim.",
                imageFilename: "offer.png",
                price: 20
            ),
            Offer(
                machineName: "offer-3",
                title: "Offer 3",
                subtitle: "Nulla tristique massa at odio posuere convallis. In finibus at lectus eget rhoncus.",
                description: "Duis nec odio eget nulla hendrerit maximus convallis in purus. Vestibulum viverra consectetur cursus. Nulla tristique massa at odio posuere convallis. In finibus at lectus eget rhoncus. Ut accumsan sem a risus mattis porta. Sed tempus, dolor ac efficitur tempor, mi arcu maximus velit, at tincidunt sem libero et diam. Nam at tellus id lorem tempus sodales sit amet ut odio.",
                imageFilename: "offer.png",
                price: 100
            ),
            Offer(
                machineName: "offer-4",
                title: "Offer 4",
                subtitle: "Nam luctus, orci ac lobortis interdum, turpis massa posuere massa, a hendrerit tortor diam et lectus.",
                description: "Ut nunc purus, vehicula a sollicitudin ut, pharetra ut enim. Aliquam condimentum turpis at elit porttitor bibendum. Pellentesque vulputate felis eu purus imperdiet ornare. Nam luctus, orci ac lobortis interdum, turpis massa posuere massa, a hendrerit tortor diam et lectus.",
                imageFilename: "offer.png",
                price: 8
            ),
            Offer(
                machineName: "offer-5",
                title: "Offer 5",
                subtitle: "Nam luctus, orci ac lobortis interdum, turpis massa posuere massa, a hendrerit tortor diam et lectus.",
                description: "Crash ante metus, commodo in pulvinar sit amet, congue ultrices libero. Pellentesque imperdiet, massa et facilisis viverra, sem elit venenatis orci, imperdiet facilisis augue felis id nibh.",
                imageFilename: "offer.png",
                price: 7
            ),
            Offer(
                machineName: "offer-6",
                title: "Offer 6",
                subtitle: "Suspendisse sodales efficitur velit in gravida.",
                description: "Pellentesque id metus at nibh malesuada suscipit sed vitae eros. Suspendisse sodales efficitur velit in gravida. Maecenas et molestie eros, sit amet rutrum metus. Proin pretium suscipit gravida.",
                imageFilename: "offer.png",
                price: 42
            )
        ]
    }
}
