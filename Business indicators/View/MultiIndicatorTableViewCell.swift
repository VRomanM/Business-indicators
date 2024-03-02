//
//  MultiIndicatorTableViewCell.swift
//  Business indicators
//
//  Created by Роман Вертячих on 23.02.2024.
//

import UIKit

class MultiIndicatorTableViewCell: UITableViewCell {

    //MARK: - View
    
    private let nameIndicatorLabel: UILabel = UILabel()
    private let valueIndicatorLabel1: UILabel = UILabel()
    private let valueIndicatorLabel2: UILabel = UILabel()
    private let valueIndicatorLabel3: UILabel = UILabel()
    private let indicatorImage: UIImageView = UIImageView()
    private let valuesVerticalStackView: UIStackView = UIStackView()
    private let brush = UIColor()
    
    //MARK: - Constructions
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
    //MARK: - Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let heightCell = contentView.frame.maxY
        let widthCell = contentView.frame.maxX
        let separator: CGFloat = 10
        indicatorImage.frame = .init(x: separator, y: separator, width: heightCell - separator * 2, height: heightCell - separator * 2)
        nameIndicatorLabel.frame = .init(x: indicatorImage.frame.maxX + separator, y: separator, width: round((widthCell - indicatorImage.frame.width  - separator * 4) / 2), height: heightCell - separator * 2)
        valuesVerticalStackView.frame = .init(x: nameIndicatorLabel.frame.maxX + separator, y: separator, width: widthCell - nameIndicatorLabel.frame.maxX - separator * 2, height: heightCell - separator * 2)
        
        let heightValueIndicatorLable = round((valuesVerticalStackView.frame.maxY - separator) / 3)
        valueIndicatorLabel1.frame = .init(x: 0, y: 0, width: valuesVerticalStackView.frame.width, height: heightValueIndicatorLable)
        valueIndicatorLabel2.frame = .init(x: 0, y: heightValueIndicatorLable, width: valuesVerticalStackView.frame.width, height: heightValueIndicatorLable)
        valueIndicatorLabel3.frame = .init(x: 0, y: heightValueIndicatorLable * 2, width: valuesVerticalStackView.frame.width, height: heightValueIndicatorLable)
    }
    
    //MARK: Private function
    
    private func initCell() {
        contentView.addSubview(indicatorImage)
        indicatorImage.contentMode = .scaleAspectFit
        contentView.addSubview(nameIndicatorLabel)
        contentView.addSubview(valuesVerticalStackView)
        valuesVerticalStackView.spacing = 1
        valuesVerticalStackView.axis = .vertical
        valuesVerticalStackView.addSubview(valueIndicatorLabel1)
        valuesVerticalStackView.addSubview(valueIndicatorLabel2)
        valuesVerticalStackView.addSubview(valueIndicatorLabel3)
        contentView.superview?.backgroundColor = brush.backgroundColor()
    }
    
    //MARK: - Function
    
    func configureCell(indicator: MultiIndicator) {
        indicatorImage.image = indicator.image ?? UIImage(systemName: "person")
        indicatorImage.tintColor = brush.textColor()
        
        nameIndicatorLabel.text = indicator.title
        nameIndicatorLabel.textColor = brush.textColor()
        
        valueIndicatorLabel1.text = indicator.values[0]
        valueIndicatorLabel1.textColor = brush.textColor()
        valueIndicatorLabel2.text = indicator.values[1]
        valueIndicatorLabel2.textColor = brush.textColor()
        valueIndicatorLabel3.text = indicator.values[2]
        valueIndicatorLabel3.textColor = brush.textColor()
    }

}
