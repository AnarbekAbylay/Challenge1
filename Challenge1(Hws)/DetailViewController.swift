//
//  DetailViewController.swift
//  Challenge1(Hws)
//
//  Created by Abylay Anarbek on 16/3/2022.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    var selectedImage:String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .gray
        title = "\(selectedImage!.uppercased().replacingOccurrences(of: "@3X.PNG", with: ""))"
        
        if let imageName = selectedImage {
            var image = UIImage(named:imageName)
            imageView.image = image
        }
        changeAppearance()
        
        
        
        // Do any additional setup after loading the view.
    }
    
    func changeAppearance() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
        
    }
    
    @objc func shareTapped() {
        guard let image = imageView.image?.jpegData(compressionQuality: 0.8) else {
            print("No image found")
            return
        }
        
        let vc = UIActivityViewController(activityItems: [image,selectedImage!.uppercased()], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationController?.navigationItem.rightBarButtonItem
        present(vc,animated:true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
