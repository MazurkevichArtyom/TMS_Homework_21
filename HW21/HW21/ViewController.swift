//
//  ViewController.swift
//  HW21
//
//  Created by Artem Mazurkevich on 01.06.2022.
//

import UIKit

class ViewController: UIViewController {
    
    private let reuseIdentifier = "color_cell"
    private var colors = [ColorModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        generateDummyData()
        setupUI()
    }
    
    private func setupUI() {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.allowsSelection = false
        tableView.rowHeight = 72
        tableView.backgroundColor = .clear
        tableView.register(ColorTableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 40).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40).isActive = true
    }
    
    private func generateDummyData() {
        let randomCount = Int.random(in: 10...30)
        for _ in 0...randomCount {
            let randomColor = UIColor.random()
            var red: CGFloat = 0
            var green: CGFloat = 0
            var blue: CGFloat = 0
            randomColor.getRed(&red, green: &green, blue: &blue, alpha: nil)
            let model = ColorModel(color: randomColor, name: "(\(Int(red * 255.0)), \(Int(green * 255.0)), \(Int(blue * 255.0)))")
            colors.append(model)
        }
    }
    
}

extension ViewController : BackgroundColorDelegate {
    func setBackgroundColor(color: UIColor) {
        self.view.backgroundColor = color
    }
}

extension ViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        colors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! ColorTableViewCell
        cell.delegate = self
        let colorModel = colors[indexPath.row]
        let textColor: UIColor = colorModel.color.isDarkColor ? .white : .black
        cell.colorNameLabel.text = colorModel.name
        cell.colorNameLabel.textColor = textColor
        cell.backgroundColor = colorModel.color
        cell.colorButton.setTitleColor(textColor, for: .normal)
        return cell
    }
}
