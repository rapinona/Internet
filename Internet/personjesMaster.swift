//
//  personjesMaster.swift
//  Internet
//
//  Created by Piñón Ayala Rodrigo  on 29/10/22.
//

import UIKit

class personjesMaster: UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    @IBOutlet var tablePersonajes: UITableView!
    
    var selectedPersonaje : Result?
    let personajesDM = PersonajesDataManager()
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return personajesDM.personajeCount()
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! cell
        
        let personaje = personajesDM.personajeAt(index: indexPath.row)
        
        cell.namePersonaje.text = personaje.name
        
        guard let myURL = URL(string:personaje.image) else { return cell}
        let myRequest = URLRequest(url: myURL)
        cell.personajeImage.load(myRequest)

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedPersonaje = personajesDM.personajeAt(index: indexPath.row)
        self.performSegue(withIdentifier: "detalles", sender: Self.self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! personajesDetail
        destination.recievedPersonaje = selectedPersonaje
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let ad = UIApplication.shared.delegate as! AppDelegate
        if ad.internetStatus {
            personajesDM.fetch {
                DispatchQueue.main.async {
                    self.tablePersonajes.reloadData()
                }
            }
        }
        else {
            let ac = UIAlertController(title:"Error", message:"Lo sentimos, pero al parecer no hay conexión a Internet", preferredStyle: .alert)
            let action = UIAlertAction(title: "Enterado", style: .default)
            ac.addAction(action)
            self.present(ac, animated: true)
        }
        
    }
    
}
