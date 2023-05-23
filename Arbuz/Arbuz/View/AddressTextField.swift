import UIKit

class AddressTextField: UITextField {
    
    enum AddressTextFieldType {
        case city
        case street
        case house
        case floor
        case apartment
    }
    
    private let authFieldType: AddressTextFieldType
    
    init(fieldType: AddressTextFieldType) {
        self.authFieldType = fieldType
        super.init(frame: .zero)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .secondarySystemBackground
        self.layer.cornerRadius = 10
        
        self.returnKeyType = .done
        self.autocorrectionType = .no
        self.autocapitalizationType = .none
        
        self.leftViewMode = .always
        self.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: self.frame.size.height))
        
        switch fieldType {
        case .city:
            self.placeholder = "Город"
        case .street:
            self.placeholder = "Улица"
        case .house:
            self.placeholder = "Дом"
        case .floor:
            self.placeholder = "Этаж"
        case .apartment:
            self.placeholder = "Квартира"
        
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
