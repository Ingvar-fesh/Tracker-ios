import UIKit

protocol CategoriesViewModelDelegate: AnyObject {
    func didUpdateCategories()
    func didSelectCategory()
    func didConfirm(_ category: TrackerCategory)
}

final class CategoriesViewModel {

    // MARK: - Properties

    weak var delegate: CategoriesViewModelDelegate?

    private let trackerCategoryStore = TrackerCategoryStore()
    private(set) var categories: [TrackerCategory] = [] {
        didSet {
            delegate?.didUpdateCategories()
        }
    }
    private(set) var selectedCategory: TrackerCategory? = nil {
        didSet {
            delegate?.didSelectCategory()
        }
    }

    // MARK: - Lifecycle

    init(selectedCategory: TrackerCategory?) {
        self.selectedCategory = selectedCategory
        trackerCategoryStore.delegate = self
    }

    // MARK: - Public

    func loadCategories() {
        categories = getCategoriesFromStore()
    }

    func selectCategory(at indexPath: IndexPath) {
        selectedCategory = categories[indexPath.row]
    }

    func didTapButton() {
        if let selectedCategory {
            delegate?.didConfirm(selectedCategory)
        }
    }

    // MARK: - Private

    private func getCategoriesFromStore() -> [TrackerCategory] {
        do {
            let categories = try trackerCategoryStore.categoriesCoreData.map {
                try trackerCategoryStore.makeCategory(from: $0)
            }
            return categories
        } catch {
            return []
        }
    }
    
}

// MARK: - TrackerCategoryStoreDelegate
extension CategoriesViewModel: TrackerCategoryStoreDelegate {
    func didUpdate() {
        categories = getCategoriesFromStore()
    }
}
