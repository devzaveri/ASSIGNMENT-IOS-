//
//  ViewControllerforData.swift
//  API Assignment
//
//  Created by promact on 06/03/23.
//

import UIKit
import SystemConfiguration




class ViewControllerforData: UIViewController {

    var datas = [NameOfApi]()
    var datas2 = [jsonStructsFor7rdAPI]()
    var datas3 = [jsonStructsFor8rdAPI]()
    
    var arrJsonStructs = [jsonStructs]()
    var arrData:jsonStructs?
    
    var arrJsonStructs3 = [jsonStructsFor3rdAPI]()
    var arrData3:jsonStructsFor3rdAPI?
    
    var arrJsonStructs4 = [jsonStructsFor4rdAPI]()
    var arrData4:jsonStructsFor4rdAPI?
    
    var arrJsonStructs5 = [jsonStructsFor5rdAPI]()
    var arrData5:jsonStructsFor5rdAPI?
    
    var arrJsonStructs6 = [jsonStructsFor6rdAPI]()
    var arrData6:jsonStructsFor6rdAPI?
    
    var arrJsonStructs9 = [jsonStructsFor9rdAPI]()
    var arrData9:jsonStructsFor9rdAPI?
    
    var arrJsonStructs10 = [jsonStructsFor10rdAPI]()
    var arrData10:jsonStructsFor10rdAPI?
    
    var arrJsonStructs11 = [jsonStructsFor11rdAPI]()
    var arrData11:jsonStructsFor11rdAPI?
    
    var arrJsonStructs12 = [jsonStructsFor12rdAPI]()
    var arrData12:jsonStructsFor12rdAPI?
    
    var tag = 0
    
    @IBOutlet weak var tableViewForData: UITableView!
    
    
    func saveData() {
        if (try? JSONEncoder().encode(datas)) != nil {
            
        }
      
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        switch tag {
        case 0 :
            fetchData()
            
            break
        case 1 :
            getData()
            
            break
        case 2:
            getDataFor3rdURl()
            
        case 3:
            getDataFor4rdURl()
    
        case 4:
            getDataFor5rdURl()
            
        case 5:
            getDataFor6rdURl()
            
        case 6:
            getDataFor7rdURl()
            
        case 7:
            getDatafrom8thURL()
           
        case 8:
            getDataFor9rdURl()
            
        case 9 :
            getDataFor10rdURl()
            
        case 10:
            getDataFor11rdURl()
            
        case 11:
            getDataFor12rdURl()
            
        default :
            break
        }
        
    }
    
