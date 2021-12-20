//
//  MovieViewController.swift
//  WalmartLastMileMobileTeam
//
//  Created by Home on 12/14/21.
//

import UIKit

class MovieViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{

    let vm = MovieViewModel()
    @IBOutlet weak var tblView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        getMovies()
        getGenres()
        vm.registerNib(tableView: tblView)
    }
    func getMovies(){
        vm.getData{ [weak self] in
            let error = self?.vm.getError()
            if error != nil{
                DispatchQueue.main.async {
                    //show Alert
                    print(error?.localizedDescription ?? "na")
                }
                return
            }
            DispatchQueue.main.async {
                self?.tblView.reloadData()
            }
        }
    }
    func getGenres(){
        vm.getGeneres(){
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         vm.arr.count
            }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifier) as? MovieTableViewCell
        
        let model = vm.arr[indexPath.row]
        let genresValue = vm.getGeneresInfo(arrayIDs: vm.getIDs(index: indexPath.row) ?? [])
        cell?.setUpData(imageUr: model.poster_path, mtitl: model.title, mGenr: genresValue, mpopularit: model.popularity, mReleaseDat: model.release_date)
        return cell ?? UITableViewCell()
    }
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if ((tblView.contentOffset.y + tblView.frame.size.height) >= tblView.contentSize.height)
        {
            getMovies()
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         let vc = self.storyboard?.instantiateViewController(identifier: Constants.movieDetailViewController) as? MovieDetailViewController
        vm.passData(indexPath: indexPath)
        present(vc!, animated: true, completion: nil)
       
    }
    
}
