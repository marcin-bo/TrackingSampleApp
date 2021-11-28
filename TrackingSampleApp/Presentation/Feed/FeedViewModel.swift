//
//  FeedViewModel.swift
//  TrackingSampleApp
//
//  Created by Marcin Borek on 27/11/2021.
//

protocol FeedViewModelInterface {
    // Output
    func count() -> Int
    func getWidgetAt(index: Int) -> Widget?
    
    // Actions
    var actions: FeedViewModelActions? { get set }
}

struct FeedViewModelActions {
    let didSelectWidget: ((Widget) -> Void)?
}

struct FeedViewModel {
    var actions: FeedViewModelActions?
    private let widgets: [Widget]
    
    init(feedRepository: FeedRepository) {
        self.widgets = feedRepository.findAll()
    }
}

extension FeedViewModel: FeedViewModelInterface {
    func count() -> Int {
        widgets.count
    }
    
    func getWidgetAt(index: Int) -> Widget? {
        guard index < widgets.count else { return nil }
        return widgets[index]
    }
}
