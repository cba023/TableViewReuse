//
//  TableViewReuse.swift
//  TableViewReuse
//
//  Created by bo.chen on 2021/5/28.
//

import UIKit

public extension UITableView {
    
    private func className<Object: AnyObject>(_ cls: Object.Type) -> String {
        let className = NSStringFromClass(cls)
        return className
    }
    
    private func generateClass(name: String) -> AnyObject {
        let cls: AnyClass = NSClassFromString(name)!
        return cls
    }
    
    /// Reuse cell with nibClass and bundle. (Swift)
    /// - Parameters:
    ///   - nibClass: Nib class
    ///   - bundle: Bundle
    /// - Returns: A cell instance
    func dequeueReusableCell<T: UITableViewCell>(nibClass: T.Type, bundle: Bundle = .main) -> T {
        let className = String(className(nibClass).split(separator: ".").last ?? "")
        let cell = dequeueReusableCell(withIdentifier: className) ?? bundle.loadNibNamed(className, owner: nil, options: nil)?.first
        return cell as! T
    }
    
    /// Reuse Cell with any class with bundle. (Swift)
    /// - Parameters:
    ///   - anyClass: Any cell class
    ///   - bundle: Bundle
    /// - Returns: A cell instance
    func dequeueReusableCell<T: UITableViewCell>(anyClass: T.Type, bundle: Bundle = .main) -> T {
        let className = className(anyClass)
        var cell = dequeueReusableCell(withIdentifier: className)
        if cell == nil {
            let cls = generateClass(name: className)
            let initClass = cls as! T.Type
            cell = initClass.init(style: .default, reuseIdentifier: className)
        }
        return cell as! T
    }
    
    /// Reuse header or footer with nib and bundle. (Swift)
    /// - Parameters:
    ///   - nibClass: Nib class
    ///   - bundle: Bundle
    /// - Returns: A header or footer instance
    func dequeueReusableHeaderFooterView<T: UIView>(nibClass: T.Type, bundle: Bundle = .main) -> T {
        let className = String(className(nibClass).split(separator: ".").last ?? "")
        let headerFooter = dequeueReusableHeaderFooterView(withIdentifier: className) ?? ((bundle.loadNibNamed(className, owner: nil, options: nil)?.first) as! UIView)
        return headerFooter as! T
    }
    
    /// Reuse header or footer with bundle. (Swift)
    /// - Parameters:
    ///   - anyClass: Any class
    ///   - bundle: Bundle
    /// - Returns: A header or footer instance
    func dequeueReusableHeaderFooterView<T: UITableViewHeaderFooterView>(anyClass: T.Type, bundle: Bundle = .main) -> T {
        let className = className(anyClass)
        var headerFooter:UIView? = dequeueReusableHeaderFooterView(withIdentifier: className)
        if headerFooter == nil {
            let cls = generateClass(name: className)
            let initClass = cls as! T.Type
            headerFooter = initClass.init(reuseIdentifier: className)
        }
        return headerFooter as! T
    }
}
