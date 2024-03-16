//
//  TableViewCell.swift
//  ProjectNotesApp
//
//  Created by Apple on 14.3.2024.
//

import UIKit

protocol TableVIewCellDelegate {
    func switchControlVAlueChanged(to isOn: Bool,  in cell: SettingTableViewCell)
}

class SettingTableViewCell: UITableViewCell {
    
    var delegate: TableVIewCellDelegate?
    
    
    private lazy var cellView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var label: UILabel = {
        let view = UILabel()
        view.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textColor = .black
        return view
        
    }()
    
    private lazy var image: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
        
    }()
    
     lazy var russianBtn: UIButton = {
        let view = UIButton(type: .system)
        view.setTitle("Русский", for: .normal)
        view.setTitleColor(UIColor(hex: "#0E0E0ECC"), for: .normal)
        view.setImage(UIImage(systemName: "chevron.right"), for: .normal)
        view.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        view.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -150)
        view.translatesAutoresizingMaskIntoConstraints = false
    
        return view
    }()
    
    lazy var switchControl: UISwitch = {
        let view = UISwitch()
        view.addTarget(self, action: #selector(changeBackraundSWitch), for: .editingChanged)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
        
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        
    }
    
    private func setupUI(){
        contentView.addSubview(cellView)
        contentView.addSubview(label)
        contentView.addSubview(image)
        contentView.addSubview(russianBtn)
        contentView.addSubview(switchControl)
        
        NSLayoutConstraint.activate([
            cellView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            cellView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 7),
            cellView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -7),
            cellView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            cellView.heightAnchor.constraint(equalToConstant: 30),
            
            image.topAnchor.constraint(equalTo: cellView.topAnchor, constant: 3),
            image.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 5),
            image.heightAnchor.constraint(equalToConstant: 25),
            image.widthAnchor.constraint(equalToConstant: 25),
            
            label.topAnchor.constraint(equalTo: cellView.topAnchor, constant: 7),
            label.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 7),
            
            russianBtn.topAnchor.constraint(equalTo: cellView.topAnchor, constant: 7),
            russianBtn.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -37),
            
            switchControl.topAnchor.constraint(equalTo: cellView.topAnchor, constant: 0),
            switchControl.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -37),
            
        ])
    }
    
    @objc private func changeBackraundSWitch(_ sender: UISwitch) {
        delegate?.switchControlVAlueChanged(to: sender.isOn, in: self)
    }

    
func configure(with setting: SettingsModel){
    image.image = UIImage(named: setting.imageName)
    label.text = setting.nameLabel
 
}

required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
}
}
