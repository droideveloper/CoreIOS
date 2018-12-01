//
//  CollectionDataSource.swift
//  MVPCocoa
//
//  Created by Fatih Şen on 1.12.2018.
//  Copyright © 2018 Open Source. All rights reserved.
//

import Foundation
import UIKit

open class CollectionDataSource<D: Equatable>: NSObject, UICollectionViewDataSource {
	
	public var dataSet: ObservableList<D>
	
	public init(dataSet: ObservableList<D>) {
		self.dataSet = dataSet
	}
	
	public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return dataSet.count
	}
	
	public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifierAt(indexPath), for: indexPath)
		bind(cell, dataSet.get(indexPath.row))
		return cell
	}
	
	open func bind(_ cell: UICollectionViewCell, _ item: D) {
		// override this
	}
	
	open func identifierAt(_ indexPath: IndexPath) -> String {
		return String.empty
	}
}
