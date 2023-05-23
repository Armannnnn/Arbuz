import UIKit
import Foundation

struct Product: Equatable {
    let image: UIImage
    let name: String
    let unit: String
    var price: String
}

class MainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    private var products: [Product] = [
        Product(image: UIImage(named: "lemon")!, name: "Лимон Аргентина", unit: "кг", price: "700 Тенге"),
        Product(image: UIImage(named: "cheese")!, name: "Сыр Сливочный Белорусь", unit: "шт", price: "200 Тенге"),
        Product(image: UIImage(named: "amiran")!, name: "Сметана Амиран 20% 380 г", unit: "шт", price: "840 Тенге"),
        Product(image: UIImage(named: "qiwi")!, name: "Киви Аргентина", unit: "кг", price: "100 Тенге"),
        Product(image: UIImage(named: "strawberry")!, name: "Клубника 400г", unit: "шт", price: "2460 Тенге"),
        Product(image: UIImage(named: "apple")!, name: "Яблоки", unit: "кг", price: "100 Тенге")
    ]
    
    private var selectedProducts: [Product] = []
    private var selectedProducts1: [Product] = []


    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    var valueLabel: UILabel!
    var stepper: UIStepper!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Главная"
        
        setupTableView()
        setupNextButton()
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ProductCell.self, forCellReuseIdentifier: "ProductCell")
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 110),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -130),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCell", for: indexPath) as! ProductCell
        let product = products[indexPath.row]
        cell.configure(with: product)
        cell.delegate = self
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 108
    }
    
    let nextButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 0, y: 0, width: 343, height: 48)
        button.backgroundColor = UIColor(red: 0.325, green: 0.788, blue: 0.353, alpha: 1)
        button.layer.cornerRadius = 12
        button.setTitle("Перейти в корзину", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private func setupNextButton(){
        view.addSubview(nextButton)
                
        nextButton.addTarget(self, action: #selector(moveToNext), for: .touchUpInside)
        nextButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -70).isActive = true
        nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        nextButton.widthAnchor.constraint(equalToConstant: 343).isActive = true
        nextButton.heightAnchor.constraint(equalToConstant: 48).isActive = true
    }
    
    @objc func moveToNext(){
        let subscription = CartViewController()
        let transition = CATransition()
        transition.duration = 0.5
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.fade
        self.navigationController?.view.layer.add(transition, forKey: nil)
        DispatchQueue.main.async {
            self.navigationController?.pushViewController(subscription, animated: true)
            subscription.title = "Оформление подписок"
        }
        for i in selectedProducts1{
            subscription.addProduct(i)
        }
    }
}
    
extension MainViewController: ProductCellDelegate {
    func addButtonTapped(product: Product, cell: ProductCell) {
        selectedProducts1.append(product)
        cell.setButtonImage(named: "checkmark")
    }
}
    
