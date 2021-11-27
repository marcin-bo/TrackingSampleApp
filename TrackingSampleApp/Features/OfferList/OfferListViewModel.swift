//
//  OfferListViewModel.swift
//  TrackingSampleApp
//
//  Created by Marcin Borek on 27/11/2021.
//

struct OfferListViewModel {
    private let widgets: [Widget]
    
    init(offersStorage: OffersInMemoryStorage) {
        self.widgets = offersStorage.findAll()
    }
    
    func count() -> Int {
        widgets.count
    }
    
    func getItemAt(index: Int) -> Widget? {
        guard index < widgets.count else { return nil }
        return widgets[index]
    }
}

