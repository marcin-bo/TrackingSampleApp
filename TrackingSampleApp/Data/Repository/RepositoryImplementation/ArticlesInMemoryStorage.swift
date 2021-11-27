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
        var result = [Article]()
        
        for i in 1...8 {
            let title = TextGenerator.articleTitle(id: i)
            let machineName = title.machineName
            let subtitle = TextGenerator.subtitle(id: i)
            let text = TextGenerator.text(id: i)
            let widgets = [Widget]()
            
            let entity = Article(
                machineName: machineName,
                title: title,
                subtitle: subtitle,
                content: text,
                imageFilename: "article.png",
                widgets: widgets
            )
            result.append(entity)
        }
        
        return result
    }
}
