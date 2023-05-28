//
//  Welcome.swift
//  Codigo_CodeTest
//
//  Created by Zin Min Phyo on 28/05/2023.
//

import UIKit

class Welcome: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var createNewAccountBtn: UIButton!
    @IBOutlet weak var loginWithFacebookBtn: UIButton!
    @IBOutlet weak var loginWithEmailBtn: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        configureHierarchy()
    }
    

    private func configureHierarchy() {
        configureTitleLabel()
        configureSubtitleLabel()
        configureCreateNewAccountBtn()
        configureLoginWithFacebookBtn()
        configureLoginWithEmailBtn()
    }
    
    private func configureTitleLabel() {
        titleLabel.text = "Welcome to \n Ready To Travel"
        titleLabel.textColor = UIColor.black
        titleLabel.font = Fonts.black
        titleLabel.numberOfLines = 0
    }
    
    private func configureSubtitleLabel() {
        subtitleLabel.text = "Sign up with Facebook for the most fulfilling trip planning experience with us."
        subtitleLabel.textColor = UIColor.black
        subtitleLabel.font = Fonts.bold
        subtitleLabel.numberOfLines = 0
    }
    
    private func configureCreateNewAccountBtn() {
        if #available(iOS 15.0, *) {
            var configuration = UIButton.Configuration.plain()
            configuration.title = "Create a new account"
            configuration.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer({ incoming in
                var outgoing = incoming
                outgoing.font = Fonts.regular
                outgoing.foregroundColor = UIColor.white
                return outgoing
            })
            createNewAccountBtn.configuration = configuration
        } else {
            createNewAccountBtn.setTitle("Create a new account", for: .normal)
            createNewAccountBtn.setTitleColor(UIColor.white, for: .normal)
            createNewAccountBtn.titleLabel?.font = Fonts.regular
        }
        createNewAccountBtn.layer.cornerRadius = 10
        createNewAccountBtn.clipsToBounds = true
        createNewAccountBtn.addTarget(self, action: #selector(didTapCreateNewAccountBtn), for: .touchUpInside)
        createNewAccountBtn.setGradientBackground(startColor: Colors.startColor, endColor: Colors.endColor)
    }
    
   
    private func configureLoginWithFacebookBtn() {
        if #available(iOS 15.0, *) {
            var configuration = UIButton.Configuration.plain()
            configuration.title = "Log in with Facebook"
            configuration.imagePlacement = .trailing
            configuration.imagePadding = 50
            configuration.image = UIImage(named: "facebook")
            configuration.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer({ incoming in
                var outgoing = incoming
                outgoing.font = Fonts.regular
                outgoing.foregroundColor = UIColor.white
                return outgoing
            })
            loginWithFacebookBtn.configuration = configuration
            loginWithFacebookBtn.backgroundColor = UIColor.systemBlue
            loginWithFacebookBtn.layer.cornerRadius = 10
        } else {
            // Fall back eariler versions.
        }
    }
    
    private func configureLoginWithEmailBtn() {
        if #available(iOS 15.0, *) {
            var configuration = UIButton.Configuration.plain()
            configuration.title = "Log in with Email"
            configuration.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer({ incoming in
                var outgoing = incoming
                outgoing.font = Fonts.regular
                outgoing.foregroundColor = UIColor.white
                return outgoing
            })
            loginWithEmailBtn.configuration = configuration
            loginWithEmailBtn.backgroundColor = UIColor.systemBlue
            loginWithEmailBtn.layer.cornerRadius = 10
        }
    }

    
}



// MARK: - Actions.
extension Welcome {
    
    @objc private func didTapCreateNewAccountBtn() {
        print("Tapped Create New Account Button.")
    }
    
}
