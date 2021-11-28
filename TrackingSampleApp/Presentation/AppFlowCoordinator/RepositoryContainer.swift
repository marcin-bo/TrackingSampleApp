//
//  RepositoryContainer.swift
//  TrackingSampleApp
//
//  Created by Marcin Borek on 28/11/2021.
//

struct RepositoryContainer: RepositoryDependencies {
    let articlesRepository: ArticlesRepository
    let feedRepository: FeedRepository
    let nativeAdsRepository: NativeAdsRepository
    let offersRepository: OffersRepository
}
