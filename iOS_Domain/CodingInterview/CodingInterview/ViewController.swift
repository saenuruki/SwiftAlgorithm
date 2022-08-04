//
//  ViewController.swift
//  CodingInterview
//
//  Created by 塗木冴 on 2022/08/01.
//

import UIKit

class ViewController: UIViewController {
    
    private let tableView: UITableView = .init(frame: .zero)

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configure()
    }

    func configure() {
        tableView.register(Cell.self, forCellReuseIdentifier: String(describing: Cell.self))
        tableView.rowHeight = UITableView.automaticDimension
        tableView.backgroundColor = .black
        tableView.separatorStyle = .none
        tableView.estimatedRowHeight = 1000
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
        
        self.view.addSubview(tableView)
        
        tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
    }
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableCell = tableView.dequeueReusableCell(withIdentifier: String(describing: Cell.self), for: indexPath) as! Cell
        tableCell.configure(message: Message(name: "hoge", style: .text("yeah")))
        return tableCell
    }
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
}

class Cell: UITableViewCell {
    private let nameLabel = UILabel()
    private let messageLabel = UILabel()
    private let stampImageView = UIImageView()
    private let longPressGesture = UILongPressGestureRecognizer()

    private enum Size {
        static var currentSideMargin: CGFloat { return 16.0 }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .black
        selectionStyle = .none
        
        nameLabel.numberOfLines = 0
        nameLabel.lineBreakMode = .byCharWrapping
        nameLabel.font = .boldSystemFont(ofSize: 13.0)
        nameLabel.setContentHuggingPriority(.required, for: .horizontal)
        nameLabel.setContentCompressionResistancePriority(.required, for: .horizontal)
        
        messageLabel.numberOfLines = 0
        messageLabel.lineBreakMode = .byCharWrapping
        messageLabel.font = .systemFont(ofSize: 13.0)
        
        
        let hStack = UIStackView(arrangedSubviews: [nameLabel, messageLabel])
        hStack.axis = .horizontal
        hStack.distribution = .fill
        hStack.alignment = .leading
        hStack.spacing = 8
        
        addSubview(hStack)
        hStack.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        hStack.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        hStack.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        hStack.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("This method is never called.")
    }
    
    func configure(message: Message) {
        nameLabel.text = message.name
        switch message.style {
        case .text(let text):
            messageLabel.text = text
            messageLabel.isHidden = false
            stampImageView.isHidden = true
        case .stamp(_):
            print("Do it later")
        }
    }
}

struct Message {
    let name: String
    let style: Style
    
    enum Style {
        case text(String)
        case stamp(String)
    }
}
