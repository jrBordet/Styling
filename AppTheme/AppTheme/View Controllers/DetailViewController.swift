//
//  DetailViewController.swift
//  AppThemeDemo
//
//  Created by Jean Raphael Bordet on 21/05/2020.
//  Copyright © 2020 Jean Raphael Bordet. All rights reserved.
//

import UIKit
import Styling

class DetailViewController: UIViewController {

    let theme: AppThemeMaterial = .swiftHeroes
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view |> theme.detailView
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
