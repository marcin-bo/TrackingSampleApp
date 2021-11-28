//
//  ArticleViewModel.swift
//  TrackingSampleApp
//
//  Created by Marcin Borek on 28/11/2021.
//

struct ArticleViewModel {
    private let articlesRepository: ArticlesRepository
    private let article: Article?
    
    init(articlesRepository: ArticlesRepository, machineName: String) {
        self.articlesRepository = articlesRepository
        self.article = articlesRepository.findFirst(machineName: machineName)
    }
    
    var title: String? {
        article?.title
    }
    
    var description: String? {
        article?.content
    }
    
    func count() -> Int {
        article?.widgets.count ?? 0
    }
    
    func getItemAt(index: Int) -> Widget? {
        guard let article = article,
              index < article.widgets.count
        else {
            return nil
        }
        return article.widgets[index]
    }
}
