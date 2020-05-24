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
    private let resultView = ResultCalendarView()
    private let tableView = UITableView(frame: .zero, style: .grouped)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = CalendarPresenterImpl(view: self)
        configureView()
    }
    
    func reloadTableView() {
        DispatchQueue.main.async { [weak self] in
            self?.setResult()
            self?.tableView.reloadData()
        }
    }
    
    func getSelectedDate() -> Date? {
        return calendarView.selectedDate
    }
    
    private func setResult() {
        let total = presenter.requests.count
        let autologous = presenter.requests.filter({ $0.therapyType == TherapyType.autologous.rawValue }).count
        let allogeneic = presenter.requests.filter({ $0.therapyType == TherapyType.allogeneic.rawValue }).count
        resultView.set(total: total, autologous: autologous, allogeneic: allogeneic)
    }
    
    private func showDetailRequest(_ request: Request?) {
        let view = DetailRequestViewController()
        view.presenter = DetailRequestPresenterImpl(view: view, request: request)
        presentRoot(view)
    }
}

extension CalendarViewController: FSCalendarDelegate {
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        presenter.load(for: date)
        reloadTableView()
    }
}

extension CalendarViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.requests.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CalendarEventCell.identifier,
                                                       for: indexPath) as? CalendarEventCell else {
            return UITableViewCell()
        }
        cell.request = presenter.requests[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        DispatchQueue.main.async { [weak self] in
            self?.showDetailRequest(self?.presenter.requests[indexPath.row])
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return nil
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0
    }
}

extension CalendarViewController {
    private func configureView() {
        title = "Календарь"
        addCalendarView()
        addResultView()
        addTableView()
        setResult()
    }
    
    private func addCalendarView() {
        calendarView.select(Date())
        calendarView.delegate = self
        calendarView.locale = Locale(identifier: "RU")
        calendarView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(calendarView)
        
        calendarView.snp.makeConstraints {
            $0.left.top.right.equalToSuperview()
            $0.height.equalTo(300)
        }
    }
    
    private func addResultView() {
        resultView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(resultView)
        
        resultView.snp.makeConstraints {
            $0.top.equalTo(calendarView.snp.bottom).offset(8)
            $0.left.right.equalToSuperview().inset(16)
        }
    }
    
    private func addTableView() {
        tableView.backgroundColor = .white
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints {
            $0.top.equalTo(resultView.snp.bottom).offset(8)
            $0.left.right.bottom.equalToSuperview()
        }
        
        tableView.register(CalendarEventCell.self, forCellReuseIdentifier: CalendarEventCell.identifier)
    }
}
