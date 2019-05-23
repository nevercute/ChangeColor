//
//  ViewController.swift
//  Color Changer
//
//  Created by NEVERCUTE on 22/05/2019.
//  Copyright © 2019 NEVERCUTE. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //MARK: Define UIButtons and labels
    let redSlider: UISlider = {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 1
        slider.addTarget(self, action: #selector(handleSliderChanged), for: .valueChanged)
        return slider
    }()
    let redLabel: UILabel = createLabel("RED")
    
    let greenSlider: UISlider = {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 1
        slider.addTarget(self, action: #selector(handleSliderChanged), for: .valueChanged)
        return slider
    }()
    let greenLabel: UILabel = createLabel("GREEN")
    
    let blueSlider: UISlider = {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 1
        slider.addTarget(self, action: #selector(handleSliderChanged), for: .valueChanged)
        return slider
    }()
    let blueLabel: UILabel = createLabel("BLUE")
    
    let colorView = UIView(frame: CGRect(x: 10, y: 10, width: 200, height: 200))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //MARK: call layout and colorView setup
        setupLayout()
        chageViewColor()
    }
    
    fileprivate func setupLayout(){

        //MARK: define uiStack for each color slider and label group
        let redStackView = UIStackView(arrangedSubviews: [redLabel, redSlider])
        redStackView.distribution = .fillEqually
        redStackView.spacing = 10
        
        let greenStackView = UIStackView(arrangedSubviews: [greenLabel, greenSlider])
        greenStackView.distribution = .fillEqually
        greenStackView.spacing = 10
        
        let blueStackView = UIStackView(arrangedSubviews: [blueLabel, blueSlider])
        blueStackView.distribution = .fillEqually
        blueStackView.spacing = 10
        
        //MARK: Define result uiStack group
        let resultStackView = UIStackView(
            arrangedSubviews: [redStackView, greenStackView, blueStackView, colorView]
        )
        
        //MARK: to set a constraints that depends on view hierarhy
        //we need to add subview before
        view.addSubview(resultStackView)
        
        //MARK: Set vertical axis, spacing for each color uiStack view, that included into result view stack
        resultStackView.axis = .vertical
        resultStackView.distribution = .fillEqually
        resultStackView.spacing = 12
        
        //MARK: setup layout constraints.
        resultStackView.translatesAutoresizingMaskIntoConstraints = false
        resultStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        resultStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
        resultStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
        resultStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
    }
    
    //MARK: the function that slider bind to
    @objc fileprivate func handleSliderChanged(slider: UISlider){
        chageViewColor()
    }
    
    //MARK: sets the colorView background color
    fileprivate func chageViewColor() {
        colorView.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: 1)
    }
    
    //MARK: to avid a biolerplate code block this func creates label and
    //sets same properties.
    fileprivate static func createLabel(_ labelText: String) -> UILabel{
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 14)
        label.text = labelText
        label.textColor = UIColor(named: labelText.lowercased())
        return label
    }


}

