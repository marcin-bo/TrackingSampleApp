//
//  ArticleListViewController.swift
//  TrackingSampleApp
//
//  Created by Marcin Borek on 24/11/2021.
//

import UIKit

final class ArticleListViewController: UIViewController {
    private let viewModel: ArticleListViewModel
    private let tableView = UITableView(frame: .zero, style: .plain)
    
    init(viewModel: ArticleListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        setupTableView()
    }

    private func setupTableView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        tableView.register(
            WidgetViewCell.self,
            forCellReuseIdentifier: ReuseIdentifier.tableCell
        )
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Articles"
        setupTableView()
    }
}

extension ArticleListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

extension ArticleListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.count()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: WidgetViewCell = {
            if let cell = tableView.dequeueReusableCell(
                withIdentifier: ReuseIdentifier.tableCell,
                for: indexPath as IndexPath) as? WidgetViewCell {
                return cell
            }
            return WidgetViewCell(
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

extension ArticleListViewController {
    private enum ReuseIdentifier {
        static let tableCell = "tableCell"
    }
}
