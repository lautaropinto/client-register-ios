//
//  FormView.swift
//  client-register-ios
//
//  Created by Lautaro Pinto on 04/08/2021.
//

import UIKit

internal struct FieldModel {
    let placeHolder: String
    var value: String?
    
    init(placeHolder: String, value: String? = nil) {
        self.placeHolder = placeHolder
        self.value = value
    }
}

internal final class FormView: UIView {
    let formTableView = prepareTableView()
    let confirmationButton = prepareConfirmationButton()
    
    let fields: [String: FieldModel] = [
        "name": FieldModel(placeHolder: "Nombre"),
        "lastname": FieldModel(placeHolder: "Apellido"),
        "birthDate": FieldModel(placeHolder: "Fecha de nacimiento"),
    ]
    
    init() {
        super.init(frame: .zero)
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func backgroundPressed(_ sender: UIView) {
        formTableView.visibleCells.forEach({
            guard let cell = $0 as? FormFieldCell else { return }
            cell.input.resignFirstResponder()
        })
    }
}

// MARK:- Programatical Layout
extension FormView: ProgramaticalLayoutable {
    func buildViewHierarchy() {
        addSubview(formTableView)
        addSubview(confirmationButton)
    }
    
    func setUpConstraints() {
        NSLayoutConstraint.activate([
            confirmationButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            confirmationButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -25),
            confirmationButton.heightAnchor.constraint(equalToConstant: 46),
            confirmationButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5),
            
            formTableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            formTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            formTableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            formTableView.bottomAnchor.constraint(equalTo: confirmationButton.topAnchor, constant: 25),
        ])
    }
    
    func setUpAdditionalConfig() {
        formTableView.dataSource = self
        formTableView.delegate = self
        backgroundColor = .white
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(backgroundPressed(_:)))
        self.addGestureRecognizer(tapGesture)
    }
}

// MARK:- TableView
extension FormView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fields.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FormFieldCell.description()) as? FormFieldCell else {
            return UITableViewCell()
        }
        
        cell.placeHolder = fields[indexPath.row].value.placeHolder
        
        return cell
    }
}

private func prepareTableView() -> UITableView {
    let tableView = UITableView()
    tableView.translatesAutoresizingMaskIntoConstraints = false
    tableView.rowHeight = UITableView.automaticDimension
    tableView.estimatedRowHeight = 300
    tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
    tableView.bounces = false
    tableView.showsVerticalScrollIndicator = false
    tableView.backgroundColor = .clear
    tableView.register(FormFieldCell.self, forCellReuseIdentifier: FormFieldCell.description())
    
    return tableView
}

private func prepareConfirmationButton() -> UIButton {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setTitle("Aceptar", for: .normal)
    button.setTitleColor(.black, for: .normal)
    
    return button
}

extension Dictionary {
    subscript(i: Int) -> (key: Key, value: Value) {
        get {
            return self[index(startIndex, offsetBy: i)]
        }
    }
}
