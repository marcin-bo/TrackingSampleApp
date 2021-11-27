//
//  ArticlesInMemoryStorage.swift
//  TrackingSampleApp
//
//  Created by Marcin Borek on 26/11/2021.
//

struct ArticlesInMemoryStorage: Repository {
    func findFirst(machineName: String) -> Article? {
        findAll().first(where: { $0.machineName == machineName} )
    }
    
    func findAll() -> [Article] {
        [
            Article(
                machineName: "article-1",
                title: "Article 1",
                subtitle: "Mauris dictum elit et metus vehicula varius.",
                content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris dictum elit et metus vehicula varius. In tempor ultrices felis ac facilisis. Praesent ut feugiat nibh. Mauris orci dolor, blandit at nulla et, lacinia scelerisque est. Etiam at velit eget metus congue hendrerit ac at neque. Sed et enim aliquet, vehicula felis vitae, elementum justo.",
                imageFilename: "article.png",
                widgets: []
            ),
            Article(
                machineName: "article-2",
                title: "Article 2",
                subtitle: "Norbi semper, orci ac tempus lobortis",
                content: "Maecenas scelerisque egestas ante, ac imperdiet enim sodales vitae. Morbi semper, orci ac tempus lobortis, augue mi elementum turpis, nec pellentesque libero tellus eget leo. Vestibulum pulvinar, nisi ac sollicitudin porta, velit arcu vulputate ligula, in efficitur nibh quam quis enim.",
                imageFilename: "article.png",
                widgets: []
            ),
            Article(
                machineName: "article-3",
                title: "Article 3",
                subtitle: "Nulla tristique massa at odio posuere convallis. In finibus at lectus eget rhoncus.",
                content: "Duis nec odio eget nulla hendrerit maximus convallis in purus. Vestibulum viverra consectetur cursus. Nulla tristique massa at odio posuere convallis. In finibus at lectus eget rhoncus. Ut accumsan sem a risus mattis porta. Sed tempus, dolor ac efficitur tempor, mi arcu maximus velit, at tincidunt sem libero et diam. Nam at tellus id lorem tempus sodales sit amet ut odio.",
                imageFilename: "article.png",
                widgets: []
            ),
            Article(
                machineName: "article-4",
                title: "Article 4",
                subtitle: "Nam luctus, orci ac lobortis interdum, turpis massa posuere massa, a hendrerit tortor diam et lectus.",
                content: "Ut nunc purus, vehicula a sollicitudin ut, pharetra ut enim. Aliquam condimentum turpis at elit porttitor bibendum. Pellentesque vulputate felis eu purus imperdiet ornare. Nam luctus, orci ac lobortis interdum, turpis massa posuere massa, a hendrerit tortor diam et lectus.",
                imageFilename: "article.png",
                widgets: []
            ),
            Article(
                machineName: "article-5",
                title: "Article 5",
                subtitle: "Nam luctus, orci ac lobortis interdum, turpis massa posuere massa, a hendrerit tortor diam et lectus.",
                content: "Crash ante metus, commodo in pulvinar sit amet, congue ultrices libero. Pellentesque imperdiet, massa et facilisis viverra, sem elit venenatis orci, imperdiet facilisis augue felis id nibh.",
                imageFilename: "article.png",
                widgets: []
            ),
            Article(
                machineName: "article-6",
                title: "Article 6",
                subtitle: "Suspendisse sodales efficitur velit in gravida.",
                content: "Pellentesque id metus at nibh malesuada suscipit sed vitae eros. Suspendisse sodales efficitur velit in gravida. Maecenas et molestie eros, sit amet rutrum metus. Proin pretium suscipit gravida.",
                imageFilename: "article.png",
                widgets: []
            )
        ]
    }
}
