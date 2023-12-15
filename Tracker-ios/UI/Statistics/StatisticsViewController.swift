import UIKit

final class StatisticsViewController: UIViewController {
    
    private lazy var placeholder: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "Sad")
        return image
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Статистика"
        label.font = UIFont.systemFont(ofSize: 34, weight: .bold)
        label.textColor = .black
        return label
    }()
    
    private lazy var tableView: UITableView = {
        let table = UITableView(frame: view.bounds)
        table.register(StatsCell.self, forCellReuseIdentifier: "StatsCell")
        table.layer.cornerRadius = 10
        table.translatesAutoresizingMaskIntoConstraints = false
        table.separatorInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        return table
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupLayout()
    }
    
    private func setupUI() {
        tableView.dataSource = self
        tableView.delegate = self
        view.backgroundColor = .white
        view.addSubview(placeholder)
        view.addSubview(label)
        view.addSubview(tableView)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            placeholder.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            placeholder.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            label.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 44),
            
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 206),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -8)
        ])
    }
    
}

extension StatisticsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        90
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "StatsCell", for: indexPath) as? StatsCell else { return UITableViewCell() }
        let count = TrackerRecordStore.completedTrackers.count
        cell.countLabel.text = "\(count)"
        cell.headerLabel.text = "Трекеров завершено"
        cell.selectionStyle = .none
        cell.setupGradient()
        return cell
    }
}

extension StatisticsViewController: UITableViewDelegate {
    
}
