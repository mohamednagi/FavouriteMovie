import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var MyImage: UIImageView!
    
    @IBOutlet weak var MyLabel: UILabel!
   

    @IBAction func LikeBu(_ sender: UIButton) {
        
        let newMovie = Movie(context: context)
        newMovie.name = MyLabel.text
        newMovie.image = MyImage.image
        ad.saveContext()
        
    }
    
}
