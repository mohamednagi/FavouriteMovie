import UIKit

class SecondTableViewCell: UITableViewCell {

   
    @IBOutlet weak var LikedImage: UIImageView!
    
    @IBOutlet weak var LikedTitle: UILabel!
    
    func setMovie ( movie : Movie){
        LikedTitle.text = movie.name
      //  LikedImage.image = UIImage(named: movie.image! as! String)
        LikedImage.image = movie.image as? UIImage
    }
  

}
