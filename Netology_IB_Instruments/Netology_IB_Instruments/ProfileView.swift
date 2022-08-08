//
//  ProfileVIew.swift
//  Netology_IB_Instruments
//
//  Created by Dima Shikhalev on 07.07.2022.
//

import Foundation
import UIKit

class ProfileView : UIView {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var avatarUiImage: UIImageView!
    @IBOutlet weak var dateOfBirthLabel: UILabel!
    @IBOutlet weak var signatureLabel: UITextView!
    @IBOutlet weak var cityLabel: UILabel!
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        
        let view = self.loadViewFromXib()
        self.addSubview(view)
       // view.frame = self.bounds
    }
    
    private func loadViewFromXib() -> UIView {
        
        guard let view = Bundle.main.loadNibNamed("ProfileView", owner: self)?.first as? UIView else {
            return UIView()
        }

        return view
    }
    
}
