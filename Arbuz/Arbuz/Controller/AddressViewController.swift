import UIKit

class AddressViewController: UIViewController {
    
    weak var delegate: AddressViewControllerDelegate?

    private let city = AddressTextField(fieldType: .city)
    private let street = AddressTextField(fieldType: .street)
    private let house = AddressTextField(fieldType: .house)
    private let floor = AddressTextField(fieldType: .floor)
    private let apartment = AddressTextField(fieldType: .apartment)
    
    let defaults = UserDefaults.standard
    
    let addButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 0, y: 0, width: 343, height: 48)
        button.backgroundColor = UIColor(red: 0.325, green: 0.788, blue: 0.353, alpha: 1)
        button.layer.cornerRadius = 12
        button.setTitle("Добавить", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(close), for: .touchUpInside)
        return button
    }()
    


    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Адрес доставки"
        view.backgroundColor = .white
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "multiply"),
                                                           style: .done,
                                                           target: self,
                                                           action: #selector(close))
        navigationItem.leftBarButtonItem?.tintColor = .gray
        
        setupUI()
    }
    

    @objc func close(){
        self.dismiss(animated: true)
        let text = "г.\(city.text!), ул.\(street.text!) \(house.text!), \(floor.text!) этаж, кв. \(apartment.text!)" 
        UserDefaults.standard.set(text, forKey: "savedText")
        delegate?.addressViewControllerDidSaveText(text)
    }
    
    private func setupUI(){
        
        view.addSubview(city)
        view.addSubview(street)
        view.addSubview(house)
        view.addSubview(floor)
        view.addSubview(apartment)
        view.addSubview(addButton)
                    
        addButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -70).isActive = true
        addButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        addButton.widthAnchor.constraint(equalToConstant: 343).isActive = true
        addButton.heightAnchor.constraint(equalToConstant: 48).isActive = true
        
        city.topAnchor.constraint(equalTo: view.topAnchor, constant: 65).isActive = true
        city.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        city.widthAnchor.constraint(equalToConstant: 358).isActive = true
        city.heightAnchor.constraint(equalToConstant: 48).isActive = true
        
        street.topAnchor.constraint(equalTo: city.bottomAnchor, constant: 15).isActive = true
        street.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        street.widthAnchor.constraint(equalToConstant: 358).isActive = true
        street.heightAnchor.constraint(equalToConstant: 48).isActive = true
        
        house.topAnchor.constraint(equalTo: street.bottomAnchor, constant: 15).isActive = true
        house.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        house.widthAnchor.constraint(equalToConstant: 106).isActive = true
        house.heightAnchor.constraint(equalToConstant: 48).isActive = true
        
        floor.topAnchor.constraint(equalTo: street.bottomAnchor, constant: 15).isActive = true
        floor.leadingAnchor.constraint(equalTo: house.trailingAnchor, constant: 15).isActive = true
        floor.widthAnchor.constraint(equalToConstant: 106).isActive = true
        floor.heightAnchor.constraint(equalToConstant: 48).isActive = true
        
        apartment.topAnchor.constraint(equalTo: street.bottomAnchor, constant: 15).isActive = true
        apartment.leadingAnchor.constraint(equalTo: floor.trailingAnchor, constant: 15).isActive = true
        apartment.widthAnchor.constraint(equalToConstant: 106).isActive = true
        apartment.heightAnchor.constraint(equalToConstant: 48).isActive = true

    }

}
