//
//  HomeVC.swift
//  AUTOMATION
//
//  Created by austin on 5/23/18.
//  Copyright © 2018 austin. All rights reserved.

//
import WatchConnectivity
import UIKit
//Alamofire.request(.GET,)

class HomeVC: UIViewController{
   
    

    var session: WCSession!

    override func viewDidLoad() {
        super.viewDidLoad()
//        if(WCSession.isSupported()){
//            self.session = WCSession.default
//            self.session.delegate = self
//            self.session.activate()
//        }
    }
    @IBOutlet weak var watchMessage: UILabel!
    @IBAction func tempButton(_ sender: UITapGestureRecognizer) {
        // send message to watch
        session.sendMessage(["a": "hello"], replyHandler: nil, errorHandler: nil)
    }
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        // receive messages from watch
        self.watchMessage.text = message["b"]! as? String
    }
    
    @IBAction func lightSwitch(_ sender: Any) { // THE LIGHT SWITCH (GET)
        print("light Switch works")
        guard let url = URL(string: "http://192.168.1.107:9898/A7000") else { return }
        
        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, eRRor) in
            if let response = response {
                print(response)
                print("response is working")
            }
            if let data = data {
//                print (data)
                print("data is working")
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    print(json)
                } catch {
                    print(error)
                }
            }
        }.resume()
    }
    @IBAction func powerSwitch(_ sender: Any) { // THE POWER SWITCH (POST)
        guard let url = URL(string: "http://192.168.1.107:9898/A7001") else { return }
        
        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, eRRor) in
            if let response = response {
//                print(response)
                print("response is working")
            }
            if let data = data {
//                print (data)
                print("data is working")
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    print(json)
                } catch {
                    print(error)
                }
            }
            }.resume()
    }
    @IBAction func fanSwtich(_ sender:  Any) { // fan switch
        guard let url = URL(string: "http://192.168.1.107:9898/A4001") else { return }
        
        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, eRRor) in
            if let response = response {
//                print(response)
                print("fan is working")
            }
            if let data = data {
                
                print("data is working")
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    print(json)
                } catch {
                    print(error)
                }
            }
            }.resume()
    }
    @IBAction func power2Switch(_ sender: Any) { // power 2 switch
        guard let url = URL(string: "http://192.168.1.107:9898/A4000") else { return }
        
        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, eRRor) in
            if let response = response {
                print(response)
                print("response is working")
            }
            if let data = data {
                print (data)
                print("data is working")
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    print(json)
                } catch {
                    print(error)
                }
            }
            }.resume()
    }
    @IBAction func garageSwitch(_ sender: UITapGestureRecognizer) {
    }

    
    @objc func labelGarage(recignizer:UIGestureRecognizer) {
        print("Label taped")
        guard let url = URL(string: "http://192.168.1.149:9898/A7000") else { return }
        
        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, eRRor) in
            if let response = response {
                print(response)
                print("response is working")
            }
            if let data = data {
                print (data)
                print("data is working")
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    print(json)
                } catch {
                    print(error)
                }
            }
            }.resume()
    }
 
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
