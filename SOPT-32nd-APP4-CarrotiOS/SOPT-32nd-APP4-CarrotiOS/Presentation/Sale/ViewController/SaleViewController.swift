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
        self.saleTableView.register(SaleSecondSectionCell.self,
                                    forCellReuseIdentifier: SaleSecondSectionCell.identifier)
        self.saleTableView.register(SaleThirdSectionCell.self,
                                    forCellReuseIdentifier: SaleThirdSectionCell.identifier)
        self.saleTableView.register(SaleProductTableViewCell.self,
                                    forCellReuseIdentifier: SaleProductTableViewCell.identifier)
        self.saleTableView.register(RecommendTableViewCell.self,
                                    forCellReuseIdentifier: RecommendTableViewCell.identifier)
        
        self.saleTableView.tableHeaderView?.frame = .init(origin: .zero,
                                                          size: .init(width: UIScreen.main.bounds.width,
                                                                      height: 383))
        self.saleTableView.rowHeight = UITableView.automaticDimension
        self.saleTableView.estimatedRowHeight = 300
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
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        if indexPath.section == 0 {
            guard let firstSectionCell = tableView.dequeueReusableCell(withIdentifier: SaleFirstSectionCell.identifier) as? SaleFirstSectionCell else {return UITableViewCell()}
            return firstSectionCell
        } else if indexPath.section == 1 {
            guard let secondSectionCell = tableView.dequeueReusableCell(withIdentifier: SaleSecondSectionCell.identifier) as? SaleSecondSectionCell else {return UITableViewCell()}
            return secondSectionCell
        } else if indexPath.section == 2 {
            guard let thirdSectionCell = tableView.dequeueReusableCell(withIdentifier: SaleThirdSectionCell.identifier) as? SaleThirdSectionCell else {return UITableViewCell()}
            return thirdSectionCell
        } else if indexPath.section == 3 {
            guard let fourthSectionCell = tableView.dequeueReusableCell(withIdentifier: SaleProductTableViewCell.identifier) as? SaleProductTableViewCell else {return UITableViewCell()}
            return fourthSectionCell
        } else if indexPath.section == 4 {
            guard let fifthSectionCell = tableView.dequeueReusableCell(withIdentifier: RecommendTableViewCell.identifier) as? RecommendTableViewCell else {return UITableViewCell()}
            return fifthSectionCell
        }
        else {
            guard let dummyCell = tableView.dequeueReusableCell(withIdentifier: SaleDummyTableViewCell.identifier) as? SaleDummyTableViewCell else {return UITableViewCell()}
            return dummyCell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 81
        } else if indexPath.section == 1 {
            return 390
        } else if indexPath.section == 2 {
            return 188
        } else if indexPath.section == 3 {
            return 254
        } else if indexPath.section == 4 {
            return 600
        }
        return 81
    }
}
