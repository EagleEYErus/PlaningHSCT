//
//  ResultCalenarView.swift
//  PlaningHSCT
//
//  Created by Момотов Евгений Олегович on 24.05.2020.
//

import UIKit

final class ResultCalendarView: UIView {
    private let resultLabel = UILabel()
    private let autologousLabel = UILabel()
    private let allogeneicLabel = UILabel()
    
    init() {
        super.init(frame: .zero)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(total: Int, autologous: Int, allogeneic: Int) {
        resultLabel.text = "Всего: " + total.toString()
        autologousLabel.text = TherapyType.autologous.name + ": " + autologous.toString()
        allogeneicLabel.text = TherapyType.allogeneic.name + ": " + allogeneic.toString()
    }
}

extension ResultCalendarView {
    private func configureView() {
        addResultLabel()
        addAutologousLabel()
        addAllogeneicLabel()
    }
    
    private func addResultLabel() {
        resultLabel.font = .primaryFont(ofSize: 16, weight: .medium)
        resultLabel.textColor = .black
        resultLabel.textAlignment = .center
        resultLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(resultLabel)
        
        resultLabel.snp.makeConstraints {
            $0.left.top.bottom.equalToSuperview()
        }
    }
    
    private func addAutologousLabel() {
        autologousLabel.font = .primaryFont(ofSize: 16, weight: .medium)
        autologousLabel.textColor = .black
        autologousLabel.textAlignment = .center
        autologousLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(autologousLabel)
        
        autologousLabel.snp.makeConstraints {
            $0.centerX.top.bottom.equalToSuperview()
        }
    }
    
    private func addAllogeneicLabel() {
        allogeneicLabel.font = .primaryFont(ofSize: 16, weight: .medium)
        allogeneicLabel.textColor = .black
        allogeneicLabel.textAlignment = .center
        allogeneicLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(allogeneicLabel)
        
        allogeneicLabel.snp.makeConstraints {
            $0.right.top.bottom.equalToSuperview()
        }
    }
}
