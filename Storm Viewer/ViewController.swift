//
//  ViewController.swift
//  Storm Viewer
//
//  Created by Sankalp Singh Bisht on 05/03/22.
//

import UIKit

class ViewController: UITableViewController {
    var pictures = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title="storm viewer"
        navigationController?.navigationBar.prefersLargeTitles=true
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
       let items = try! fm.contentsOfDirectory(atPath: path)
//        let fileManager = FileManager.default
//        let bundleURL = Bundle.main.bundleURL
//        let assetURL = bundleURL.appendingPathComponent("Images.bundle")
//
//        let contents = try! fileManager.contentsOfDirectory(at: assetURL, includingPropertiesForKeys: [URLResourceKey.nameKey, URLResourceKey.isDirectoryKey], options: .skipsHiddenFiles)


        for item in items {
            if (item.hasPrefix("nssl")){
                pictures.append(item)
                
            }
        }
        print(pictures)
            
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            vc.selectedImage = pictures[indexPath.row]

            navigationController?.pushViewController(vc, animated: true)
        }
    }





}

