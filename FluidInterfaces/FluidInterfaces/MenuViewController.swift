//
//  ViewController.swift
//  FluidInterfaces
//
//  Created by Spock on 2019/6/23.
//  Copyright © 2019 Spock. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    
    @IBOutlet private weak var collectionView: UICollectionView!
    
    private let interfaces = Interface.all

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        view.backgroundColor = UIColor(white: 0.05, alpha: 1)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        collectionView.visibleCells.forEach { $0.isHighlighted = false }
    }
}

extension MenuViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.cellForItem(at: indexPath)?.isHighlighted = true
        let interface = interfaces[indexPath.item]
        let viewController = interface.type.init()
        viewController.title = interface.name
        navigationController?.pushViewController(viewController, animated: true)
        viewController.navigationController?.navigationBar.tintColor = interface.color
    }
}

extension MenuViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return interfaces.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: InterfaceCell.identifier, for: indexPath) as? InterfaceCell else {
            return UICollectionViewCell()
            
        }
        
        let interface = interfaces[indexPath.item]
        cell.title = interface.name
        cell.image = interface.icon
        return cell
    }
    
}

extension MenuViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height:60)
    }
}

class InterfaceCell: UICollectionViewCell {
    
    public static let identifier = "interfaceCell"
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    
    public var title = "" {
        didSet {
            titleLabel.text = title
        }
    }
    
    public var image = UIImage() {
        didSet {
            imageView.image = image
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        sharedInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        sharedInit()
    }
    
    private func sharedInit() {
        backgroundColor = UIColor.white.withAlphaComponent(0.1)
    }
    
    override var isHighlighted: Bool {
        didSet {
            backgroundColor = UIColor.white.withAlphaComponent(isHighlighted ? 0.2 : 0.1)
        }
    }
}
