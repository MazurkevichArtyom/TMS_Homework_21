//
//  ColorTableViewCell.swift
//  HW21
//
//  Created by Artem Mazurkevich on 01.06.2022.
//

import UIKit

class ColorTableViewCell: UITableViewCell {
    weak var delegate: BackgroundColorDelegate?
    
    let colorNameLabel: UILabel
    let colorButton: UIButton
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        colorNameLabel = UILabel()
        colorButton = UIButton()
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func setupUI() {
        colorNameLabel.font = UIFont.boldSystemFont(ofSize: 20)
        colorNameLabel.translatesAutoresizingMaskIntoConstraints = false
        colorNameLabel.textAlignment = .left
        contentView.addSubview(colorNameLabel)
        colorNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 32).isActive = true
        colorNameLabel.heightAnchor.constraint(equalTo: contentView.heightAnchor).isActive = true
        colorNameLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.5).isActive = true
        colorNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        
        colorButton.setTitle("SET COLOR", for: .normal)
        colorButton.titleLabel?.font = UIFont.italicSystemFont(ofSize: 14)
        colorButton.addTarget(self, action: #selector(onColorButton), for: .touchUpInside)
        colorButton.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(colorButton)
        colorButton.leadingAnchor.constraint(equalTo: colorNameLabel.trailingAnchor, constant: 8).isActive = true
        colorButton.heightAnchor.constraint(equalTo: contentView.heightAnchor).isActive = true
        colorButton.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        colorButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -32).isActive = true
    }
    
    @objc private func onColorButton() {
        delegate?.setBackgroundColor(color: backgroundColor ?? UIColor.clear)
    }

}
