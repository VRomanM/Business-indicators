//
//  SingleIndicatorTableViewCell.swift
//  Business indicators
//
//  Created by Роман Вертячих on 02.02.2024.
//

import UIKit

class SingleIndicatorTableViewCell: UITableViewCell {
    //MARK: - View
    private let nameIndicatorLabel: UILabel = UILabel()
    private let valueIndicatorLabel: UILabel = UILabel()
    private let indicatorImage: UIImageView = UIImageView()
    
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
//        print("maxX: \(contentView.frame.maxX) maxY: \(contentView.frame.maxY)")
        let heightCell = contentView.frame.maxY
        let widthCell = contentView.frame.maxX
        let separator: CGFloat = 10
        indicatorImage.frame = .init(x: separator, y: separator, width: heightCell - separator * 2, height: heightCell - separator * 2)
        nameIndicatorLabel.frame = .init(x: indicatorImage.frame.maxX + separator, y: separator, width: widthCell - indicatorImage.frame.width  - separator * 4 - heightCell, height: heightCell - separator * 2)
        valueIndicatorLabel.frame = .init(x: nameIndicatorLabel.frame.maxX + separator, y: separator, width: widthCell - nameIndicatorLabel.frame.maxX - separator * 2, height: heightCell - separator * 2)
    }
    
    //MARK: Private function
    private func initCell() {
        contentView.addSubview(indicatorImage)
        contentView.addSubview(nameIndicatorLabel)
        contentView.addSubview(valueIndicatorLabel)
    }
    
    //MARK: - Function
    func configureCell(indicator: SingleIndicator) {
        indicatorImage.image = indicator.image ?? UIImage(systemName: "person")
        nameIndicatorLabel.text = indicator.title
        valueIndicatorLabel.text = indicator.value
    }
}