    func fetchData() {
        if isConnectedToNetwork() {
            DispatchQueue.main.async {
                self.showActivityIndicator()
                   }
            let url = URL(string: "https://api.publicapis.org/entries")
            
            let dataTask = URLSession.shared.dataTask(with: url!, completionHandler: { (data , response , error) in
                DispatchQueue.main.async {
                    self.hideActivityIndicator()
                           }
                guard let data = data , error == nil else {
                    print("Error fetching data from API: \(error?.localizedDescription ?? "unknown error")")
                    return
                }
                
                var apiData: arr?
                do {
                    apiData = try JSONDecoder().decode(arr.self, from: data)
                    self.datas = apiData!.entries
                    
                    let jsonData = try JSONEncoder().encode(apiData)
                    UserDefaults.standard.set(jsonData, forKey: "myColor")
                    
                } catch {
                    print("Error decoding API data: \(error)")
                }
                
                DispatchQueue.main.async {
                    self.tableViewForData.reloadData()
                }
            })
            
            dataTask.resume()
        } else {
            if let storedData = UserDefaults.standard.object(forKey: "myColor") as? Data {
                do {
                    let apiData = try JSONDecoder().decode(arr.self, from: storedData)
                    self.datas = apiData.entries
                    // Use the retrieved data as needed
                } catch {
                    print("Error decoding stored API data: \(error)")
                }
            } else {
                print("No stored API data found")
            }
        }
        
    }

    
    func getData(){
        
        if isConnectedToNetwork() {
            DispatchQueue.main.async {
                self.showActivityIndicator()
            }
            let url = URL(string: "https://catfact.ninja/fact")
            URLSession.shared.dataTask(with: url!, completionHandler: { [self]
                (data , response , error) in
                DispatchQueue.main.async {
                    hideActivityIndicator()
                }
                
                UserDefaults.standard.set(data, forKey: "myCatt")
                do{
                    if let data = data {
                        self.arrData = try JSONDecoder().decode(jsonStructs.self, from: data)
                        if let unwrappedArrData = self.arrData {
                            print(unwrappedArrData.fact!, " : ", unwrappedArrData.length!)
                            self.arrJsonStructs.append(self.arrData!)
                            do {
                                let jsonData = try JSONEncoder().encode(arrJsonStructs.self)
                                print(jsonData)
                                UserDefaults.standard.set(jsonData, forKey: "myCat")
                               
                            } catch {
                                print("Error encoding API data as JSON: \(error)")
                            }
                           
                        }
                    }
                    
                }catch{
                    print("error")
                }
                DispatchQueue.main.async {
                    self.tableViewForData.reloadData()
                }
            }
            ).resume()
        } else {
            if let storedData = UserDefaults.standard.object(forKey: "myCat") as? Data {
                
                do {
                    self.arrJsonStructs = [jsonStructs]()
                    let apiData = try JSONDecoder().decode([jsonStructs].self, from: storedData)
                    self.arrJsonStructs = apiData
                } catch {
                    print("Error decoding stored API data: \(error)")
                }
            } else {
                print("No stored API data found")
            }
            
        }
        
    }
    
    
    func getDataFor3rdURl(){
        
        if isConnectedToNetwork() {
            DispatchQueue.main.async {
                self.showActivityIndicator()
            }
            let url = URL(string: "https://api.coindesk.com/v1/bpi/currentprice.json")
            URLSession.shared.dataTask(with: url!, completionHandler: {
                (data , response , error) in
                DispatchQueue.main.async {
                    self.hideActivityIndicator()
                }
                
                do{
                    if let data = data {
                        self.arrData3 = try JSONDecoder().decode(jsonStructsFor3rdAPI.self, from: data)
                        if let unwrappedArrData = self.arrData3 {
                            print(unwrappedArrData.chartName!, " : ", unwrappedArrData.disclaimer!)
                            self.arrJsonStructs3.append(self.arrData3!)
                            do {
                                let jsonData = try JSONEncoder().encode(self.arrJsonStructs3)
                                print(jsonData)
                                UserDefaults.standard.set(jsonData, forKey: "myCat2")
                            } catch {
                                print("Error encoding API data as JSON: \(error)")
                            }
                        }
                    }
                }catch{
                    print("error")
                }
                DispatchQueue.main.async {
                    self.tableViewForData.reloadData()
                }
            }
            ).resume()
        } else
        {
            if let storedData = UserDefaults.standard.object(forKey: "myCat2") as? Data {
                do {
                    self.arrJsonStructs3 = [jsonStructsFor3rdAPI]()
                    let apiData = try JSONDecoder().decode([jsonStructsFor3rdAPI].self, from: storedData)
                    self.arrJsonStructs3 = apiData
                    // Use the retrieved data as needed
                } catch {
                    print("Error decoding stored API data: \(error)")
                }
            } else {
                print("No stored API data found")
            }
        }
        
        
    }
    
    
    
