//
//  ViewController.swift
//  ProjectNotesApp
//
//  Created by Apple on 14.3.2024.
//

import UIKit

class HomeView: UIViewController {

    private lazy var search: UISearchBar = {
        let view = UISearchBar()
        view.placeholder = "Поиск"
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var notesLabel: UILabel = {
        let view = UILabel()
        view.text = "Заметки"
        view.textColor = UIColor(hex: "#262626")
        view.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navBar()
        setupUI()
    }

    private func navBar(){
        let navBarTitle = self.navigationController?.navigationBar.topItem
        navBarTitle?.title = "Главная"
        
        
        let settingRightBtn = UIBarButtonItem(image: UIImage(systemName: "gear"), style: .plain, target: self, action: #selector(settingRightBarBTnTapped))
        navigationItem.rightBarButtonItem = settingRightBtn
        settingRightBtn.tintColor = .black
    }
    
    private func setupUI(){
        view.addSubview(search)
        view.addSubview(notesLabel)
        NSLayoutConstraint.activate([
            search.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            search.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            search.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            search.heightAnchor.constraint(equalToConstant: 50),
            
            notesLabel.topAnchor.constraint(equalTo: search.bottomAnchor, constant: 22),
            notesLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            
        ])
    }
    
    
    @objc private func settingRightBarBTnTapped(){
        
    }
    
}

