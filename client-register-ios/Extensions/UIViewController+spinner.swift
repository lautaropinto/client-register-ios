//
//  UIViewController+spinner.swift
//  client-register-ios
//
//  Created by Lautaro Pinto on 10/08/2021.
//

import UIKit

private var spinner : UIView?

internal extension UIViewController {
    func showSpinner(onView : UIView) {
        let spinnerView = UIView.init(frame: onView.bounds)
        spinnerView.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        let ai = UIActivityIndicatorView.init(style: UIActivityIndicatorView.Style.large)
        ai.startAnimating()
        ai.center = spinnerView.center
        
        DispatchQueue.main.async {
            spinnerView.addSubview(ai)
            onView.addSubview(spinnerView)
        }
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        spinner = spinnerView
    }
    
    func removeSpinner() {
        DispatchQueue.main.async {
            spinner?.removeFromSuperview()
            self.navigationController?.setNavigationBarHidden(false, animated: true)
        }
    }
}
