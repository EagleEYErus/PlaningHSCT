//
//  CalendarViewController.swift
//  PlaningHSCT
//
//  Created by Момотов Евгений Олегович on 19.05.2020.
//

import UIKit
import FSCalendar

final class CalendarViewController: BaseViewController {
    private var presenter: CalendarPresenter!
    
    private let calendarView = FSCalendar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = CalendarPresenterImpl(view: self)
        configureView()
    }
}

extension CalendarViewController {
    private func configureView() {
        title = "Календарь"
        addCalendarView()
    }
    
    private func addCalendarView() {
        calendarView.locale = Locale(identifier: "RU")
        calendarView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(calendarView)
        
        calendarView.snp.makeConstraints {
            $0.left.top.right.equalToSuperview()
            $0.height.equalTo(300)
        }
    }
}