    func getDataFor4rdURl(){
        if isConnectedToNetwork() {
            DispatchQueue.main.async {
                self.showActivityIndicator()
            }
            let url = URL(string: "https://www.boredapi.com/api/activity")
            URLSession.shared.dataTask(with: url!, completionHandler: {
                (data , response , error) in
                DispatchQueue.main.async {
                    self.hideActivityIndicator()
                }
                do{
                    if let data = data {
                        self.arrData4 = try JSONDecoder().decode(jsonStructsFor4rdAPI.self, from: data)
                        if let unwrappedArrData = self.arrData4 {
                            print(unwrappedArrData.type!, " : ", unwrappedArrData.activity!)
                            self.arrJsonStructs4.append(self.arrData4!)
                            do {
                                let jsonData = try JSONEncoder().encode(self.arrJsonStructs4)
                                print(jsonData)
                                UserDefaults.standard.set(jsonData, forKey: "myCat3")
                            } catch {
                                print("Error encoding API data as JSON: \(error)")
                            }
                        }
                    }
                }catch{
                    print("error")
                }
                DispatchQueue.main.async {
                    self.tableViewForData.reloadData()
                }
            }
            ).resume()
        } else
        {
            if let storedData = UserDefaults.standard.object(forKey: "myCat3") as? Data {
                do {
                    self.arrJsonStructs4 = [jsonStructsFor4rdAPI]()
                    let apiData = try JSONDecoder().decode([jsonStructsFor4rdAPI].self, from: storedData)
                    self.arrJsonStructs4 = apiData
                    // Use the retrieved data as needed
                } catch {
                    print("Error decoding stored API data: \(error)")
                }
            } else {
                print("No stored API data found")
            }
        }
        
    }
    
    
    
    func getDataFor5rdURl(){
        if isConnectedToNetwork() {
            DispatchQueue.main.async {
                self.showActivityIndicator()
            }
            let url = URL(string: "https://api.agify.io/?name=meelad")
            URLSession.shared.dataTask(with: url!, completionHandler: {
                (data , response , error) in
                DispatchQueue.main.async {
                    self.hideActivityIndicator()
                }
                do{
                    if let data = data {
                        self.arrData5 = try JSONDecoder().decode(jsonStructsFor5rdAPI.self, from: data)
                        if let unwrappedArrData = self.arrData5 {
                            print(unwrappedArrData.name!, " : ", unwrappedArrData.age!)
                            self.arrJsonStructs5.append(self.arrData5!)
                            do {
                                let jsonData = try JSONEncoder().encode(self.arrJsonStructs5)
                                print(jsonData)
                                UserDefaults.standard.set(jsonData, forKey: "myCat4")
                            } catch {
                                print("Error encoding API data as JSON: \(error)")
                            }
                        }
                    }
                }catch{
                    print("error")
                }
                DispatchQueue.main.async {
                    self.tableViewForData.reloadData()
                }
            }
            ).resume()
        } else
        {
            if let storedData = UserDefaults.standard.object(forKey: "myCat4") as? Data {
                do {
                    self.arrJsonStructs5 = [jsonStructsFor5rdAPI]()
                    let apiData = try JSONDecoder().decode([jsonStructsFor5rdAPI].self, from: storedData)
                    self.arrJsonStructs5 = apiData
                    // Use the retrieved data as needed
                } catch {
                    print("Error decoding stored API data: \(error)")
                }
            } else {
                print("No stored API data found")
            }
        }
    }
    
    
    
