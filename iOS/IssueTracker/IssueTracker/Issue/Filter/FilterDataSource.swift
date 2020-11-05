//
//  FilterDataSource.swift
//  IssueTracker
//
//  Created by 김근수 on 2020/11/05.
//  Copyright © 2020 김근수. All rights reserved.
//

import UIKit

final class FilterDataSource: NSObject, UITableViewDataSource {
    
    enum Section {
        case plain
        case detail
    }
    
    var plainFilterOptions: [PlainFilterOption]?
    var detailFilterOptions: [DetailFilterOption]?
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard let section = Section(section) else { return "" }
        return section.title
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return Section.allCases.count
    }
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        guard let section = Section(section) else { return 0 }
        switch section {
        case .plain:
            return plainFilterOptions?.count ?? 0
        case .detail:
            return detailFilterOptions?.count ?? 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = String(describing: FilterTableViewCell.self)
        guard
            let section = Section(indexPath.section),
            let cell = tableView.dequeueReusableCell(withIdentifier: identifier)
            as? FilterTableViewCell
        else { return UITableViewCell() }
    
        switch section {
        case .plain:
            cell.configure(title: plainFilterOptions?[indexPath.row].description)
        case .detail:
            cell.configure(title: detailFilterOptions?[indexPath.row].description)
            cell.accessoryType = .disclosureIndicator
            cell.checkImageView?.alpha = 0
        }
        
        return cell
    }
    
}

extension FilterDataSource.Section: CaseIterable {
    
    init? (_ value: Int) {
        switch value {
        case 0:
            self = .plain
        case 1:
            self = .detail
        default:
            return nil
        }
    }
    
    var title: String {
        switch self {
        case .plain:
            return "다음 중에 조건을 고르세요"
        case .detail:
            return "세부 조건"
        }
    }
    
}
