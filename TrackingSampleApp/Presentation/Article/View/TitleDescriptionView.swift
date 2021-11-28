//
//  ArticleView.swift
//  TrackingSampleApp
//
//  Created by Marcin Borek on 28/11/2021.
//

import UIKit

// FIXME: There are some constraints error when embeding this view
// To debug them disable `_UIConstraintBasedLayoutLogUnsatisfiable` in the Run Scheme
final class TitleDescriptionView: UIView {
    private let stackView = UIStackView()
    private let titleLabel = UILabel()
    private let descriptionLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update(title: String?, description: String?) {
        titleLabel.text = title
        descriptionLabel.text = description
    }
    
    private func setupSubviews() {
        setupStackView()
        setupTitleLabel()
        setupDescriptionLabel()
        setupSubviewsHierarchy()
        setupSubviewsConstraints()
    }
    
    private func setupSubviewsHierarchy() {
        addSubview(stackView)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(descriptionLabel)
    }
    
    private func setupStackView() {
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .top
        stackView.spacing = 15
    }
    
    private func setupTitleLabel() {
        titleLabel.numberOfLines = 0
        titleLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
    }
    
    private func setupDescriptionLabel() {
        descriptionLabel.numberOfLines = 0
    }
    
    private func setupSubviewsConstraints() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20)
        ])
    }
}
