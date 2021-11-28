//
//  OfferViewController.swift
//  TrackingSampleApp
//
//  Created by Marcin Borek on 27/11/2021.
//

import UIKit

final class OfferViewController: UIViewController {
    private var viewModel: OfferViewModelInterface
    
    private let scrollView = UIScrollView()
    private let stackView = UIStackView()
    private let titleLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let purchaseButton = UIButton()
    
    init(viewModel: OfferViewModelInterface) {
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
        viewModel.trackOfferImpression()
    }
    
    override func loadView() {
        super.loadView()
        view.backgroundColor = .white
        setupSubviews()
    }
    
    func updateViewModelActions(_ actions: OfferViewModelActions) {
        viewModel.actions = actions
    }
    
    private func setupSubviews() {
        setupStackView()
        setupTitleLabel()
        setupDescriptionLabel()
        setupPurchaseButton()
        setupSubviewsHierarchy()
        setupSubviewsConstraints()
    }
    
    private func setupSubviewsHierarchy() {
        view.addSubview(scrollView)
        scrollView.addSubview(stackView)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(descriptionLabel)
        stackView.addArrangedSubview(purchaseButton)
    }
    
    private func setupStackView() {
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .center
        stackView.spacing = 15
    }
    
    private func setupTitleLabel() {
        titleLabel.text = viewModel.title
        titleLabel.numberOfLines = 0
        titleLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
    }
    
    private func setupDescriptionLabel() {
        descriptionLabel.text = viewModel.description
        descriptionLabel.numberOfLines = 0
    }
    
    private func setupPurchaseButton() {
        purchaseButton.backgroundColor = .systemGreen
        purchaseButton.setTitle("Purchase", for: .normal)
        purchaseButton.setTitleColor(.white, for: .normal)
        purchaseButton.layer.cornerRadius = 15
        purchaseButton.clipsToBounds = true
        purchaseButton.addTarget(self, action: #selector(purchaseButtonTapped), for: .touchUpInside)
    }
    
    @objc private func purchaseButtonTapped() {
        viewModel.trackOfferConversion()
    }
    
    private func setupSubviewsConstraints() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        purchaseButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            scrollView.leftAnchor.constraint(equalTo: view.leftAnchor),
            scrollView.rightAnchor.constraint(equalTo: view.rightAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 20),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -20),
            stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.widthAnchor.constraint(
                equalTo: stackView.widthAnchor,
                constant: -30
            ),
            descriptionLabel.widthAnchor.constraint(
                equalTo: stackView.widthAnchor,
                constant: -30
            )
        ])
        
        NSLayoutConstraint.activate([
            purchaseButton.widthAnchor.constraint(
                equalTo: stackView.widthAnchor,
                constant: -100
            ),
            purchaseButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}

// MARK: Support for Preview
#if canImport(SwiftUI) && DEBUG
import SwiftUI
struct OfferViewRepresentable: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        let viewModel = OfferViewModel(
            offersRepository: OffersStorage(),
            machineName: "offer-1"
        )
        return OfferViewController(viewModel: viewModel).view
    }
    
    func updateUIView(_ view: UIView, context: Context) {
        
    }
}

@available(iOS 13.0, *)
struct OfferViewController_Preview: PreviewProvider {
    static var previews: some View {
        OfferViewRepresentable()
    }
}
#endif
