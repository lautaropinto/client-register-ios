//
//  ClientCell.swift
//  client-register-ios
//
//  Created by Lautaro Pinto on 11/08/2021.
//

import UIKit

internal final class ClientCell: UITableViewCell {
    let label = prepareLabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        selectionStyle = .none
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

extension ClientCell: ProgramaticalLayoutable {
    func buildViewHierarchy() {
        contentView.addSubview(label)
    }
    
    func setUpConstraints() {
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            label.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    func setUpAdditionalConfig() {
        
    }
}

private func prepareLabel() -> UILabel {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.textColor = .black
    label.numberOfLines = 0
    
    return label
}
