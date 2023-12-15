import UIKit


final class FilterTableViewCell: UITableViewCell {
    
    private lazy var label: UILabel = {
        let element = UILabel()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.font = .systemFont(ofSize: 17, weight: .regular)
        element.textColor = .black
        return element
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupView()
        addConstraints()
    }
    
    func configureCell(text: String) {
        label.text = text
    }
    
    private func setupView() {
        addSubview(label)
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            label.centerYAnchor.constraint(equalTo: centerYAnchor),
            label.widthAnchor.constraint(equalToConstant: 286)
        ])
    }
}
