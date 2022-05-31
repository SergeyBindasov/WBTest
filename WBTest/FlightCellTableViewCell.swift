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
        label.font = UIFont(name: "Montserrat-SemiBold", size: 22)
        label.textColor = .white
        return label
    }()
    
    private lazy var destinationLabel: UILabel = {
        let label = UILabel()
        label.text = "Cочи"
        label.font = UIFont(name: "Montserrat-SemiBold", size: 22)
        label.textColor = .white
        return label
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
    func setupLayout() {
        contentView.backgroundColor = .white
       setHorizontalGradientColor(innerView)
        
        contentView.addSubviews(innerView)
        innerView.addSubviews(departureLabel, destinationLabel)
    
        innerView.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().offset(20)
            make.trailing.bottom.equalToSuperview().offset(-20)
            make.height.equalTo(240)
        }

        departureLabel.snp.makeConstraints { make in
            make.leading.top.equalToSuperview().offset(12)
        }

        destinationLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(12)
            make.trailing.equalToSuperview().offset(-12)
        }
    }
}
