//
//  ViewController.swift
//  Daily_Converter
//
//  Created by Atharva veer on 10/20/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPink
        view.addSubview(imageView)
        imageView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        imageView.center = view.center
        
        view.addSubview(button)
        getRandomPhoto()
        button.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
        
        
        
        
    }
    
    
    @objc func tapButton(){
        getRandomPhoto()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        button.frame = CGRect(x: 30, y: view.frame.size.height-250-view.safeAreaInsets.bottom, width: view.frame.size.width - 60, height: 55 )
        
    }
    
    //IMAGE VIEW
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .white
        
        return imageView
        
    }()
    
    //BUTTON VIEW
    private let button: UIButton = {
        let button = UIButton()
        
        button.backgroundColor = .white
        button.setTitle("New Photo", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
        
    }()
    
    func getRandomPhoto() {
        let urlString = "https://source.unsplash.com/random/600x600"
        let url = URL(string: urlString)!
        
        guard let data = try? Data(contentsOf: url) else {
            
            return
            
        }
        imageView.image = UIImage(data: data)
        
        
    }
    
    

}

