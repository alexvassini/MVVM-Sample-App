//
//  HomeView.swift
//  mvvm+Rx
//
//  Created by Alexandre  Vassinievski on 22/08/2018.
//  Copyright © 2018 vassini. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

/*
 Code for dependency injection:
    self.register(HomeView.self) { resolver in
        HomeView()
    }
 */


protocol HomeViewDelegate: class {
    func openLogin()
}

class HomeView: UIViewController {
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: HomeViewModel!
    
    weak var delegate: HomeViewDelegate?

    init() {
        super.init(nibName: String(describing: HomeView.self), bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.configureViews()
        self.setupViewModel()
        self.setupBindings()
    }
    
}

extension HomeView {
    
    func setupViewModel() {
        self.viewModel = HomeViewModel()
        self.viewModel.request()
        viewModel.onResponse = { success in
            if success {
                self.tableView.reloadData()
                self.configureViews()
            }
        }
    }
    
    func configureViews() {
        tableView.register(R.nib.postTableViewCell)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.estimatedRowHeight = 400
        tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    func setupBindings() {
        loginButton.rx.tap.bind{
            self.delegate?.openLogin()
        }.disposed(by: rx.disposeBag)
    }
}

extension HomeView: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.facebookFeed?.posts.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.postTableViewCell, for: indexPath) as! PostTableViewCell
        let post = viewModel.facebookFeed?.posts[indexPath.row]
        let attachments = viewModel.facebookAttachments?.data[indexPath.row].attachments
       
        cell.configureCell(post!, attachments  )
        
        return cell
    }
    
}

