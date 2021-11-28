//
//  ArticleViewController.swift
//  TrackingSampleApp
//
//  Created by Marcin Borek on 28/11/2021.
//

import UIKit

final class ArticleViewController: UIViewController {
    private var viewModel: ArticleViewModelInterface
    
    private let titleDescriptionView = TitleDescriptionView()
    private let tableView = UITableView(frame: .zero, style: .plain)
    
    init(viewModel: ArticleViewModelInterface) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = viewModel.title
        viewModel.trackArticleImpression()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        sizeHeaderToFit()
    }
    
    func updateViewModelActions(_ actions: ArticleViewModelActions) {
        viewModel.actions = actions
    }
    
    private func sizeHeaderToFit() {
        if let header = tableView.tableHeaderView {
            let newSize = header.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
            header.frame.size.height = newSize.height + 150 // FIXME: label height is calculated incorrectly
        }
    }
    
    override func loadView() {
        super.loadView()
        setupSubviews()
    }
    
    private func setupSubviews() {
        setupTableView()
        setupSubviewsHierarchy()
        setupSubviewsConstraints()
    }
    
    private func setupTableView() {
        titleDescriptionView.update(title: viewModel.title, description: viewModel.description)
        tableView.tableHeaderView = titleDescriptionView
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

extension ArticleViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let widget = viewModel.getWidgetAt(index: indexPath.row) else {
            return
        }
        viewModel.actions?.didSelectWidget?(widget)
    }
}

extension ArticleViewController: UITableViewDataSource {
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

// MARK: Support for Preview
#if canImport(SwiftUI) && DEBUG
import SwiftUI
struct ArticleViewRepresentable: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        let viewModel = ArticleViewModel(
            articlesRepository: ArticlesStorage(),
            machineName: "article-1"
        )
        return ArticleViewController(viewModel: viewModel).view
    }
    
    func updateUIView(_ view: UIView, context: Context) {
        
    }
}

@available(iOS 13.0, *)
struct ArticleViewController_Preview: PreviewProvider {
    static var previews: some View {
        ArticleViewRepresentable()
    }
}
#endif
