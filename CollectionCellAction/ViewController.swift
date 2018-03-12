import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collection_view: UICollectionView!
    @IBOutlet weak var txt_alltext: UITextView!
    private let cell_identifier = "Cell_Test"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.config_textView()
        self.config_collection()
    }
    
    private func config_textView()
    {
        self.txt_alltext.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        self.txt_alltext.text = ""
    }

    private func config_collection()
    {
        self.collection_view.delegate = self
        self.collection_view.dataSource = self
        self.collection_view.alwaysBounceVertical = true
        self.collection_view.register(UINib(nibName: self.cell_identifier,
                                            bundle: nil),
                                      forCellWithReuseIdentifier: self.cell_identifier)
        
        if let layout = self.collection_view.collectionViewLayout as? UICollectionViewFlowLayout
        {
            layout.scrollDirection = .vertical
            layout.minimumLineSpacing = 5
            layout.minimumInteritemSpacing = 5
        }
    }
    
    public func add_text(text: String)
    {
        self.txt_alltext.text = self.txt_alltext.text + " " + text
    }
}

extension ViewController: UICollectionViewDelegate,
                          UICollectionViewDataSource,
                          UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collection_view.dequeueReusableCell(withReuseIdentifier: self.cell_identifier,
                                                       for: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width, height: 70)
    }
}
