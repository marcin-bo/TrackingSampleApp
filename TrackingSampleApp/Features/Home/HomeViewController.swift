//
//  HomeViewController.swift
//  TrackingSampleApp
//
//  Created by Marcin Borek on 24/11/2021.
//

import UIKit


struct Widget {
    let title: String
    let shortDescription: String
}

final class HomeViewController: UITableViewController {
    private let widgets: [Widget] = {
        var widgets = [Widget]()
        widgets.append(Widget(title: "Title 1", shortDescription: "Short description 1"))
        widgets.append(Widget(title: "Title 2", shortDescription: "Short description 2"))
        return widgets
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
        
        cell.imageView?.image = UIImage(named: "article.png")
        cell.textLabel?.text = "Text"
        cell.detailTextLabel?.numberOfLines = 0
        cell.detailTextLabel?.text = "Long text Long text Long text Long text Long text Long text Long text Long text Long text Long text Long text Long text"
        return cell
    }
}

extension HomeViewController {
    private enum ReuseIdentifier {
        static let tableCell = "tableCell"
    }
}
