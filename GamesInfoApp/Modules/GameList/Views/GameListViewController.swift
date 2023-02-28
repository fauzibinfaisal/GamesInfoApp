//
//  GameListViewController.swift
//  GamesInfoApp
//
//  Created by Gop-c2s2-f on 15/02/23.
//

import UIKit

protocol GameListViewControllerInterface {
    func setupTableView()
    func reloadTableView()
}

class GameListViewController: UIViewController {
    var presenter: GameListPresenterInterface!
    var currentPage = 1
    let countPerPage = 20
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupNavigation()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        presenter?.viewDidAppear()
    }
    
    // MARK: - Navigation
    private func setupNavigation(){
        // Set the navigation bar appearance
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.backgroundColor = UIColor(named: "PrimaryColor")
        navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
        // Set the view background color
        view.backgroundColor = .white
    }
    
}

extension GameListViewController: GameListViewControllerInterface {
    // MARK: - Table View
    func setupTableView() {
        DispatchQueue.main.async {
            self.tableView.delegate = self
            self.tableView.dataSource = self
            self.tableView.contentInset.bottom = 20
            let cell = UINib(nibName: "GameTableViewCell", bundle: nil)
            self.tableView.register(cell, forCellReuseIdentifier: "GameTableViewCell")
        }
        
    }
    
    func reloadTableView() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
}

extension GameListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.getNumberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GameTableViewCell", for: indexPath) as! GameTableViewCell
        
        let game = presenter.getGameItem(at: indexPath.row)
        cell.selectionStyle = .none
        cell.configureCell(model: game.tranform())
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let game = presenter.getGameItem(at: indexPath.row)
        presenter.rowTapped(gameId: game.id)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        let height = scrollView.frame.size.height
        
        if offsetY > contentHeight - height {
            currentPage += 1
            presenter.getNextGameList(page: currentPage, count: countPerPage)
        }
    }
}
