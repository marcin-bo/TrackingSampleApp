//
//  FeedViewController.swift
//  TrackingSampleApp
//
//  Created by Marcin Borek on 24/11/2021.
//

import UIKit

final class FeedViewController: UIViewController {
    private var viewModel: FeedViewModelInterface
    
    private let tableView = UITableView(frame: .zero, style: .plain)
    
    init(viewModel: FeedViewModelInterface) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Feed"
    }
    
    override func loadView() {
        super.loadView()
        setupSubviews()
    }

    func updateViewModelActions(_ actions: FeedViewModelActions) {
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

extension FeedViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let widget = viewModel.getWidgetAt(index: indexPath.row) else {
            return
        }
        viewModel.actions?.didSelectWidget?(widget)
    }
}

extension FeedViewController: UITableViewDataSource {
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
        
        if let widget = viewModel.getWidgetAt(index: indexPath.row) {
            cell.update(widget: widget)
        }
        
        return cell
    }
}
