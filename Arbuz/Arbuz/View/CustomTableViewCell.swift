import UIKit

class CustomTableViewCell: UITableViewCell {
    
    var data: CellData?{
        didSet{
            guard let data = data else {return}
            self.productImage = data.productImageView
            self.nameLabel.text = data.productName
            self.price.text = data.price
            self.unit.text = data.unit
            self.amount.text = data.amount
        }
    }
    
    var productImage: UIImageView = {
        let flagImageView = UIImageView()
        flagImageView.image = UIImage(named: "asd")
        flagImageView.frame = CGRect(x: 0, y: 0, width: 90, height: 90)
        flagImageView.clipsToBounds = true
        flagImageView.layer.cornerRadius = 12
        return flagImageView
    }()
    
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 0, width: 209, height: 32)
        label.font = UIFont(name: "SFProText-Semibold", size: 17)
        label.text = "NAME"
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let price: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 0, width: 54, height: 20)
        label.font = UIFont(name: "Inter-Bold", size: 14)
        label.textColor = .black
        label.text = "dasdasdas"

        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let unit: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 0, width: 80, height: 18)
        label.font = UIFont(name: "Inter-Bold", size: 14)
        label.textColor = UIColor(red: 0.427, green: 0.451, blue: 0.518, alpha: 1)
        label.text = "Шт"
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let amount: UILabel = {
        let label = UILabel()
        
        label.frame = CGRect(x: 0, y: 0, width: 18, height: 18)
        label.font = UIFont(name: "SFProText-Regular", size: 15)
        label.textColor = UIColor(red: 0.533, green: 0.533, blue: 0.533, alpha: 1)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let deleteButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 0, y: 0, width: 10.67, height: 10.67)
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        button.tintColor = UIColor(red: 0.776, green: 0.792, blue: 0.827, alpha: 1)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
//    let container: UIView = {
//        let container = UIView()
//        container.layer.cornerRadius = 12
//        container.translatesAutoresizingMaskIntoConstraints = false
//        container.clipsToBounds = true
//        return container
//    }()
    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI(){
        
        contentView.addSubview(nameLabel)
        nameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -75).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 108).isActive = true
        
        contentView.addSubview(price)
        price.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -24).isActive = true
        price.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15).isActive = true
        
        contentView.addSubview(unit)
        unit.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -50).isActive = true
        unit.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 108).isActive = true
        
        contentView.addSubview(amount)
        amount.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 104).isActive = true
        amount.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12).isActive = true
        amount.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 251).isActive = true
        
        contentView.addSubview(productImage)
        productImage.clipsToBounds = true
        productImage.layer.cornerRadius = 12
        productImage.translatesAutoresizingMaskIntoConstraints = false
        productImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 6).isActive = true
        productImage.widthAnchor.constraint(equalToConstant: 90).isActive = true
        productImage.heightAnchor.constraint(equalToConstant: 90).isActive = true
        
        contentView.addSubview(deleteButton)
        deleteButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 31).isActive = true
        deleteButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -77).isActive = true
        deleteButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 2.67).isActive = true
        deleteButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 339.67).isActive = true
    }
}
