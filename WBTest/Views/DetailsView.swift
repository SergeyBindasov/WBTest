//
//  DetailsView.swift
//  WBTest
//
//  Created by Sergey on 01.06.2022.
//

import Foundation
import UIKit
import SnapKit

class DetailsView: UIView {
    
    private lazy var container: UIView = {
        let container = UIView()
        container.backgroundColor = .white
        return container
    }()
    
    private lazy var routeTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Montserrat-SemiBold", size: 26)
        label.adjustsFontSizeToFitWidth = true
        label.textColor = .black
        return label
    }()
    
    private lazy var mainView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width - 30, height: 300))
        setHorizontalGradientColor(view)
        return view
    }()
    
    private lazy var planeImg: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "plane")
        return image
    }()
    
    private lazy var departureLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Montserrat-SemiBold", size: 20)
        label.text = "Отправление"
        label.textColor = .white
        return label
    }()
    
    private lazy var departureCode: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Montserrat-SemiBold", size: 20)
        label.textColor = .white.withAlphaComponent(0.8)
        return label
    }()
    
    private lazy var cityOne: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Montserrat-Medium", size: 14)
        label.textColor = .white.withAlphaComponent(0.8)
        return label
    }()
    
    private lazy var cityTwo: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Montserrat-Medium", size: 14)
        label.textColor = .white.withAlphaComponent(0.8)
        return label
    }()
    
    private lazy var takeoffLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Montserrat-SemiBold", size: 20)
        label.text = "Вылет"
        label.textColor = .white
        return label
    }()
    
    private lazy var takeoffTime: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Montserrat-SemiBold", size: 20)
        label.textColor = .white.withAlphaComponent(0.8)
        return label
    }()
    
    private lazy var takeoffDate: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Montserrat-Medium", size: 14)
        label.textColor = .white.withAlphaComponent(0.8)
        return label
    }()
    
    private lazy var returnLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Montserrat-SemiBold", size: 20)
        label.text = "Обратно"
        label.textColor = .white
        return label
    }()
    
    private lazy var returnTime: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Montserrat-SemiBold", size: 20)
        label.textColor = .white.withAlphaComponent(0.8)
        return label
    }()
    
    private lazy var returnDate: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Montserrat-Medium", size: 14)
        label.textColor = .white.withAlphaComponent(0.8)
        return label
    }()
    
    private lazy var arrivalCode: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Montserrat-SemiBold", size: 20)
        label.textColor = .white.withAlphaComponent(0.8)
        return label
    }()
    
    private lazy var arrivalLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Montserrat-SemiBold", size: 20)
        label.text = "Прибытие"
        label.textColor = .white
        return label
    }()
    
    private lazy var returnImg: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "return")
        return image
    }()
    
    private lazy var flightIdLabel: UILabel = {
        let label = UILabel()
        label.text = "Код перелета"
        label.font = UIFont(name: "Montserrat-SemiBold", size: 20)
        label.textColor = .white
        return label
    }()
    private lazy var flightId: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Montserrat-Medium", size: 14)
        label.textColor = .white.withAlphaComponent(0.8)
        return label
    }()
    
    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Montserrat-SemiBold", size: 26)
        label.textColor = .black
        return label
    }()
    
    private lazy var likeButton: UIButton = {
        let like = UIButton()
        like.setImage(UIImage(systemName: "suit.heart"), for: .normal)
        like.tintColor = .white
        like.contentMode = .scaleAspectFill
        like.addTarget(self, action: #selector(likePressed), for: .touchUpInside)
        return like
    }()
    
    private lazy var buyButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(named: "button")
        button.layer.cornerRadius = 12
        button.setTitle("Бронировать", for: .normal)
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("viewError")
    }
}

extension DetailsView {
    
    @objc func likePressed(sender: UIButton) {
    
    }
    
    func updateUI(with flight: FlightModel) {
        routeTitle.text = flight.departureCity + " " + "\u{21C6}" + " " + flight.destinationCity
        priceLabel.text = flight.price + " " + "₽"
        flightId.text = flight.id
        departureCode.text = flight.departureCode.uppercased()
        arrivalCode.text = flight.destinationCode.uppercased()
        cityOne.text = flight.departureCity
        cityTwo.text = flight.destinationCity
        takeoffTime.text = flight.detaprureTime
        takeoffDate.text = flight.departureDate
        returnTime.text = flight.arrivalTime
        returnDate.text = flight.arrivalDate
    }
    
