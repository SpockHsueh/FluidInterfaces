//
//  CalculatorButtonInterfaceViewController.swift
//  FluidInterfaces
//
//  Created by Spock on 2019/6/24.
//  Copyright © 2019 Spock. All rights reserved.
//

import UIKit

class CalculatorButtonInterfaceViewController: InterfaceViewController {

    private lazy var calculatorButton: CalculatorButton = {
        let button = CalculatorButton()
        button.value = 9
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(calculatorButton)
        calculatorButton.center(in: view)
    }
}

class CalculatorButton: UIControl {
    
    public var value: Int = 0 {
        didSet {
            label.text = "\(value)"
        }
    }
    
    private var label: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 36, weight: .regular)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    private var animator = UIViewPropertyAnimator()
    
    private let normalColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
    private let highlightedColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        sharedInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        sharedInit()
    }
    
    private func sharedInit() {
        backgroundColor = normalColor
        addTarget(self, action: #selector(touchDown), for: [.touchDown, .touchDragEnter])
        addTarget(self, action: #selector(touchUp), for: [.touchUpInside, .touchDragExit, .touchCancel])
        
        addSubview(label)
        label.center(in: self)
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 75, height: 75)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = bounds.width / 2
    }
    
    // Cancel the existing animation if needed, and instantly set the color to the highlighted color
    @objc private func touchDown() {
        animator.stopAnimation(true)
        backgroundColor = highlightedColor
    }
    
    // Create a new animator and start the animation, Using the (UIViewPropertyAnimatior)
    @objc private func touchUp() {
        animator = UIViewPropertyAnimator(duration: 0.5, curve: .easeIn, animations: {
            self.backgroundColor = self.normalColor
        })
        animator.startAnimation()
    }
}
