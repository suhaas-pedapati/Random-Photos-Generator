//
//  ViewController.swift
//  Random_photos_generator
//
//  Created by Suhaas Pedapati on 11/4/22.
//

import UIKit

class ViewController: UIViewController {
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        //fills the white picture and auto adjusts the scale to fit
        imageView.contentMode = .scaleAspectFill
        //white square/image added
        imageView.backgroundColor = .white
        return imageView
        
        
    }()
        //coding/making the button
    private let button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        //.normal = for normal state show button
        button.setTitle("Random Photos", for: .normal)
        button.setTitleColor(.black, for: .normal)
        
        return button
        
      
    }()
   //created an array of colors the system can go through after the button has been pressed
    let colors: [UIColor] = [
        .systemPink,
        .systemRed,
        .systemGreen,
        .systemOrange,
        .systemGray,
        .systemYellow,
        .systemPurple,
        .systemBrown,
        .systemCyan
    
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //background color
        view.backgroundColor = .systemPink
        //adding the 'white' square
        view.addSubview(imageView)
        //created the size of the picture
        imageView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        //centers the picture
        imageView.center = view.center
        
        //adding a button 'view' with addSubview
        view.addSubview(button)

       
        //function we want to call resides in current class - "self"
        button.addTarget(self, action: #selector(TapButton), for: .touchUpInside)
        //.touchUpInside is Apples way of saying 'tap'
                
    
    }
    
    //tells button what to do
    //give button 'life' AKA give button a function/action
    @objc func TapButton() {
        //GetRandomPhoto()
        
        view.backgroundColor = colors.randomElement()
        //call get random photo function within the button function because thats where it happens
        GetRandomPhoto()
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        //button size
        button.frame = CGRect(
            x: 30,
            y: view.frame.size.height - 150 - view.safeAreaInsets.bottom,
            width: view.frame.size.width - 60,
            height: 55)
    }
    
//starting random photo function
    func GetRandomPhoto() {
        let urlString =
            "https://source.unsplash.com/random/600x600"
        //! = telling software URL exists
        let url = URL(string: urlString)!
       //try? means that we will try to get data from url
        guard let data = try? Data(contentsOf: url) else {
            return
        }
        //now we try to create image from data pulled
        imageView.image = UIImage(data: data)
        
    }
}

/*imageArr = ["1.jpeg","2.jpeg","3.jpeg","4.jpeg"]
    let RandomNumber = Int(arc4random_uniform(UInt32(self.imageArr.count)))
    //imageArr is array of images
     let image = UIImage.init(named: "\(imageArr[RandomNumber])")

    let imageView = UIImageView.init(image: image)
*/
