//
//  FlightCellTableViewCell.swift
//  WBTest
//
//  Created by Sergey on 31.05.2022.
//

import UIKit
import SnapKit

class FlightCellTableViewCell: UITableViewCell {
    
    private lazy var innerView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width - 40, height: 240))
        view.layer.cornerRadius = 14
        return view
    }()
    
    private lazy var departureLabel: UILabel = {
        let label = UILabel()
        label.text = "Москва"
        label.font = UIFont(name: "Montserrat-SemiBold", size: 28)
        label.textColor = .white
        return label
    }()
    
    private lazy var destinationLabel: UILabel = {
        let label = UILabel()
        label.text = "Cочи"
        label.font = UIFont(name: "Montserrat-SemiBold", size: 28)
        label.textColor = .white
        return label
    }()
    
    private lazy var departureCityCode: UILabel = {
        let label = UILabel()
        label.text = "MOW"
        label.font = UIFont(name: "Montserrat-Medium", size: 20)
        label.textColor = .white.withAlphaComponent(0.8)
        return label
    }()
    
    private lazy var destinationCityCode: UILabel = {
        let label = UILabel()
        label.text = "PEE"
        label.font = UIFont(name: "Montserrat-Medium", size: 20)
        label.textColor = .white.withAlphaComponent(0.8)
        return label
    }()
    
    private lazy var flightImg: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "flight")?.withTintColor(.white)
        return image
    }()
    
    private lazy var departureDate: UILabel = {
        let label = UILabel()
        label.text = "Ср. 26.07.2022"
        label.font = UIFont(name: "Montserrat-Medium", size: 16)
        label.textColor = .white
        return label
    }()
    
    private lazy var departureTime: UILabel = {
        let label = UILabel()
        label.text = "03:00"
        label.font = UIFont(name: "Montserrat-Medium", size: 16)
        label.textColor = .white
        return label
    }()
    
    private lazy var returnDate: UILabel = {
        let label = UILabel()
        label.text = "Сб. 29.07.2022"
        label.font = UIFont(name: "Montserrat-Medium", size: 16)
        label.textColor = .white
        return label
    }()
    
    private lazy var returnTime: UILabel = {
        let label = UILabel()
        label.text = "13:00"
        label.font = UIFont(name: "Montserrat-Medium", size: 16)
        label.textColor = .white
        return label
    }()
    
    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.text = "5 999 ₽"
        label.font = UIFont(name: "Montserrat-SemiBold", size: 32)
        label.textColor = .white
        return label
    }()
    
    private lazy var likeButton: UIImageView = {
        let like = UIImageView()
        like.image = UIImage(systemName: "suit.heart")
        like.tintColor = .white
        like.contentMode = .scaleAspectFill
        return like
    }()
    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        setupLayout()
        let tap = UITapGestureRecognizer(target: self, action: #selector(likeButtonTapped))
        likeButton.addGestureRecognizer(tap)
        likeButton.isUserInteractionEnabled = true
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

extension FlightCellTableViewCell {
    
    @objc func likeButtonTapped() {
        if likeButton.image == UIImage(systemName: "suit.heart") {
        likeButton.image = UIImage(systemName: "suit.heart.fill")
        } else {
            likeButton.image = UIImage(systemName: "suit.heart")
        }
    }
    
    func setupLayout() {
        contentView.backgroundColor = .white
       setHorizontalGradientColor(innerView)
        
        contentView.addSubviews(innerView)
        innerView.addSubviews(departureLabel, destinationLabel, departureCityCode,destinationCityCode, flightImg, departureDate, departureTime, returnDate, returnTime, priceLabel, likeButton)
    
        innerView.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().offset(20)
            make.trailing.bottom.equalToSuperview().offset(-20)
            make.height.equalTo(240)
        }

        departureLabel.snp.makeConstraints { make in
            make.leading.top.equalToSuperview().offset(18)
        }

        destinationLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(18)
            make.trailing.equalToSuperview().offset(-18)
        }
        
        departureCityCode.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(18)
            make.top.equalTo(departureLabel.snp.bottom).offset(6)
        }
        
        destinationCityCode.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-18)
            make.top.equalTo(destinationLabel.snp.bottom).offset(6)
        }
        
        flightImg.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.height.lessThanOrEqualTo(40)
        }
        
        departureDate.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(18)
            make.top.equalTo(departureCityCode.snp.bottom).offset(18)
        }
        
        departureTime.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(18)
            make.top.equalTo(departureDate.snp.bottom).offset(6)
        }
        
        returnDate.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-18)
            make.top.equalTo(destinationCityCode.snp.bottom).offset(18)
        }
        
        returnTime.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-18)
            make.top.equalTo(returnDate.snp.bottom).offset(6)
    }
        
        priceLabel.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-18)
            make.top.equalTo(returnTime.snp.bottom).offset(28)
        }
        
        likeButton.snp.makeConstraints { make in
            make.centerX.equalTo(departureTime.snp.centerX)
            make.centerY.equalTo(priceLabel.snp.centerY)
            make.width.height.lessThanOrEqualTo(40)
        }
        
}
}
