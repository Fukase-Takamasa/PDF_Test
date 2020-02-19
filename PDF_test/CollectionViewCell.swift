//
//  CollectionViewCell.swift
//  PDF_test
//
//  Created by 深瀬貴将 on 2020/02/19.
//  Copyright © 2020 深瀬 貴将. All rights reserved.
//

import UIKit
import PDFKit

class CollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var cellPdfView: PDFView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        setupCellPDFView()
    }
    
    func setupCellPDFView() {
        
        cellPdfView.autoScales = true
        cellPdfView.displayMode = .singlePage
        cellPdfView.displayDirection = .horizontal
        cellPdfView.displaysPageBreaks = true
    }

}
