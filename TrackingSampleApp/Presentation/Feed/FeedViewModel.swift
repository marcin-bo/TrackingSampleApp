//
//  FeedViewModel.swift
//  TrackingSampleApp
//
//  Created by Marcin Borek on 27/11/2021.
//

protocol FeedViewModelInterface {
    // Output
    func count() -> Int
    func getItemAt(index: Int)
    
    // Actions
    //var didSelectItem: (Widget) -> Void { get }
}

struct FeedViewModel/*: FeedViewModelInterface*/ {
    private let widgets: [Widget]
    
    init(feedRepository: FeedRepository/*, didSelectItem: (Widget) -> Void*/) {
        self.widgets = feedRepository.findAll()
        //self.didSelectItem = didSelectItem
    }
    
    func count() -> Int {
        widgets.count
    }
    
    func getItemAt(index: Int) -> Widget? {
        guard index < widgets.count else { return nil }
        return widgets[index]
    }
}
