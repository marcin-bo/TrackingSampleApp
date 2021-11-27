//
//  TableViewCell.swift
//  TrackingSampleApp
//
//  Created by Marcin Borek on 25/11/2021.
//

import UIKit

final class TableViewCell: UITableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func update(widget: Widget) {
        imageView?.image = UIImage(named: widget.imageFilename)
        textLabel?.text = widget.title
        detailTextLabel?.numberOfLines = 0
        detailTextLabel?.text = widget.subtitle
    }
}
