//
//  SettingsView.swift
//  ProjectNotesApp
//
//  Created by Apple on 14.3.2024.
//

import UIKit

class SettingsView: UIViewController {
    
    var models: [SettingsModel] = []
    
    let cellId = "SettingCell"
    
    private let settingsTableView = UITableView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        NavBarEdits()
        setupTableView()
        setData()
    }
    
    private func NavBarEdits() {
        let navBar = self.navigationController?.navigationBar.topItem
        navBar?.title = "Настройки"
        
        let rightBarBtn = UIBarButtonItem(image: UIImage(systemName: "gear"), style: .plain, target: self, action: #selector(settingBtnTapped))
        navigationItem.rightBarButtonItem = rightBarBtn
        rightBarBtn.tintColor = .black
        
        let leftBarBtn = UIBarButtonItem(title: "Назад", style: .plain, target: self, action: #selector(BackBtnTapped))
        navigationItem.leftBarButtonItem = leftBarBtn
        leftBarBtn.tintColor = .systemBlue
    }
    
    private func setupTableView(){
        view.addSubview(settingsTableView)
        NSLayoutConstraint.activate([
            settingsTableView.topAnchor.constraint(equalTo:view.safeAreaLayoutGuide.topAnchor),
            settingsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            settingsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            settingsTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
            
        ])
        
        settingsTableView.dataSource = self
        settingsTableView.delegate = self
        settingsTableView.register(SettingTableViewCell.self, forCellReuseIdentifier: cellId)
        settingsTableView.translatesAutoresizingMaskIntoConstraints = false
        
    }
    private func setData(){
        
        models = [SettingsModel(nameLabel: "Язык", imageName: "language", showButton: true, showSwitchControl: false),
                  SettingsModel(nameLabel: "Темная тема", imageName: "moon", showButton: false, showSwitchControl: true),
                  SettingsModel(nameLabel: "Очистить данные", imageName: "trash", showButton: false, showSwitchControl: false)
        ]
        settingsTableView.reloadData()
    }
    
    
    @objc private func settingBtnTapped(){
        
    }
    @objc private func BackBtnTapped(){
        
    }
    
    
}
extension SettingsView: UITableViewDataSource, UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let model = models[indexPath.row]
        let cell = settingsTableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! SettingTableViewCell
        cell.configure(with: model)
        cell.russianBtn.isHidden = !model.showButton
        cell.switchControl.isHidden = !model.showSwitchControl
        cell.delegate = self
        
        
        return cell
    }
}
extension SettingsView:  TableVIewCellDelegate  {
    func switchControlVAlueChanged(to isOn: Bool, in cell: SettingTableViewCell) {
        
        
    }
    
    
}
