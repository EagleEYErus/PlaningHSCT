//
//  AuthorizationViewController.swift
//  PlaningHSCT
//
//  Created by Момотов Евгений Олегович on 03.06.2020.
//

import UIKit

final class AuthorizationViewController: BaseViewController {
    private var presenter: AuthorizationPresenter!
    
    private let loginTextField = TextFieldView()
    private let passwordTextField = TextFieldView()
    private let signInButton = PrimaryButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = AuthorizationPresenterImpl(view: self)
        configureView()
    }
    
    @objc
    private func didTapSignIn() {
        view.endEditing(true)
        guard
            let login = loginTextField.textField.text,
            let password = passwordTextField.textField.text,
            !login.isEmpty,
            !password.isEmpty else {
                showErrorAlert(message: "Заполните логин и пароль!")
                return
        }
        presenter.signIn(login: login, password: password)
    }
    
    func showErrorAlert(message: String?) {
        showAlert(title: "Ошибка", message: message ?? "Не удалось войти в систему")
    }
}

extension AuthorizationViewController {
    private func configureView() {
        addLoginTextField()
        addPasswordTextField()
        addSignInButton()
    }
    
    private func addLoginTextField() {
        loginTextField.label.text = "Логин"
        loginTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(loginTextField)
        
        loginTextField.snp.makeConstraints {
            $0.centerY.equalToSuperview().offset(-100)
            $0.left.right.equalToSuperview().inset(16)
        }
    }
    
    private func addPasswordTextField() {
        passwordTextField.label.text = "Пароль"
        passwordTextField.textField.textContentType = .password
        passwordTextField.textField.isSecureTextEntry = true
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(passwordTextField)
        
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(loginTextField.snp.bottom).offset(16)
            $0.left.right.equalToSuperview().inset(16)
        }
    }
    
    private func addSignInButton() {
        signInButton.setTitle("Войти", for: .normal)
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(signInButton)
        
        signInButton.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(16)
            $0.left.right.equalToSuperview().inset(32)
            $0.height.equalTo(44)
        }
        
        signInButton.addTarget(self, action: #selector(didTapSignIn), for: .touchUpInside)
    }
}
