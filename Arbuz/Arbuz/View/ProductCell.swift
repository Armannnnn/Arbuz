import UIKit

protocol ProductCellDelegate: AnyObject {
    func addButtonTapped(product: Product, cell: ProductCell)
    
}

protocol ProductCellDelegate1: AnyObject {
    func deleteButtonTapped(product: Product)
}

class ProductCell: UITableViewCell {
    
    let mainVC = MainViewController()
    let cartVC = CartViewController()
    
    let productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "asd")
        imageView.frame = CGRect(x: 0, y: 0, width: 90, height: 90)
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 12
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    let nameLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 0, width: 209, height: 32)
        label.font = UIFont(name: "SFProText-Semibold", size: 17)
        label.text = "NAME"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let unitLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 0, width: 209, height: 32)
        label.font = UIFont(name: "SFProText-Semibold", size: 17)
        label.textColor = UIColor(red: 0.427, green: 0.451, blue: 0.518, alpha: 1)
        label.text = "NAME"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let priceLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 0, width: 209, height: 32)
        label.font = UIFont(name: "Inter-Bold", size: 14)
        label.text = "NAME"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let addButton: UIButton = {
        let button = UIButton(type: .system)
        button.frame = CGRect(x: 0, y: 0, width: 10.67, height: 10.67)
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.tintColor = .black
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var minusButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = UIColor(red: 0.251, green: 0.267, blue: 0.314, alpha: 1)
        button.setTitle("-", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 24)
        button.addTarget(self, action: #selector(decreaseValue), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    var plusButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = UIColor(red: 0.251, green: 0.267, blue: 0.314, alpha: 1)
        button.setTitle("+", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 24)
        button.addTarget(self, action: #selector(increaseValue), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    var valueLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = UIColor(red: 0.251, green: 0.267, blue: 0.314, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 20)
        label.text = "0"
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    var stepper: UIStepper = {
        let stepper = UIStepper()
        stepper.minimumValue = 0
        stepper.maximumValue = 100
        stepper.stepValue = 1
        stepper.addTarget(self, action: #selector(stepperValueChanged(_:)), for: .valueChanged)
        stepper.translatesAutoresizingMaskIntoConstraints = false

        return stepper
    }()
    
    @objc private func decreaseValue() {
        stepper.value -= 1
        valueLabel.text = "\(Int(stepper.value))"
    }

    @objc private func increaseValue() {
        stepper.value += 1
        valueLabel.text = "\(Int(stepper.value))"
    }

    @objc private func stepperValueChanged(_ sender: UIStepper) {
        valueLabel.text = "\(Int(sender.value))"
        //    }
    }
    
    var stackView: UIStackView!
    
    func setupStackView() {
        stackView = UIStackView(arrangedSubviews: [minusButton, valueLabel, plusButton])
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 145),
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 60)
        ])
        
        stackView.frame = CGRect(x: 0, y: 0, width: contentView.bounds.width, height: contentView.bounds.height)
    }
        
    
    weak var delegate: ProductCellDelegate?
    weak var delegate1: ProductCellDelegate1?
    private var product: Product?
    
    @objc private func deleteButtonTapped() {
        guard let product = product else { return }
        delegate1?.deleteButtonTapped(product: product)
    }


    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupStackView()
        addButton.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {

        contentView.addSubview(productImageView)
        productImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 6).isActive = true
        productImageView.widthAnchor.constraint(equalToConstant: 90).isActive = true
        productImageView.heightAnchor.constraint(equalToConstant: 90).isActive = true
        
        contentView.addSubview(nameLabel)
        nameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -75).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 108).isActive = true
        
        contentView.addSubview(priceLabel)
        priceLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -14).isActive = true
        priceLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15).isActive = true
        
        contentView.addSubview(unitLabel)
        unitLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -50).isActive = true
        unitLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 108).isActive = true
        
        contentView.addSubview(addButton)
        addButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20).isActive = true
        addButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
        addButton.widthAnchor.constraint(equalToConstant: 15).isActive = true
        addButton.heightAnchor.constraint(equalToConstant: 15).isActive = true
    }

    func configure(with product: Product) {
        self.product = product
        productImageView.image = product.image
        nameLabel.text = product.name
        unitLabel.text = product.unit
        priceLabel.text = "\(product.price)"
    }

    @objc private func addButtonTapped() {
        guard let product = product else { return }
        delegate?.addButtonTapped(product: product, cell: self)
    }
    
    func setButtonImage(named imageName: String) {
        addButton.setImage(UIImage(systemName: imageName), for: .normal)
    }
}
