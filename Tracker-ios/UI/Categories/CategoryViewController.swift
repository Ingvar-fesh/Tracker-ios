import UIKit

protocol CategoriesViewControllerDelegate: AnyObject {
    func didConfirm(_ category: TrackerCategory)
}

final class CategoriesViewController: UIViewController {
    // MARK: - Layout elements

    private let categoriesTableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(CategoryCell.self, forCellReuseIdentifier: CategoryCell.identifier)
        table.separatorStyle = .none
        table.isScrollEnabled = false
        table.allowsMultipleSelection = false
        return table
    }()

    private lazy var button: UIButton = {
        let button = Button(title: "Добавить категорию")
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        return button
    }()

    // MARK: - Properties
    weak var delegate: CategoriesViewControllerDelegate?
    private let viewModel: CategoriesViewModel

    // MARK: - Lifecycle
    init(selectedCategory: TrackerCategory?) {
        viewModel = CategoriesViewModel(selectedCategory: selectedCategory)
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupContent()
        setupConstraints()

        viewModel.delegate = self
        viewModel.loadCategories()
    }

    // MARK: - Actions
    @objc
    private func didTapButton() {
        viewModel.didTapButton()
    }
}

// MARK: - Layout methods
private extension CategoriesViewController {
    func setupContent() {
        title = "Категория"
        view.backgroundColor = .white
        view.addSubview(categoriesTableView)
        view.addSubview(button)

        categoriesTableView.dataSource = self
        categoriesTableView.delegate = self
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            // categoriesTableView
            categoriesTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            categoriesTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 24),
            categoriesTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            categoriesTableView.bottomAnchor.constraint(equalTo: button.topAnchor, constant: -16),
            // button
            button.leadingAnchor.constraint(equalTo: categoriesTableView.leadingAnchor),
            button.trailingAnchor.constraint(equalTo: categoriesTableView.trailingAnchor),
            button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            button.heightAnchor.constraint(equalToConstant: 60),
        ])
    }
}

// MARK: - UITableViewDataSource
extension CategoriesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let categoryCell = tableView.dequeueReusableCell(withIdentifier: CategoryCell.identifier) as? CategoryCell else {
            return UITableViewCell()
        }
        
        let category = viewModel.categories[indexPath.row]
        let isSelected = viewModel.selectedCategory == category
        var position: ListItem.Position
        
        switch indexPath.row {
        case 0:
            position = .first
        case viewModel.categories.count - 1:
            position = .last
        default:
            position = .middle
        }
        
        categoryCell.configure(with: category.label, isSelected: isSelected, position: position)
        return categoryCell
    }
    
    
}

// MARK: - UITableViewDelegate
extension CategoriesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        ListItem.height
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.selectCategory(at: indexPath)
    }
}


// MARK: - CategoriesViewModelDelegate
extension CategoriesViewController: CategoriesViewModelDelegate {
    func didUpdateCategories() {
        if viewModel.categories.isEmpty {
            button.setTitle("Добавить категорию", for: .normal)
        } else {
            button.setTitle("Готово", for: .normal)
        }
    }
    
    func didSelectCategory() {
        categoriesTableView.reloadData()
    }
    
    func didConfirm(_ category: TrackerCategory) {
        delegate?.didConfirm(category)
    }
    
}
