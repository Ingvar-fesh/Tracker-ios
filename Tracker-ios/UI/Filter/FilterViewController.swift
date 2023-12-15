import UIKit

final class FilterViewController: UIViewController {
    let filterTitles: [String] = ["Все трекеры", "Трекеры на сегодня", "Завершенные", "Не завершенные"]
    
    private lazy var filterLabel: UILabel = {
        let item = UILabel()
        item.translatesAutoresizingMaskIntoConstraints = false
        item.font = .systemFont(ofSize: 16, weight: .medium)
        item.textColor = .black
        item.text = "Фильтры"
        return item
    }()
    
    private lazy var filterTableView: UITableView = {
        let filterTable = UITableView()
        filterTable.translatesAutoresizingMaskIntoConstraints = false
        filterTable.layer.cornerRadius = 16
        filterTable.separatorStyle = .singleLine
        filterTable.isScrollEnabled = false
        return filterTable
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addView()
        setupTableView()
    }
    
    private func setupTableView() {
        filterTableView.register(FilterTableViewCell.self, forCellReuseIdentifier: "FilterTableViewCell")
        filterTableView.dataSource = self
        filterTableView.delegate = self
    }
}

//MARK: UITableViewDataSource
extension FilterViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FilterTableViewCell", for: indexPath) as? FilterTableViewCell else { return UITableViewCell() }
    
        cell.configureCell(text: filterTitles[indexPath.row])
        cell.backgroundColor = UIColor.background
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
    
}

//MARK: UITableViewDelegate
extension FilterViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if let cell = tableView.cellForRow(at: indexPath) {
            if cell.accessoryType == .checkmark {
                cell.accessoryType = .none
            } else {
                cell.accessoryType = .checkmark
            }
        }
    }
}

//MARK: SetupViews
extension FilterViewController {
    private func addView() {
        view.backgroundColor = .white
        view.addSubview(filterLabel)
        view.addSubview(filterTableView)
        addConstraints()
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            filterLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 27),
            filterLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            filterTableView.topAnchor.constraint(equalTo: filterLabel.bottomAnchor, constant: 38),
            filterTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            filterTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            filterTableView.heightAnchor.constraint(equalToConstant: 299)
        ])
    }
}
