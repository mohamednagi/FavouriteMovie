import UIKit
import CoreData

class SecondVC: UIViewController , UITableViewDataSource , UITableViewDelegate {
    
    @IBOutlet weak var SecondTableView: UITableView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        loadMovies()
    }
    
    func loadMovies (){
        let fetchRequest : NSFetchRequest<Movie> = Movie.fetchRequest()
        do{
            SecondArr = try context.fetch(fetchRequest)
            //SecondTableView.reloadData()
        }
        catch{
            print("error")
        }
    }
    
    var SecondArr = [Movie]()
    //  var namearr:[String] = []
    //  var imagearr:[String] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SecondArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! SecondTableViewCell
        /*  let defaults = UserDefaults.standard
         let name = defaults.object(forKey: "name") as! String
         let image = defaults.object(forKey: "image") as! String
         namearr.append(name)
         imagearr.append(image)
         let objec = SecondCell(title2: name, image2: image)
         SecondArr.append(objec)
         cell.Likedtitle.text = SecondArr[indexPath.row].title2
         cell.LikedImage.image =  UIImage(named:SecondArr[indexPath.row].image2)*/
        
        cell.setMovie(movie: SecondArr[indexPath.row])
        
        return cell
    }
    
    
    
    
    
  
    @IBAction func BackBu(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
}
