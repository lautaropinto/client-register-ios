//
//  FormFieldCell.swift
//  client-register-ios
//
//  Created by Lautaro Pinto on 10/08/2021.
//

import UIKit

class FormFieldCell: UITableViewCell {
    let containerView = prepareContainerView()
    let input = prepareInput()
    var id: String = ""
    var inputEditEnd: ((_ text: String) -> Void)?
    
    var placeHolder: String = "" {
        didSet {
            input.placeholder = self.placeHolder
        }
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    @objc func textFieldDidChanged(_ textField: UITextField) {
        guard let text = textField.text else { return }
        inputEditEnd?(text)
    }

}

extension FormFieldCell: ProgramaticalLayoutable {
    func buildViewHierarchy() {
        containerView.addSubview(input)
        contentView.addSubview(containerView)
    }
    
    func setUpConstraints() {
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            
            input.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            input.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            input.topAnchor.constraint(equalTo: containerView.topAnchor),
            input.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
        ])
    }
    
    func setUpAdditionalConfig() {
        backgroundColor = .CR.white
        input.addTarget(self, action: #selector(textFieldDidChanged(_:)), for: .editingDidEnd)
    }
}

private func prepareInput() -> CRTextField {
    let input = CRTextField()
    input.translatesAutoresizingMaskIntoConstraints = false
    input.textAlignment = .center
    
    return input
}

fileprivate func prepareContainerView() -> UIView {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.backgroundColor = .CR.white
    
    return view
}
