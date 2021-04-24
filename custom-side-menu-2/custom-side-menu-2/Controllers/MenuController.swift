//
//  MenuController.swift
//  custom-side-menu-2
//
//  Created by Ted on 2021/03/03.
//

import UIKit

private let reuseIdentifer = "MenuCell"

enum MenuOptions: Int, CaseIterable, CustomStringConvertible {
    case profile
    case settings
    case logout
    
    var description: String {
        switch self {
        case .profile: return "Profile"
        case .settings: return "Settings"
        case .logout: return "Log Out"
        }
    }
    
    var image: UIImage {
        switch self {
        case .profile: return UIImage(systemName: "person.crop.circle") ?? UIImage()
        case .settings: return UIImage(systemName: "lock.circle") ?? UIImage()
        case .logout: return UIImage(systemName: "arrowshape.turn.up.left") ?? UIImage()
        }
    }
}

protocol MenuControllerDelegate: class {
    func didSelect(options: MenuOptions)
}

class MenuController: UITableViewController {
    
    // MARK: - Properties
    
    weak var delegate: MenuControllerDelegate?
    
    private lazy var menuHeader: UIView = {
        let frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 50)
        
        let view = UIView(frame: frame)
        return view
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
    }
    
    // MARK: -  Helpers
    
    func configureTableView() {
        
        tableView.backgroundColor = .white
        tableView.separatorStyle = .none
        tableView.isScrollEnabled = false
        tableView.rowHeight = 60
        tableView.register(MenuOptionCell.self, forCellReuseIdentifier: reuseIdentifer)
        tableView.tableHeaderView = menuHeader
    }
    
}

//MARK: - TableView

extension MenuController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MenuOptions.allCases.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifer, for: indexPath) as! MenuOptionCell
        guard let option = MenuOptions(rawValue: indexPath.row) else { return UITableViewCell() }
        cell.iconImageView.image = option.image
        cell.descriptionLabel.text = option.description
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let option = MenuOptions(rawValue: indexPath.row) else { return }
        tableView.deselectRow(at: indexPath, animated: true)
        delegate?.didSelect(options: option)
    }
}
