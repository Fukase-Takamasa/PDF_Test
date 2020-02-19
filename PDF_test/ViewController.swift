//
//  ViewController.swift
//  PDF_test
//
//  Created by 深瀬 貴将 on 2020/02/19.
//  Copyright © 2020 深瀬 貴将. All rights reserved.
//

import UIKit
import PDFKit

class ViewController: UIViewController {
    
    @IBOutlet weak var thumbnailView: PDFThumbnailView!
    @IBOutlet weak var mainPDFView: PDFView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPDF()
        setupThumbnail()
    }

}

extension ViewController {
    
    func setupPDF() {
        
        guard let path = Bundle.main.path(forResource: "pdf-sample1", ofType: "pdf") else {
            print("failed to het path.")
            return
        }
        let pdfURL = URL(fileURLWithPath: path)
        guard let document = PDFDocument(url: pdfURL) else {
            return
        }
        
        mainPDFView.autoScales = true
        mainPDFView.displayMode = .singlePage
        mainPDFView.displayDirection = .horizontal
        mainPDFView.displaysPageBreaks = true
        mainPDFView.pageBreakMargins = UIEdgeInsets(top: 10.0, left: 20.0, bottom: 10.0, right: 20.0)
        mainPDFView.usePageViewController(true)
        mainPDFView.document = document
    }
    
    func setupThumbnail() {
        
        thumbnailView.pdfView = mainPDFView
        thumbnailView.layoutMode = .horizontal
        thumbnailView.backgroundColor = .gray
        thumbnailView.thumbnailSize = CGSize(width: 100, height: 200)
    }
    
}

