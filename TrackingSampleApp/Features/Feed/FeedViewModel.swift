//
//  FeedViewModel.swift
//  TrackingSampleApp
//
//  Created by Marcin Borek on 27/11/2021.
//

struct FeedViewModel {
    private let widgets: [Widget]
    
    init(feedRepository: FeedRepository) {
        self.widgets = feedRepository.findAll()
    }
    
    func count() -> Int {
        widgets.count
    }
    
    func getItemAt(index: Int) -> Widget? {
        guard index < widgets.count else { return nil }
        return widgets[index]
    }
}
