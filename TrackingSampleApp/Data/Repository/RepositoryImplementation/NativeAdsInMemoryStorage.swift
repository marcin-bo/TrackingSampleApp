//
//  NativeAdsInMemoryStorage.swift
//  TrackingSampleApp
//
//  Created by Marcin Borek on 27/11/2021.
//

import Foundation

struct NativeAdsInMemoryStorage: Repository {
    func findFirst(machineName: String) -> NativeAd? {
        findAll().first(where: { $0.machineName == machineName} )
    }
    
    func findAll() -> [NativeAd] {
        [
            NativeAd(
                machineName: "native-ad-1",
                title: "Native Ad 1",
                subtitle: "Mauris dictum elit et metus vehicula varius.",
                description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris dictum elit et metus vehicula varius. In tempor ultrices felis ac facilisis. Praesent ut feugiat nibh. Mauris orci dolor, blandit at nulla et, lacinia scelerisque est. Etiam at velit eget metus congue hendrerit ac at neque. Sed et enim aliquet, vehicula felis vitae, elementum justo.",
                imageFilename: "native-ad.png",
                url: URL(string: "https://google.com")!,
                widgets: []
            ),
            NativeAd(
                machineName: "native-ad-2",
                title: "Native Ad 2",
                subtitle: "orbi semper, orci ac tempus lobortis",
                description: "Maecenas scelerisque egestas ante, ac imperdiet enim sodales vitae. Morbi semper, orci ac tempus lobortis, augue mi elementum turpis, nec pellentesque libero tellus eget leo. Vestibulum pulvinar, nisi ac sollicitudin porta, velit arcu vulputate ligula, in efficitur nibh quam quis enim.",
                imageFilename: "native-ad.png",
                url: URL(string: "https://google.com")!,
                widgets: []
            ),
            NativeAd(
                machineName: "native-ad-3",
                title: "Native Ad 3",
                subtitle: "Nulla tristique massa at odio posuere convallis. In finibus at lectus eget rhoncus.",
                description: "Duis nec odio eget nulla hendrerit maximus convallis in purus. Vestibulum viverra consectetur cursus. Nulla tristique massa at odio posuere convallis. In finibus at lectus eget rhoncus. Ut accumsan sem a risus mattis porta. Sed tempus, dolor ac efficitur tempor, mi arcu maximus velit, at tincidunt sem libero et diam. Nam at tellus id lorem tempus sodales sit amet ut odio.",
                imageFilename: "native-ad.png",
                url: URL(string: "https://google.com")!,
                widgets: []
            ),
            NativeAd(
                machineName: "native-ad-4",
                title: "Native Ad 4",
                subtitle: "Nam luctus, orci ac lobortis interdum, turpis massa posuere massa, a hendrerit tortor diam et lectus.",
                description: "Ut nunc purus, vehicula a sollicitudin ut, pharetra ut enim. Aliquam condimentum turpis at elit porttitor bibendum. Pellentesque vulputate felis eu purus imperdiet ornare. Nam luctus, orci ac lobortis interdum, turpis massa posuere massa, a hendrerit tortor diam et lectus.",
                imageFilename: "native-ad.png",
                url: URL(string: "https://google.com")!,
                widgets: []
            ),
            NativeAd(
                machineName: "native-ad-5",
                title: "Native Ad 5",
                subtitle: "Nam luctus, orci ac lobortis interdum, turpis massa posuere massa, a hendrerit tortor diam et lectus.",
                description: "Crash ante metus, commodo in pulvinar sit amet, congue ultrices libero. Pellentesque imperdiet, massa et facilisis viverra, sem elit venenatis orci, imperdiet facilisis augue felis id nibh.",
                imageFilename: "native-ad.png",
                url: URL(string: "https://google.com")!,
                widgets: []
            ),
            NativeAd(
                machineName: "native-ad-6",
                title: "Native Ad 6",
                subtitle: "Suspendisse sodales efficitur velit in gravida.",
                description: "Pellentesque id metus at nibh malesuada suscipit sed vitae eros. Suspendisse sodales efficitur velit in gravida. Maecenas et molestie eros, sit amet rutrum metus. Proin pretium suscipit gravida.",
                imageFilename: "native-ad.png",
                url: URL(string: "https://google.com")!,
                widgets: []
            )
        ]
    }
}
