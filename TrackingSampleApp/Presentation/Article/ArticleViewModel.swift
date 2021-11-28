//
//  ArticleViewModel.swift
//  TrackingSampleApp
//
//  Created by Marcin Borek on 28/11/2021.
//

protocol ArticleViewModelInterface {
    // Output
    var title: String? { get }
    var description: String? { get }
    
    func count() -> Int
    func getWidgetAt(index: Int) -> Widget?
    
    // Actions
    var actions: ArticleViewModelActions? { get set }
}

struct ArticleViewModelActions {
    let didSelectWidget: ((Widget) -> Void)?
}

struct ArticleViewModel {
    var actions: ArticleViewModelActions?
    private let articlesRepository: ArticlesRepository
    private let article: Article?
    
    init(articlesRepository: ArticlesRepository, machineName: String) {
        self.articlesRepository = articlesRepository
        self.article = articlesRepository.findFirst(machineName: machineName)
    }
}

extension ArticleViewModel: ArticleViewModelInterface {
    var title: String? {
        article?.title
    }
    
    var description: String? {
        article?.content
    }
    
    func count() -> Int {
        article?.widgets.count ?? 0
    }
    
    func getWidgetAt(index: Int) -> Widget? {
        guard let article = article,
              index < article.widgets.count
        else {
            return nil
        }
        return article.widgets[index]
    }
}
