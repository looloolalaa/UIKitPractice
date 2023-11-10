//
//  ViewController.swift
//  UIKitPractice
//
//  Created by Kihyun Lee on 2023/01/06.
//

import UIKit
import AuthenticationServices

class FirstViewController: UIViewController {
    
    // MARK: - Properties
    let authorizationAppleIDButton = ASAuthorizationAppleIDButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    // MARK: - UI
    private func configureUI() {
        setAdditionalPropertyAttributes()
        setConstraints()
    }

    private func setAdditionalPropertyAttributes() {
        authorizationAppleIDButton.addTarget(self, action: #selector(handleAuthorizationAppleIDButton(_:)), for: .touchUpInside)
    }

    private func setConstraints() {
        view.addSubview(authorizationAppleIDButton)
        authorizationAppleIDButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            authorizationAppleIDButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            authorizationAppleIDButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

    // MARK: - Selectors
    @objc private func handleAuthorizationAppleIDButton(_ sender: ASAuthorizationAppleIDButton) {
        let provider = ASAuthorizationAppleIDProvider()
        let request = provider.createRequest()
//        request.requestedScopes = [.fullName, .email]
        let controller = ASAuthorizationController(authorizationRequests: [request])
        
        controller.delegate = self
        controller.presentationContextProvider = self
        
        controller.performRequests()
    }

}

extension FirstViewController: ASAuthorizationControllerDelegate {

    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        if let appleIDCredential = authorization.credential as? ASAuthorizationAppleIDCredential {
            // Create an account in your system.
            
            let userIdentifier = appleIDCredential.user
            let userFirstName = appleIDCredential.fullName?.givenName
            let userLastName = appleIDCredential.fullName?.familyName
            let userEmail = appleIDCredential.email
            print("!apple response!")
            if let asd = appleIDCredential.identityToken {
                print("identityToken: ", String(data: asd, encoding: .utf8 ))
            }
            if let zzz = appleIDCredential.authorizationCode {
                print("authorizationCode: ", String(data: zzz, encoding: .utf8 ))
            }
            
//            print(userIdentifier)
            print(userFirstName)
            print(userLastName)
            print(userEmail)
            
            let appleIDProvider = ASAuthorizationAppleIDProvider()
            appleIDProvider.getCredentialState(forUserID: userIdentifier) { (credentialState, error) in
                switch credentialState {
                case .authorized:
                    // The Apple ID credential is valid. Show Home UI Here
                    print("authorized")
                    break
                case .revoked:
                    // The Apple ID credential is revoked. Show SignIn UI Here.
                    print("rovoked")
                    break
                case .notFound:
                    // No credential was found. Show SignIn UI Here.
                    print("notFound")
                    break
                default:
                    print("default")
                    break
                }
            }
        }
    }

    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        print(error)
    }
}


extension FirstViewController: ASAuthorizationControllerPresentationContextProviding {

    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return view.window!
    }
}
