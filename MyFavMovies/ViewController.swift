import UIKit
import CoreData

class ViewController: UIViewController , UITableViewDelegate , UITableViewDataSource{

    @IBOutlet weak var MyTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        GettinData()
        MyTableView.reloadData()
        // ad.saveContext()
    }
    
    var firstname:String!
    var firstimage:String!
    var namearr:[String] = []
    var imagearr:[String] = []
    var arr:[FirstCell] = []{
        didSet{
            DispatchQueue.main.async {
                self.MyTableView.reloadData()
            }
        }
    }
    func GettinData(){
        let string = "http://api.themoviedb.org/3/movie/popular?api_key=dbbd139cd20c1999dffaa2eed72d5a86"
        guard let path = URL(string: string) else {return}
        URLSession.shared.dataTask(with: path) { (data, response, error) in
            if error == nil {
                do{
                    let json = try(JSONSerialization.jsonObject(with: data!, options: [])) as! [String:Any]
                    let results = json["results"] as! [[String:Any]]
                    for result in results {
                        self.firstname = (result["title"]!) as! String
                        self.namearr.append(self.firstname)
                        let photo = (result["poster_path"]!) as! String
                        self.firstimage = "http://image.tmdb.org/t/p/w780/\(photo)"
                        self.imagearr.append(self.firstimage)
                        let obj = FirstCell(title: self.firstname, image: self.firstimage)
                        self.arr.append(obj)
                    }
                }catch let err{
                    print("Error :  \(err)")
                }
            }
            }.resume()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.MyLabel.text = arr[indexPath.row].title
        let url = URL(string: (arr[indexPath.row].image))!
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil {
                print("ERROR")
            }else{
                DispatchQueue.main.async{
                    cell.MyImage.image = UIImage(data: data!)
                }
            }
            }.resume()
        return cell
    }
    
    @IBAction func FavBu(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "Next", sender: self)
    }
}

