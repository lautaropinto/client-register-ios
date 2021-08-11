//
//  FormFieldCell.swift
//  client-register-ios
//
//  Created by Lautaro Pinto on 10/08/2021.
//

import UIKit

class FormFieldCell: UITableViewCell {
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
        contentView.addSubview(input)
    }
    
    func setUpConstraints() {
        NSLayoutConstraint.activate([
            input.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            input.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            input.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            input.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
        ])
    }
    
    func setUpAdditionalConfig() {
        input.addTarget(self, action: #selector(textFieldDidChanged(_:)), for: .editingDidEnd)
    }
}

private func prepareInput() -> UITextField {
    let input = UITextField()
    input.translatesAutoresizingMaskIntoConstraints = false
    input.textAlignment = .center
    
    return input
}
