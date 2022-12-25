//
//  ViewController.swift
//  FlagViewer
//
//  Created by n on 25.12.2022.
//

import UIKit

class ViewController: UITableViewController {
    var pictures = [String]()
//MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        //file manager to look for files
        let fm = FileManager.default
        //path = bundle to find all the images
        let path = Bundle.main.resourcePath!
        //array of strings containing filenames
        let items = try!fm.contentsOfDirectory(atPath: path)
        //add .sorted to show the image names in sorted order
        for item in items.sorted() {
            if item.hasSuffix(".png") && !item.hasPrefix("cntr") {
                pictures.append(item)
            }
        }
        print(pictures)
        title = "Flag Viewer"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
//MARK: - numberOfRowsInSection
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
//MARK: - cellForRowAt
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        cell.textLabel?.font = .systemFont(ofSize: 25)
        return cell
    }
//MARK: - didSelectRowAt
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //try loading the "Detail" view controller and typecasting it to be DetailViewController
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            //success - set its selectedImage property
            vc.selectedImage = pictures[indexPath.row]
            //push it onto the navigation controller
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}

