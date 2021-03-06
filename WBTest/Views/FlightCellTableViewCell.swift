//
//  FlightCellTableViewCell.swift
//  WBTest
//
//  Created by Sergey on 31.05.2022.
//

import UIKit
import SnapKit

class FlightCellTableViewCell: UITableViewCell {
    
    var delegate: LikesOnCellDelegate?
    var index: IndexPath?
    
    private lazy var innerView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width - 30, height: 220))
        view.layer.cornerRadius = 14
        setHorizontalGradientColor(view)
        applyShadow(view)
        return view
    }()
    
    private lazy var departureLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Montserrat-Bold", size: 20)
        label.adjustsFontSizeToFitWidth = true
        label.textColor = .white
        return label
    }()
    
    private lazy var destinationLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Montserrat-Bold", size: 20)
        label.adjustsFontSizeToFitWidth = true
        label.textColor = .white
        return label
    }()
    
    private lazy var horStackView: UIStackView = {
        let stack = UIStackView()
        stack.addArrangedSubview(departureLabel)
        stack.addArrangedSubview(destinationLabel)
        stack.distribution = .equalSpacing
        stack.axis = .horizontal
        return stack
    }()
    
    private lazy var departureCityCode: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Montserrat-SemiBold", size: 20)
        label.textColor = .white.withAlphaComponent(0.8)
        return label
    }()
    
    private lazy var destinationCityCode: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Montserrat-SemiBold", size: 20)
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
        label.font = UIFont(name: "Montserrat-Medium", size: 16)
        label.textColor = .white
        return label
    }()
    
    private lazy var departureTime: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Montserrat-Medium", size: 16)
        label.textColor = .white
        return label
    }()
    
    private lazy var returnDate: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Montserrat-Medium", size: 16)
        label.textColor = .white
        return label
    }()
    
    private lazy var returnTime: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Montserrat-Medium", size: 16)
        label.textColor = .white
        return label
    }()
    
    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Montserrat-SemiBold", size: 26)
        label.textColor = .white
        return label
    }()
    
    private lazy var likeButton: UIButton = {
        let like = UIButton()
        like.setImage(UIImage(systemName: "suit.heart"), for: .normal)
        like.setImage(UIImage(systemName: "suit.heart.fill"), for: .selected)
        like.tintColor = .white
        like.setPreferredSymbolConfiguration(UIImage.SymbolConfiguration(pointSize: 25), forImageIn: .normal)
        like.addTarget(self, action: #selector(cellLikePressed), for: .touchUpInside)
        return like
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

extension FlightCellTableViewCell {
    
    func updateCell(with flight: FlightModel) {
        departureLabel.text = flight.departureCity
        destinationLabel.text = flight.destinationCity
        departureCityCode.text = flight.departureCode.uppercased()
        destinationCityCode.text = flight.destinationCode.uppercased()
        departureDate.text = flight.departureDate
        departureTime.text = flight.detaprureTime
        returnDate.text = flight.arrivalDate
        returnTime.text = flight.arrivalTime
        priceLabel.text = flight.price + " " + "???"
        likeButton.isSelected = flight.isLiked
    }
    
    func updateLikes(with model: FlightModel) {
        likeButton.isSelected = model.isLiked
    }
    
    @objc func cellLikePressed(sender: UIButton)  {
        sender.isSelected.toggle()
        delegate?.onLikeClick(isLiked: sender.isSelected, cell: self)
    }
    
    func setupLayout() {
        contentView.backgroundColor = .white
      
        contentView.addSubviews(innerView)
        innerView.addSubviews(horStackView, departureCityCode,destinationCityCode, flightImg, departureDate, departureTime, returnDate, returnTime, priceLabel, likeButton)
    
        innerView.snp.makeConstraints { make in
            
            make.top.equalToSuperview().offset(15)
            make.leading.equalToSuperview().offset(15)
            make.trailing.bottom.equalToSuperview().offset(-15)
            make.height.equalTo(220)
        }

        horStackView.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().offset(18)
            make.trailing.equalToSuperview().offset(-18)
        }
        
        departureCityCode.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(18)
            make.top.equalTo(horStackView.snp.bottom).offset(6)
        }
        
        destinationCityCode.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-18)
            make.top.equalTo(horStackView.snp.bottom).offset(6)
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
        }
}
}
