//
//  SaleViewController.swift
//  SOPT-32nd-APP4-CarrotiOS
//
//  Created by 박윤빈 on 2023/05/17.
//

import UIKit

import SnapKit
import Then

class SaleViewController: BaseViewController {
    
    private let saleTableView = UITableView(frame: .zero, style: .plain).then {
        $0.contentInsetAdjustmentBehavior = .never
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTableViewConfig()
    }
    
    override func setUI() {
        self.view.addSubviews(saleTableView)
    }
    
    override func setLayout() {
        saleTableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    private func setTableViewConfig() {
        self.saleTableView.delegate = self
        self.saleTableView.dataSource = self
        
        let headerView = SaleHeaderView()
        
        self.saleTableView.tableHeaderView = headerView
        self.saleTableView.register(SaleDummyTableViewCell.self,
                                    forCellReuseIdentifier: SaleDummyTableViewCell.identifier)
        self.saleTableView.register(SaleFirstSectionCell.self,
                                    forCellReuseIdentifier: SaleFirstSectionCell.identifier)
        self.saleTableView.tableHeaderView?.frame = .init(origin: .zero,
                                                          size: .init(width: UIScreen.main.bounds.width,
                                                                      height: 383))
    }
    
}

extension SaleViewController: UITableViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y < 0 {
            if let headerView = self.saleTableView.tableHeaderView as? SaleHeaderView {
                headerView.setResizeView(scrollView.contentOffset.y)
            }
        }
    }
}

extension SaleViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return 30
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let dummyCell = tableView.dequeueReusableCell(withIdentifier: SaleDummyTableViewCell.identifier) as? SaleDummyTableViewCell else {return UITableViewCell()}
        
        guard let firstSectionCell = tableView.dequeueReusableCell(withIdentifier: SaleFirstSectionCell.identifier) as? SaleFirstSectionCell else {return UITableViewCell()}

        if indexPath.section == 0 {
            return firstSectionCell
        } else {
            return dummyCell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 81
    }
    
}
