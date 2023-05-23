import UIKit

protocol AddressViewControllerDelegate: AnyObject {
    func addressViewControllerDidSaveText(_ text: String)
}

class SubscriptionViewController: UIViewController{
    
    lazy var dayDeliveryCollectionView: DayDeliveryCollectionView = {
        let collectionView = DayDeliveryCollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    lazy var timeDeliveryCollectionView: TimeDelivaeryCollectionView = {
        let collectionView = TimeDelivaeryCollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    private let username = CustomTextField(fieldType: .username)
    private let phoneNumber = CustomTextField(fieldType: .phoneNumber)
    
    private let address = CustomLabel(labelTextType: .address)
    private let contactInfo = CustomLabel(labelTextType: .contactInfo)
    private let subscriptionPeriod = CustomLabel(labelTextType: .subscriptionPeriod)
    private let dayDelivery = CustomLabel(labelTextType: .dayDelivery)
    private let timeDelivery = CustomLabel(labelTextType: .timeDelivery)
    
    let deliveryButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 0, y: 0, width: 343, height: 25)
        button.tintColor = .black
        button.setTitle("Выбрать адрес доставки", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.setImage(UIImage(systemName:"chevron.right"), for: .normal)
        button.semanticContentAttribute = .forceRightToLeft
        button.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.left
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(addAddress), for: .touchUpInside)
        return button
    }()

    let subscribeButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 0, y: 0, width: 343, height: 48)
        button.backgroundColor = UIColor(red: 0.325, green: 0.788, blue: 0.353, alpha: 1)
        button.layer.cornerRadius = 12
        button.setTitle("Оформить подписку", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
        
    let currentDatePicker = UIDatePicker()
    let anyDatePicker = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        setupUI()
        
        currentDatePicker.datePickerMode = .date
        currentDatePicker.date = Date()
        currentDatePicker.addTarget(self, action: #selector(currentDatePickerValueChanged(_:)), for: .valueChanged)

        anyDatePicker.datePickerMode = .date
        anyDatePicker.addTarget(self, action: #selector(anyDatePickerValueChanged(_:)), for: .valueChanged)

        view.addSubview(currentDatePicker)
        view.addSubview(anyDatePicker)

    }

    
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        currentDatePicker.frame = CGRect(x: 30, y: 490, width: 150, height: 200)
        anyDatePicker.frame = CGRect(x: 200, y: 490, width: 150, height: 200)
    }

    @objc func currentDatePickerValueChanged(_ sender: UIDatePicker) {
        _ = sender.date
    }

    @objc func anyDatePickerValueChanged(_ sender: UIDatePicker) {
        _ = sender.date
    }
    
    @objc func addAddress(){
        let address = AddressViewController()
        address.delegate = self

        self.present(UINavigationController(rootViewController: address), animated: true, completion: nil)
    }
    
    private func setupUI(){
        
        view.addSubview(dayDeliveryCollectionView)
        view.addSubview(address)
        view.addSubview(deliveryButton)
        view.addSubview(contactInfo)
        view.addSubview(username)
        view.addSubview(phoneNumber)
        view.addSubview(subscribeButton)
        view.addSubview(subscriptionPeriod)
        view.addSubview(dayDelivery)
        view.addSubview(timeDelivery)
        view.addSubview(timeDeliveryCollectionView)
        
        dayDelivery.topAnchor.constraint(equalTo: view.topAnchor, constant: 95).isActive = true
        dayDelivery.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25).isActive = true
        dayDelivery.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        dayDelivery.widthAnchor.constraint(equalToConstant: 343).isActive = true
        dayDelivery.heightAnchor.constraint(equalToConstant: 48).isActive = true
        
        dayDeliveryCollectionView.topAnchor.constraint(equalTo: dayDelivery.bottomAnchor, constant: -10).isActive = true
        dayDeliveryCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        dayDeliveryCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        dayDeliveryCollectionView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        timeDelivery.topAnchor.constraint(equalTo: dayDeliveryCollectionView.bottomAnchor, constant: 5).isActive = true
        timeDelivery.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        timeDelivery.widthAnchor.constraint(equalToConstant: 343).isActive = true
        timeDelivery.heightAnchor.constraint(equalToConstant: 48).isActive = true

        timeDeliveryCollectionView.topAnchor.constraint(equalTo: timeDelivery.bottomAnchor, constant: -10).isActive = true
        timeDeliveryCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        timeDeliveryCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        timeDeliveryCollectionView.heightAnchor.constraint(equalToConstant: 50).isActive = true

        address.topAnchor.constraint(equalTo: timeDeliveryCollectionView.bottomAnchor, constant: 5).isActive = true
        address.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25).isActive = true
        address.widthAnchor.constraint(equalToConstant: 343).isActive = true
        address.heightAnchor.constraint(equalToConstant: 48).isActive = true
        
        deliveryButton.topAnchor.constraint(equalTo: address.bottomAnchor, constant: -5).isActive = true
        deliveryButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        deliveryButton.widthAnchor.constraint(equalToConstant: 343).isActive = true
        
        contactInfo.topAnchor.constraint(equalTo: deliveryButton.bottomAnchor, constant: 20).isActive = true
        contactInfo.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25).isActive = true
        
        username.topAnchor.constraint(equalTo: contactInfo.bottomAnchor, constant: 10).isActive = true
        username.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        username.widthAnchor.constraint(equalToConstant: 343).isActive = true
        username.heightAnchor.constraint(equalToConstant: 48).isActive = true
        
        phoneNumber.topAnchor.constraint(equalTo: username.bottomAnchor, constant: 10).isActive = true
        phoneNumber.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        phoneNumber.widthAnchor.constraint(equalToConstant: 343).isActive = true
        phoneNumber.heightAnchor.constraint(equalToConstant: 48).isActive = true
        
        subscriptionPeriod.topAnchor.constraint(equalTo: phoneNumber.bottomAnchor, constant: 10).isActive = true
        subscriptionPeriod.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25).isActive = true
        subscriptionPeriod.widthAnchor.constraint(equalToConstant: 343).isActive = true
        subscriptionPeriod.heightAnchor.constraint(equalToConstant: 48).isActive = true
        
        subscribeButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -70).isActive = true
        subscribeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        subscribeButton.widthAnchor.constraint(equalToConstant: 343).isActive = true
        subscribeButton.heightAnchor.constraint(equalToConstant: 48).isActive = true
    }
}

extension SubscriptionViewController: AddressViewControllerDelegate {
    func addressViewControllerDidSaveText(_ text: String) {
        deliveryButton.setTitle(text, for: .normal)
    }
}
