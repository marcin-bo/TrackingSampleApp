//
//  ArticleListViewModel.swift
//  TrackingSampleApp
//
//  Created by Marcin Borek on 27/11/2021.
//

struct ArticleListViewModel {
    private let widgets: [Widget]
    
    init(articlesStorage: ArticlesInMemoryStorage) {
        self.widgets = articlesStorage.findAll()
    }
    
    func count() -> Int {
        widgets.count
    }
    
    func getItemAt(index: Int) -> Widget? {
        guard index < widgets.count else { return nil }
        return widgets[index]
    }
}
