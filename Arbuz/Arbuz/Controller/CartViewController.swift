import UIKit

struct CellData{
    var productImageView: UIImageView
    var productName: String
    var price: String
    var unit: String
    var amount: String
}

class CartViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    
    var cartProducts: [Product] = []

    let nextButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 0, y: 0, width: 343, height: 48)
        button.backgroundColor = UIColor(red: 0.325, green: 0.788, blue: 0.353, alpha: 1)
        button.layer.cornerRadius = 12
        button.setTitle("Далее", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(ProductCell.self, forCellReuseIdentifier: "CartCell")

        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        title = "Корзина"
        setupNextButton()
        setupTableView()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cartProducts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CartCell", for: indexPath) as! ProductCell
        let product = cartProducts[indexPath.row]
        cell.configure(with: product)
        cell.selectionStyle = .none
        cell.addButton.addTarget(self, action: #selector(deleteButtonTapped(_:)), for: .touchUpInside)
        cell.addButton.setImage(UIImage(systemName: "xmark"), for: .normal)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 108
    }
    
    
    func addProduct(_ product: Product) {
        cartProducts.append(product)
        tableView.reloadData()
    }
    
    @objc func moveToNext(){
        let subscription = SubscriptionViewController() 
        let transition = CATransition()
        transition.duration = 0.5
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.fade
        self.navigationController?.view.layer.add(transition, forKey: nil)
        DispatchQueue.main.async {
            self.navigationController?.pushViewController(subscription, animated: true)
            subscription.title = "Оформление подписок"
        }
    }
    

    @objc private func deleteButtonTapped(_ sender: UIButton) {
        guard let cell = sender.superview?.superview as? ProductCell,
              let indexPath = tableView.indexPath(for: cell) else {
            return
        }

        let product = cartProducts[indexPath.row]
        if let index = cartProducts.firstIndex(of: product) {
            cartProducts.remove(at: index)
            tableView.reloadData()
        }
        
    }
    
    func deleteProduct(_ product: Product) {
        if let index = cartProducts.firstIndex(of: product) {
            cartProducts.remove(at: index)
            tableView.reloadData()
        }
    }
    
    private func setupTableView(){
        view.addSubview(tableView)
        tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 110).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -200).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
    }
    
    private func setupNextButton(){
        view.addSubview(nextButton)
                
        nextButton.addTarget(self, action: #selector(moveToNext), for: .touchUpInside)
        nextButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -70).isActive = true
        nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        nextButton.widthAnchor.constraint(equalToConstant: 343).isActive = true
        nextButton.heightAnchor.constraint(equalToConstant: 48).isActive = true
    }
    
}
