import UIKit

class CustomLabel: UILabel {
    
    enum CustomTextFieldType {
        case address
        case contactInfo
        case subscriptionPeriod
        case dayDelivery
        case timeDelivery
    }
    
    private let labelType: CustomTextFieldType
    
    init(labelTextType: CustomTextFieldType){

        self.labelType = labelTextType

        super.init(frame: .zero)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.frame = CGRect(x: 0, y: 0, width: 152, height: 26)
        self.font = UIFont.boldSystemFont(ofSize: 22)
        self.textColor = .black
        
        switch labelTextType{
        case .address:
            self.text = "Адрес доставки"
        case .contactInfo:
            self.text = "Контактная информация"
        case .subscriptionPeriod:
            self.text = "Срок подписки на доставку"
        case .dayDelivery:
            self.text = "День доставки"
        case .timeDelivery:
            self.text = "Время доставки"
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