    func getDataFor6rdURl(){
        if isConnectedToNetwork() {
            DispatchQueue.main.async {
                self.showActivityIndicator()
            }
            let url = URL(string: "https://api.genderize.io?name=luc")
            URLSession.shared.dataTask(with: url!, completionHandler: {
                (data , response , error) in
                DispatchQueue.main.async {
                    self.hideActivityIndicator()
                }
                do{
                    if let data = data {
                        self.arrData6 = try JSONDecoder().decode(jsonStructsFor6rdAPI.self, from: data)
                        if let unwrappedArrData = self.arrData6 {
                            print(unwrappedArrData.name!, " : ", unwrappedArrData.gender!)
                            self.arrJsonStructs6.append(self.arrData6!)
                            do {
                                let jsonData = try JSONEncoder().encode(self.arrJsonStructs6)
                                print(jsonData)
                                UserDefaults.standard.set(jsonData, forKey: "myCat5")
                            } catch {
                                print("Error encoding API data as JSON: \(error)")
                            }
                        }
                    }
                }catch{
                    print("error")
                }
                DispatchQueue.main.async {
                    self.tableViewForData.reloadData()
                }
            }
            ).resume()
        } else
        {
            if let storedData = UserDefaults.standard.object(forKey: "myCat5") as? Data {
                do {
                    self.arrJsonStructs6 = [jsonStructsFor6rdAPI]()
                    let apiData = try JSONDecoder().decode([jsonStructsFor6rdAPI].self, from: storedData)
                    self.arrJsonStructs6 = apiData
                    // Use the retrieved data as needed
                } catch {
                    print("Error decoding stored API data: \(error)")
                }
            } else {
                print("No stored API data found")
            }
        }
        
    }
    
    
    func getDataFor7rdURl() {
        if isConnectedToNetwork() {
            DispatchQueue.main.async {
                self.showActivityIndicator()
            }
            let url = URL(string: "https://api.nationalize.io/?name=nathaniel")
            let dataTask = URLSession.shared.dataTask(with: url!, completionHandler: {
                (data , response , error) in
                DispatchQueue.main.async {
                    self.hideActivityIndicator()
                }
                guard let data = data , error == nil else
                {
                    print("error")
                    return
                }

                var apiData:arr2?
                do {
                    apiData = try JSONDecoder().decode(arr2.self, from: data)
                    self.datas2 = apiData!.country
                    do {
                        let jsonData = try JSONEncoder().encode(apiData)
                        UserDefaults.standard.set(jsonData, forKey: "myColor2")
                    } catch {
                        print("Error encoding API data as JSON: \(error)")
                    }
                }
                catch {
                    print("error \(error)")
                }

                
                print(self.datas2)
                DispatchQueue.main.async {
                    self.tableViewForData.reloadData()
                }

            })
            dataTask.resume()
        } else
        {
            if let storedData = UserDefaults.standard.object(forKey: "myColor2") as? Data {
                do {
                    let apiData = try JSONDecoder().decode(arr2.self, from: storedData)
                    self.datas2 = apiData.country
                    // Use the retrieved data as needed
                } catch {
                    print("Error decoding stored API data: \(error)")
                }
            } else {
                print("No stored API data found")
            }
        }
        
    }
    
    
    func getDatafrom8thURL() {
        if isConnectedToNetwork() {
            DispatchQueue.main.async {
                self.showActivityIndicator()
            }
            let url = URL(string: "https://datausa.io/api/data?drilldowns=Nation&measures=Population")
            let dataTask = URLSession.shared.dataTask(with: url!, completionHandler: {
                (data , response , error) in
                DispatchQueue.main.async {
                    self.hideActivityIndicator()
                }
                guard let data = data , error == nil else
                {
                    print("error")
                    return
                }

                var apiData:arr3?
                do {
                    apiData = try JSONDecoder().decode(arr3.self, from: data)
                    self.datas3 = apiData!.data
                    do {
                        let jsonData = try JSONEncoder().encode(apiData)
                        UserDefaults.standard.set(jsonData, forKey: "myColor3")
                    } catch {
                        print("Error encoding API data as JSON: \(error)")
                    }
                }
                catch {
                    print("error \(error)")
                }

                self.datas3 = apiData!.data
                print(self.datas3)
                DispatchQueue.main.async {
                    self.tableViewForData.reloadData()
                }

            })
            dataTask.resume()
         
        } else
        {
            if let storedData = UserDefaults.standard.object(forKey: "myColor3") as? Data {
                do {
                    let apiData = try JSONDecoder().decode(arr3.self, from: storedData)
                    self.datas3 = apiData.data
                    // Use the retrieved data as needed
                } catch {
                    print("Error decoding stored API data: \(error)")
                }
            } else {
                print("No stored API data found")
            }
        }
        
    }
    
    
    
