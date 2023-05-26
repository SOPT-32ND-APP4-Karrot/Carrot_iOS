//
//  HomeViewController.swift
//  SOPT-32nd-APP4-CarrotiOS
//
//  Created by kyun on 2023/05/19.
//

import UIKit

import SnapKit
import Then

final class HomeViewController: UIViewController {
    
    private var salesArray: [Datum] = []
    
    private let homeNavigationView = HomeNavigationView()
    
    private let homeTableView = UITableView()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        loadSales()
        setUI()
        setLayout()
        setDelegate()
    }
    
    private func loadSales() {
        
        HomeService.get.loadSales() { response in
            switch response {
            case .success(let data):
                dump(data)
                guard let data = data as? HomeDataModel else { return }
                self.salesArray = data.data
                self.homeTableView.reloadData()
            default:
                return
            }
        }
    }
}

extension HomeViewController {
    
    private func setUI() {
        
        view.backgroundColor = Color.carrotWhite
        
        homeTableView.do {
            $0.showsVerticalScrollIndicator = false // 스크롤 바 안 보이게
            $0.backgroundColor = Color.carrotWhite
            $0.registerCell(HomeTableViewCell.self)
//            $0.registerReusableView(HomeHeaderView.self)
        }
    }
    
    private func setLayout() {
        
        view.addSubviews(homeNavigationView, homeTableView)

        homeNavigationView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(44)
            $0.horizontalEdges.equalTo(view.safeAreaLayoutGuide)
        }
        
        homeTableView.snp.makeConstraints {
            $0.top.equalTo(homeNavigationView.snp.bottom)
            $0.bottom.equalToSuperview().inset(86)
            $0.horizontalEdges.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(1000)
        }
    }
    
    private func setDelegate() {
        homeTableView.delegate = self
        homeTableView.dataSource = self
    }
}

extension HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.salesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = homeTableView.dequeueCell(type: HomeTableViewCell.self, indexPath: indexPath)
        
        cell.salesDataBind(datum: self.salesArray[indexPath.row])
        
        return cell
    }
}

extension HomeViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 140
    }
}