    func setupLayout() {
        backgroundColor = .white
       addSubviews(container)
        container.addSubviews(routeTitle, mainView, priceLabel, buyButton)
        mainView.addSubviews(planeImg, departureLabel, arrivalLabel, arrivalCode, departureCode, cityOne, cityTwo, takeoffLabel, takeoffTime, takeoffDate, returnLabel, returnDate, returnTime, returnImg, flightIdLabel, flightId, likeButton)

        
        container.snp.makeConstraints { make in
            make.edges.width.equalTo(self.safeAreaLayoutGuide)
            make.centerX.equalToSuperview()
        }
        
        routeTitle.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().offset(18)
            make.trailing.equalTo(container.snp.trailing).offset(-18)
        }
        
        mainView.snp.makeConstraints { make in
            make.top.equalTo(routeTitle.snp.bottom).offset(28)
            make.trailing.equalTo(container.snp.trailing).offset(-15)
            make.leading.equalTo(container.snp.leading).offset(15)
        }
        
        planeImg.snp.makeConstraints { make in

            make.centerX.equalToSuperview()
            make.centerY.equalTo(takeoffLabel.snp.centerY)
            make.width.height.equalTo(24)
        }
        
        departureLabel.snp.makeConstraints { make in
            make.leading.top.equalToSuperview().offset(18)
        }
        
        arrivalLabel.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-18)
            make.centerY.equalTo(departureLabel)
        }
        
        departureCode.snp.makeConstraints { make in
            make.top.equalTo(departureLabel.snp.bottom).offset(8)
            make.centerX.equalTo(departureLabel.snp.centerX)
        }
        
        cityOne.snp.makeConstraints { make in
            make.top.equalTo(departureCode.snp.bottom).offset(8)
            make.centerX.equalTo(departureLabel.snp.centerX)
        }
        
        cityTwo.snp.makeConstraints { make in
            make.top.equalTo(arrivalCode.snp.bottom).offset(8)
            make.centerX.equalTo(arrivalLabel.snp.centerX)
            make.trailing.equalToSuperview().offset(-8)
        }
        
        takeoffLabel.snp.makeConstraints { make in
            make.top.equalTo(cityOne.snp.bottom).offset(18)
            make.centerX.equalTo(departureLabel.snp.centerX)
        }
        
        takeoffTime.snp.makeConstraints { make in
            make.top.equalTo(takeoffLabel.snp.bottom).offset(8)
            make.centerX.equalTo(departureLabel.snp.centerX)
        }
        
        takeoffDate.snp.makeConstraints { make in
            make.top.equalTo(takeoffTime.snp.bottom).offset(8)
            make.centerX.equalTo(departureLabel.snp.centerX)
        }
        
        arrivalCode.snp.makeConstraints { make in
            make.top.equalTo(arrivalLabel.snp.bottom).offset(8)
            make.centerX.equalTo(arrivalLabel.snp.centerX)
        }
        
        returnLabel.snp.makeConstraints { make in
            make.top.equalTo(cityTwo.snp.bottom).offset(18)
            make.centerX.equalTo(arrivalLabel.snp.centerX)
        }
        
        returnTime.snp.makeConstraints { make in
            make.top.equalTo(returnLabel.snp.bottom).offset(8)
            make.centerX.equalTo(arrivalLabel.snp.centerX)
        }
        
        returnDate.snp.makeConstraints { make in
            make.top.equalTo(returnTime.snp.bottom).offset(8)
            make.centerX.equalTo(arrivalLabel.snp.centerX)
        }
        
        returnImg.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalTo(returnDate.snp.centerY)
            make.width.height.equalTo(24)
        }
        
        flightIdLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(18)
            make.top.equalTo(returnDate.snp.bottom).offset(18)
        }
        
        flightId.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(18)
            make.top.equalTo(flightIdLabel.snp.bottom).offset(8)
            make.bottom.equalTo(mainView.snp.bottom).offset(-18)
        }
        
        likeButton.snp.makeConstraints { make in
            make.centerY.equalTo(flightId.snp.centerY)
            make.centerX.equalTo(arrivalLabel.snp.centerX)
        }
        
        priceLabel.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-18)
            make.top.equalTo(mainView.snp.bottom).offset(28)
        }
        
        buyButton.snp.makeConstraints { make in
            make.centerX.equalTo(container.snp.centerX)
            make.width.equalTo(container.snp.width).dividedBy(1.2)
            make.height.equalTo(60)
            make.bottom.equalTo(container.snp.bottom).offset(-40).priority(.high)
        }
    }
}