    func getDataFor9rdURl(){
        if isConnectedToNetwork() {
            DispatchQueue.main.async {
                self.showActivityIndicator()
            }
            let url = URL(string: "https://dog.ceo/api/breeds/image/random")
            URLSession.shared.dataTask(with: url!, completionHandler: {
                (data , response , error) in
                DispatchQueue.main.async {
                    self.hideActivityIndicator()
                }
                do{
                    if let data = data {
                        self.arrData9 = try JSONDecoder().decode(jsonStructsFor9rdAPI.self, from: data)
                        if let unwrappedArrData = self.arrData9 {
                            print(unwrappedArrData.message!, " : ", unwrappedArrData.status!)
                            self.arrJsonStructs9.append(self.arrData9!)
                            do {
                                let jsonData = try JSONEncoder().encode(self.arrJsonStructs9)
                                print(jsonData)
                                UserDefaults.standard.set(jsonData, forKey: "myCat9")
                            } catch {
                                print("Error encoding API data as JSON: \(error)")
                            }
                        }
                    }
                }catch{
                    print("error")
                }
                DispatchQueue.main.async {
                    self.tableViewForData.reloadData()
                }
            }
            ).resume()
        } else
        {
            if let storedData = UserDefaults.standard.object(forKey: "myCat9") as? Data {
                do {
                    self.arrJsonStructs9 = [jsonStructsFor9rdAPI]()
                    let apiData = try JSONDecoder().decode([jsonStructsFor9rdAPI].self, from: storedData)
                    self.arrJsonStructs9 = apiData
                    // Use the retrieved data as needed
                } catch {
                    print("Error decoding stored API data: \(error)")
                }
            } else {
                print("No stored API data found")
            }
        }
        
    }
    
    
    func getDataFor10rdURl(){
        if isConnectedToNetwork() {
            DispatchQueue.main.async {
                self.showActivityIndicator()
            }
            let url = URL(string: "https://api.ipify.org/?format=json")
            URLSession.shared.dataTask(with: url!, completionHandler: {
                (data , response , error) in
                DispatchQueue.main.async {
                    self.hideActivityIndicator()
                }
                do{
                    if let data = data {
                        self.arrData10 = try JSONDecoder().decode(jsonStructsFor10rdAPI.self, from: data)
                        if let unwrappedArrData = self.arrData10 {
                            print(unwrappedArrData.ip)
                            self.arrJsonStructs10.append(self.arrData10!)
                            do {
                                let jsonData = try JSONEncoder().encode(self.arrJsonStructs10)
                                print(jsonData)
                                UserDefaults.standard.set(jsonData, forKey: "myCat10")
                            } catch {
                                print("Error encoding API data as JSON: \(error)")
                            }

                        }
                    }
                }catch{
                    print("error")
                }
                DispatchQueue.main.async {
                    self.tableViewForData.reloadData()
                }
            }
            ).resume()
        } else
        {
            if let storedData = UserDefaults.standard.object(forKey: "myCat10") as? Data {
                do {
                    self.arrJsonStructs10 = [jsonStructsFor10rdAPI]()
                    let apiData = try JSONDecoder().decode([jsonStructsFor10rdAPI].self, from: storedData)
                    self.arrJsonStructs10 = apiData
                    // Use the retrieved data as needed
                } catch {
                    print("Error decoding stored API data: \(error)")
                }
            } else {
                print("No stored API data found")
            }
        }
        
    
    }
    
    
    func getDataFor11rdURl(){
        if isConnectedToNetwork() {
            DispatchQueue.main.async {
                self.showActivityIndicator()
            }
            let url = URL(string: "https://ipinfo.io/161.185.160.93/geo")
            URLSession.shared.dataTask(with: url!, completionHandler: {
                (data , response , error) in
                DispatchQueue.main.async {
                    self.hideActivityIndicator()
                }
                do{
                    if let data = data {
                        self.arrData11 = try JSONDecoder().decode(jsonStructsFor11rdAPI.self, from: data)
                        if let unwrappedArrData = self.arrData11 {
                            print(unwrappedArrData.ip!)
                            self.arrJsonStructs11.append(self.arrData11!)
                            do {
                                let jsonData = try JSONEncoder().encode(self.arrJsonStructs11)
                                print(jsonData)
                                UserDefaults.standard.set(jsonData, forKey: "myCat11")
                            } catch {
                                print("Error encoding API data as JSON: \(error)")
                            }

                        }
                    }
                }catch{
                    print("error")
                }
                DispatchQueue.main.async {
                    self.tableViewForData.reloadData()
                }
            }
            ).resume()
        } else
        {
            if let storedData = UserDefaults.standard.object(forKey: "myCat11") as? Data {
                do {
                    self.arrJsonStructs11 = [jsonStructsFor11rdAPI]()
                    let apiData = try JSONDecoder().decode([jsonStructsFor11rdAPI].self, from: storedData)
                    self.arrJsonStructs11 = apiData
                    // Use the retrieved data as needed
                } catch {
                    print("Error decoding stored API data: \(error)")
                }
            } else {
                print("No stored API data found")
            }
        }
        
    }
    
    
    func getDataFor12rdURl(){
        if isConnectedToNetwork() {
            DispatchQueue.main.async {
                self.showActivityIndicator()
            }
            let url = URL(string: "https://official-joke-api.appspot.com/random_joke")
            URLSession.shared.dataTask(with: url!, completionHandler: {
                (data , response , error) in
                DispatchQueue.main.async {
                    self.hideActivityIndicator()
                }
                do{
                    if let data = data {
                        self.arrData12 = try JSONDecoder().decode(jsonStructsFor12rdAPI.self, from: data)
                        if let unwrappedArrData = self.arrData12 {
                            print(unwrappedArrData.type! , ":" , unwrappedArrData.setup! )
                            self.arrJsonStructs12.append(self.arrData12!)
                            do {
                                let jsonData = try JSONEncoder().encode(self.arrJsonStructs12)
                                print(jsonData)
                                UserDefaults.standard.set(jsonData, forKey: "myCat12")
                            } catch {
                                print("Error encoding API data as JSON: \(error)")
                            }

                        }
                    }
                }catch{
                    print("error")
                }
                DispatchQueue.main.async {
                    self.tableViewForData.reloadData()
                }
            }
            ).resume()
        } else
        {
            if let storedData = UserDefaults.standard.object(forKey: "myCat12") as? Data {
                do {
                    self.arrJsonStructs12 = [jsonStructsFor12rdAPI]()
                    let apiData = try JSONDecoder().decode([jsonStructsFor12rdAPI].self, from: storedData)
                    self.arrJsonStructs12 = apiData
                    // Use the retrieved data as needed
                } catch {
                    print("Error decoding stored API data: \(error)")
                }
            } else {
                print("No stored API data found")
            }
        }
        
       
    }
    
    
    func isConnectedToNetwork() -> Bool {
        var zeroAddress = sockaddr_in()
        zeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
        zeroAddress.sin_family = sa_family_t(AF_INET)
        
        guard let defaultRouteReachability = withUnsafePointer(to: &zeroAddress, {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {
                SCNetworkReachabilityCreateWithAddress(nil, $0)
            }
        }), var flags: SCNetworkReachabilityFlags = SCNetworkReachabilityFlags(rawValue: 0) as SCNetworkReachabilityFlags?, SCNetworkReachabilityGetFlags(defaultRouteReachability, &flags) else {
            return false
        }
        
        return flags.contains(.reachable) && !flags.contains(.connectionRequired)
    }
    func showActivityIndicator() {
        let activityView = UIActivityIndicatorView(style: .large)

        activityView.center = self.view.center
        self.view.addSubview(activityView)
        activityView.startAnimating()
    }

