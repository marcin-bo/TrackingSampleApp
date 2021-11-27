//
//  ContentGenerator.swift
//  TrackingSampleApp
//
//  Created by Marcin Borek on 27/11/2021.
//

import Foundation

/// Helper used to create model entites
struct ContentGenerator {
    
    static func makeArticle(id: Int) -> Article {
        let title = ContentGenerator.articleTitle(id: id)
        let machineName = title.machineName
        let subtitle = ContentGenerator.subtitle(id: id)
        let text = ContentGenerator.text(id: id)
        let widgets: [Widget] = [
            makeNativeAd(id: id),
            makeOffer(id: id),
            makeOffer(id: id+1)
        ]
        
        return Article(
            machineName: machineName,
            title: title,
            subtitle: subtitle,
            content: text,
            imageFilename: "article.png",
            widgets: widgets
        )
    }
    
    static func makeOffer(id: Int) -> Offer {
        let title = ContentGenerator.offerTitle(id: id)
        let machineName = title.machineName
        let subtitle = ContentGenerator.subtitle(id: id)
        let text = ContentGenerator.text(id: id)
        
        return Offer(
            machineName: machineName,
            title: title,
            subtitle: subtitle,
            description: text,
            imageFilename: "offer.png",
            price: Float(id*10 + id*5)
        )
    }
    
    static func makeNativeAd(id: Int) -> NativeAd {
        let title = ContentGenerator.nativeAdTitle(id: id)
        let machineName = title.machineName
        let subtitle = ContentGenerator.subtitle(id: id)
        let text = ContentGenerator.text(id: id)
        let widgets: [Widget] = [
            makeOffer(id: id),
            makeOffer(id: id+1),
            makeOffer(id: id+2)
        ]
        
        return NativeAd(
            machineName: machineName,
            title: title,
            subtitle: subtitle,
            description: text,
            imageFilename: "native-ad.png",
            url: URL(string: "https://google.com")!,
            widgets: widgets
        )
    }
    
    private static func articleTitle(id: Int) -> String {
        "Article \(id)"
    }
    
    private static func offerTitle(id: Int) -> String {
        "Offer \(id)"
    }
    
    private static func nativeAdTitle(id: Int) -> String {
        "Native Ad \(id)"
    }
    
    private static func subtitle(id: Int) -> String {
        if id % 9 == 1 {
            return "Mauris dictum elit et metus vehicula varius."
        } else if id % 9 == 2 {
            return "Norbi semper, orci ac tempus lobortis."
        } else if id % 9 == 3 {
            return "Nulla tristique massa at odio posuere convallis. In finibus at lectus eget rhoncus."
        } else if id % 9 == 4 {
            return "Nam luctus, orci ac lobortis interdum, turpis massa posuere massa, a hendrerit tortor diam et lectus."
        } else if id % 9 == 5 {
            return "Proin pretium suscipit gravida."
        } else if id % 9 == 6 {
            return "Suspendisse sodales efficitur velit in gravida."
        } else if id % 9 == 7 {
            return "Sem elit venenatis orci, imperdiet facilisis augue felis id nibh."
        } else {
            return "Nam luctus, orci ac lobortis interdum."
        }
    }
    
    private static func text(id: Int) -> String {
        if id  % 9 == 1 {
            return "Maecenas scelerisque egestas ante, ac imperdiet enim sodales vitae. Morbi semper, orci ac tempus lobortis, augue mi elementum turpis, nec pellentesque libero tellus eget leo. Vestibulum pulvinar, nisi ac sollicitudin porta, velit arcu vulputate ligula, in efficitur nibh quam quis enim."
        } else if id  % 9 == 2 {
            return "Duis nec odio eget nulla hendrerit maximus convallis in purus. Vestibulum viverra consectetur cursus. Nulla tristique massa at odio posuere convallis. In finibus at lectus eget rhoncus. Ut accumsan sem a risus mattis porta. Sed tempus, dolor ac efficitur tempor, mi arcu maximus velit, at tincidunt sem libero et diam. Nam at tellus id lorem tempus sodales sit amet ut odio."
        } else if id  % 9 == 3 {
            return "Ut nunc purus, vehicula a sollicitudin ut, pharetra ut enim. Aliquam condimentum turpis at elit porttitor bibendum. Pellentesque vulputate felis eu purus imperdiet ornare. Nam luctus, orci ac lobortis interdum, turpis massa posuere massa, a hendrerit tortor diam et lectus."
        } else if id  % 9 == 4 {
            return "Crash ante metus, commodo in pulvinar sit amet, congue ultrices libero. Pellentesque imperdiet, massa et facilisis viverra, sem elit venenatis orci, imperdiet facilisis augue felis id nibh."
        } else if id  % 9 == 5 {
            return "Pellentesque id metus at nibh malesuada suscipit sed vitae eros. Suspendisse sodales efficitur velit in gravida. Maecenas et molestie eros, sit amet rutrum metus. Proin pretium suscipit gravida."
        } else if id  % 9 == 6 {
            return "Suspendisse sodales efficitur, orci ac lobortis interdum, turpis massa posuere massa, a hendrerit tortor diam et lectus. Suspendisse sodales efficitur velit in gravida."
        } else if id  % 9 == 7 {
            return "Nam luctus, orci ac lobortis interdum. Suspendisse sodales efficitur velit in gravida. Sem elit venenatis orci, imperdiet facilisis augue felis id nibh."
        } else {
            return "In finibus at lectus eget rhoncus, in efficitur nibh quam quis enim. Pellentesque vulputate felis eu purus imperdiet ornare"
        }
    }
}

