//
//  UICollectionView+Extensions.swift
//  AbsherInterior
//
//  Created by Ahmed Abdelkarim on 01/10/2021.
//

import UIKit
import MOLH

extension UICollectionView {
    func registerCell<Cell: UICollectionViewCell>(ofType: Cell.Type) {
        self.register(UINib(nibName: String(describing: Cell.self), bundle: nil), forCellWithReuseIdentifier: String(describing: Cell.self))
    }
    
    func dequeueCell<Cell: UICollectionViewCell>(for indexPath: IndexPath) -> Cell {
        let identifier = String(describing: Cell.self)
        
        guard let cell = self.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as? Cell else {
            fatalError("Error in cell")
        }
        
        return cell
    }
    
    /// Changes the flow layout to be aligned with currently selected language.
    func localizeFlowLayout() {
        self.collectionViewLayout = LocalizedCollectionFlowLayout()
    }
}

/// Makes the collection view suitable for currently selected language.
class LocalizedCollectionFlowLayout: UICollectionViewFlowLayout {
    //MARK: - Attributes
    @IBInspectable var horizontalScrolling: Bool = true {
        didSet {
            self.scrollDirection = horizontalScrolling ? .horizontal : .vertical
        }
    }
    
    //MARK: - Init
    override init() {
        super.init()
        setDefaultAppearance()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setDefaultAppearance()
    }
    
    //MARK: - Private Functions
    private func setDefaultAppearance() {
        self.scrollDirection = horizontalScrolling ? .horizontal : .vertical
    }
    
    //MARK: - Overrides
    override var flipsHorizontallyInOppositeLayoutDirection: Bool {
        // set based on language (true if Arabic, false if English)
        return MOLHLanguage.isArabic()
    }
}
