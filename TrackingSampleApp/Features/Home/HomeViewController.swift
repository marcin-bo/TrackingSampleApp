//
//  HomeViewController.swift
//  TrackingSampleApp
//
//  Created by Marcin Borek on 24/11/2021.
//

import UIKit

final class HomeViewController: UITableViewController {
    private let widgets: [Widget] = {
        FeedInMemoryStorage(
            articleStorage: ArticlesInMemoryStorage(),
            nativeAdsStorage: NativeAdsInMemoryStorage(),
            offersStorage: OffersInMemoryStorage())
            .findAll()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        view.backgroundColor = .green
        setupTableView()
    }
    
    private func setupTableView() {
        tableView.register(
            TableViewCell.self,
            forCellReuseIdentifier: ReuseIdentifier.tableCell
        )
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return widgets.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = {
            let cell = tableView.dequeueReusableCell(
                withIdentifier: ReuseIdentifier.tableCell,
                for: indexPath as IndexPath
            ) as? TableViewCell
            if cell != nil {
                return cell!
            }
            return UITableViewCell(
                style: UITableViewCell.CellStyle.subtitle,
                reuseIdentifier: ReuseIdentifier.tableCell
            )
        }()
        
        if indexPath.row < widgets.count {
            let widget = widgets[indexPath.row]
            cell.imageView?.image = UIImage(named: widget.imageFilename)
            cell.textLabel?.text = widget.title
            cell.detailTextLabel?.numberOfLines = 0
            cell.detailTextLabel?.text = widget.subtitle
        }
        
        return cell
    }
}

extension HomeViewController {
    private enum ReuseIdentifier {
        static let tableCell = "tableCell"
    }
}
