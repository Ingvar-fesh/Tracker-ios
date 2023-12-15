import UIKit

final class StatsCell: UITableViewCell {
    
    lazy var headerLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var countLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 34)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        setupLayout()
    }
    
    func setupGradient() {
        backgroundColor = .white
        layer.cornerRadius = 16
        let gradient = UIImage.gradientImage(bounds: layer.bounds, colors: UIColor.gradient)
        let gradientColor = UIColor(patternImage: gradient)
        layer.borderWidth = 1
        layer.borderColor = gradientColor.cgColor
    }
    
    private func setupUI() {
        addSubview(countLabel)
        addSubview(headerLabel)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            countLabel.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            countLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            countLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            
            headerLabel.topAnchor.constraint(equalTo: countLabel.bottomAnchor),
            headerLabel.leadingAnchor.constraint(equalTo: countLabel.leadingAnchor),
            headerLabel.trailingAnchor.constraint(equalTo: countLabel.trailingAnchor),
            headerLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12)
        ])
        setNeedsLayout()
        layoutIfNeeded()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
