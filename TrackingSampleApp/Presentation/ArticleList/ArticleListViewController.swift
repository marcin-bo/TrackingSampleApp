//
//  ArticleListViewController.swift
//  TrackingSampleApp
//
//  Created by Marcin Borek on 24/11/2021.
//

import UIKit

final class ArticleListViewController: UIViewController {
    private var viewModel: ArticleListViewModelInterface
    
    private let tableView = UITableView(frame: .zero, style: .plain)
    
    init(viewModel: ArticleListViewModelInterface) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Articles"
    }
    
    override func loadView() {
        super.loadView()
        setupSubviews()
    }

    func updateViewModelActions(_ actions: ArticleListViewModelActions) {
        viewModel.actions = actions
    }
    
    private func setupSubviews() {
        setupTableView()
        setupSubviewsHierarchy()
        setupSubviewsConstraints()
    }
    
    private func setupTableView() {
        tableView.register(
            WidgetViewCell.self,
            forCellReuseIdentifier: WidgetViewCell.reuseIdentifier
        )
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func setupSubviewsHierarchy() {
        view.addSubview(tableView)
    }
    
    private func setupSubviewsConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
    }
}

extension ArticleListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let article = viewModel.getArticleAt(index: indexPath.row) else {
            return
        }
        viewModel.actions?.didSelectArticle?(article)
    }
}

extension ArticleListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.count()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: WidgetViewCell = {
            if let cell = tableView.dequeueReusableCell(
                withIdentifier: WidgetViewCell.reuseIdentifier,
                for: indexPath as IndexPath) as? WidgetViewCell {
                return cell
            }
            return WidgetViewCell(
                style: UITableViewCell.CellStyle.subtitle,
                reuseIdentifier: WidgetViewCell.reuseIdentifier
            )
        }()
        
        if let article = viewModel.getArticleAt(index: indexPath.row) {
            cell.update(widget: article)
        }
        
        return cell
    }
}
