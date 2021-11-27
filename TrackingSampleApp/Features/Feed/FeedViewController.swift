//
//  FeedViewController.swift
//  TrackingSampleApp
//
//  Created by Marcin Borek on 24/11/2021.
//

import UIKit

final class FeedViewController: UITableViewController {
    private let viewModel: FeedViewModel
    
    init(viewModel: FeedViewModel) {
        self.viewModel = viewModel
        super.init(style: .plain)
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Feed"
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
        return viewModel.count()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: TableViewCell = {
            let cell = tableView.dequeueReusableCell(
                withIdentifier: ReuseIdentifier.tableCell,
                for: indexPath as IndexPath
            ) as? TableViewCell
            if cell != nil {
                return cell!
            }
            return TableViewCell(
                style: UITableViewCell.CellStyle.subtitle,
                reuseIdentifier: ReuseIdentifier.tableCell
            )
        }()
        
        if let widget = viewModel.getItemAt(index: indexPath.row) {
            cell.update(widget: widget)
        }
        
        return cell
    }
}

extension FeedViewController {
    private enum ReuseIdentifier {
        static let tableCell = "tableCell"
    }
}
