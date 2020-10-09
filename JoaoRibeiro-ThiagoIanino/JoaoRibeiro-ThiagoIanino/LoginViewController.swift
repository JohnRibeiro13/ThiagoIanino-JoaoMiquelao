//
//  LoginViewController.swift
//  JoaoRibeiro-ThiagoIanino
//
//  Created by andre on 09/10/20.
//  Copyright © 2020 joao. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    
    @IBOutlet weak var userText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    
    let urlBase = "http://petshop-ios.herokuapp.com/"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    
    @IBAction func login(_ sender: Any) {
        guard let user = userText.text,
              let password = passwordText.text
        else {
            return
        }
                
        
        
        callLoginService(with: user, andPassword: password) { result in
            
            DispatchQueue.main.async {
                if result {
                    self.performSegue(withIdentifier: "loginSegue", sender: nil)
                } else {
                    
                    let alertController = UIAlertController(title: "Ops!",
                                                            message: "Usuário ou senha inválido!",
                                                            preferredStyle: .actionSheet)
                    
                    alertController.addAction(UIAlertAction(title: "OK", style: .default))
                    alertController.addAction(UIAlertAction(title: "Cancelar", style: .default))
                    self.present(alertController, animated: true)
                }
            }
        }
    }
    
    private func callLoginService(with user : String, andPassword: String,
                                  completion: @escaping(Bool) -> ()) {
        
        guard let url = URL(string: urlBase + "/login") else { return }
        var urlRequest = URLRequest( url: url)

        let parameters = ["email": user,
                          "password": andPassword]

        urlRequest.addValue("application/json", forHTTPHeaderField: "content-type")
        
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
            urlRequest.httpBody = jsonData
        } catch {
            print("erro de parse")
        }
        
        urlRequest.httpMethod = "POST"
        
        
        URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let data = data {
                
                completion(true)
            }
            completion(false)
        }.resume()
        
        return
    }
    
}
