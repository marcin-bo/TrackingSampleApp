//
//  ArticleListViewModel.swift
//  TrackingSampleApp
//
//  Created by Marcin Borek on 27/11/2021.
//

protocol ArticleListViewModelInterface {
    // Output
    func count() -> Int
    func getArticleAt(index: Int) -> Article?
    
    // Actions
    var actions: ArticleListViewModelActions? { get set }
}

struct ArticleListViewModelActions {
    let didSelectArticle: ((Article) -> Void)?
}

struct ArticleListViewModel {
    private let articles: [Article]
    var actions: ArticleListViewModelActions?
    
    init(articlesRepository: ArticlesRepository) {
        self.articles = articlesRepository.findAll()
    }
}

extension ArticleListViewModel: ArticleListViewModelInterface {
    func count() -> Int {
        articles.count
    }
    
    func getArticleAt(index: Int) -> Article? {
        guard index < articles.count else { return nil }
        return articles[index]
    }
}