    func hideActivityIndicator() {
        for view in self.view.subviews {
            if let activityView = view as? UIActivityIndicatorView {
                activityView.stopAnimating()
//                activityView.removeFromSuperview()
            }
        }
    }

  
}



extension ViewControllerforData: UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch tag {
           case 0:
               return datas.count
           case 1:
               return arrJsonStructs.count
        case 2:
            return arrJsonStructs3.count
        case 3:
            return arrJsonStructs4.count
        case 4:
            return arrJsonStructs5.count
        case 5:
            return arrJsonStructs6.count
        case 6:
            return datas2.count
        case 7:
            return datas3.count
        case 8:
            return arrJsonStructs9.count
        case 9:
            return arrJsonStructs10.count
        case 10:
            return arrJsonStructs11.count
        case 11:
            return arrJsonStructs12.count
           default:
               return 0
           }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewForData.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! addDataTableViewCell
        
        switch tag {
        case 0 :
            
            if datas[indexPath.row].Description != nil {
                cell.lbl2.text = datas[indexPath.row].Description!
            } else {
                cell.lbl2.text = "empty"
            }
            
            cell.lbl1.text = datas[indexPath.row].API
            UserDefaults.standard.object(forKey: "datas") as? [NameOfApi]
            break
            
        case 1:
            
            if arrJsonStructs[indexPath.row].fact != nil {
                cell.lbl2.text = arrJsonStructs[indexPath.row].fact!
            } else {
                cell.lbl2.text = "empty"
            }
            
            cell.lbl1.text = String(arrJsonStructs[indexPath.row].length ?? 0)
            
            break
        
        case 2:
            if arrJsonStructs3[indexPath.row].chartName != nil {
                cell.lbl2.text = arrJsonStructs3[indexPath.row].chartName!
            } else {
                cell.lbl2.text = "empty"
            }
            
            cell.lbl1.text = arrJsonStructs3[indexPath.row].disclaimer
            
            break
        case 3:
            if arrJsonStructs4[indexPath.row].type != nil {
                cell.lbl2.text = arrJsonStructs4[indexPath.row].type!
            } else {
                cell.lbl2.text = "empty"
            }
            
            cell.lbl1.text = arrJsonStructs4[indexPath.row].activity
            break
        case 4:
            if arrJsonStructs5[indexPath.row].name != nil {
                cell.lbl2.text = arrJsonStructs5[indexPath.row].name!
            } else {
                cell.lbl2.text = "empty"
            }
            
            cell.lbl1.text = String(arrJsonStructs5[indexPath.row].age ?? 0)
            break
        case 5:
            if arrJsonStructs6[indexPath.row].name != nil {
                cell.lbl2.text = arrJsonStructs6[indexPath.row].gender
            } else {
                cell.lbl2.text = "Empty"
            }
            
            cell.lbl1.text = arrJsonStructs6[indexPath.row].name
        case 6:
            
            if datas2[indexPath.row].probability != nil {
                cell.lbl2.text = String(datas2[indexPath.row].probability!)
            } else {
                cell.lbl2.text = "empty"
            }
            
            cell.lbl1.text = datas2[indexPath.row].country_id
            
        case 7:
            if datas3[indexPath.row].Population != nil {
                cell.lbl2.text = String(datas3[indexPath.row].Population!)
            } else {
                cell.lbl2.text = "empty"
            }
            
            cell.lbl1.text = datas3[indexPath.row].Nation
            
        case 8:
            if arrJsonStructs9[indexPath.row].status != nil {
                cell.lbl2.text = String(arrJsonStructs9[indexPath.row].status!)
            } else {
                cell.lbl2.text = "empty"
            }
            
            cell.lbl1.text = arrJsonStructs9[indexPath.row].message
        case 9:
//            if arrJsonStructs10[indexPath.row].status != nil {
//                cell.lbl2.text = String(arrJsonStructs9[indexPath.row].status!)
//            } else {
//                cell.lbl2.text = "empty"
//            }
            
            cell.lbl1.text = arrJsonStructs10[indexPath.row].ip
        case 10:
            if arrJsonStructs11[indexPath.row].ip != nil {
                cell.lbl2.text = String(arrJsonStructs11[indexPath.row].ip!)
            } else {
                cell.lbl2.text = "empty"
            }
            
            cell.lbl1.text = arrJsonStructs11[indexPath.row].region
        case 11:
            if arrJsonStructs12[indexPath.row].setup != nil {
                cell.lbl2.text = String(arrJsonStructs12[indexPath.row].setup!)
            } else {
                cell.lbl2.text = "empty"
            }
            
            cell.lbl1.text = arrJsonStructs12[indexPath.row].type
        default:
            break
        }
        
        
        return cell
    }
 
}



