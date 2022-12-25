//
//  DetalViewController.swift
//  FlagViewer
//
//  Created by n on 25.12.2022.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    var selectedImage: String?
//MARK: - viewDidLoad
    override func viewDidLoad() {
        title = selectedImage
        navigationItem.largeTitleDisplayMode = .never
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
        
        if let imageToLoad = selectedImage {
            imageView.image = UIImage(named: imageToLoad)
        }
    }
//MARK: - viewWillAppear
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
//MARK: - viewWillDisappear
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
//MARK: - shareTapped
    @objc func shareTapped() {
        guard let flagPic = imageView.image?.pngData(), let name = selectedImage
        else {
            print("We didn't found any image.")
            return
        }
        let avc = UIActivityViewController(activityItems: [flagPic, name], applicationActivities: [])
        avc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(avc, animated: true)
    }
}
