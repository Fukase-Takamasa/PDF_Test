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
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPDF()
        setupThumbnail()
        
        collectionView.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "Cell")
    }

}

extension ViewController {
    
    func setupPDF() {
        
        guard let path = Bundle.main.path(forResource: "pdf-sample1", ofType: "pdf") else {
            print("failed to get path.")
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
        thumbnailView.thumbnailSize = CGSize(width: 30, height: 40)
    }
    
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt
        indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        
        return cell
    }
    
}

