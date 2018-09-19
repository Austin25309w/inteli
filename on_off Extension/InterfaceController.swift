//
//  InterfaceController.swift
//  on_off Extension
//
//  Created by austin on 5/29/18.
//  Copyright © 2018 austin. All rights reserved.
//
import WatchConnectivity
import WatchKit
import Foundation


class InterfaceController: WKInterfaceController  {
    
    var session: WCSession!
    @IBOutlet var messageLabel: WKInterfaceLabel!
    @IBAction func sendMessageToWatch() {
        session.sendMessage(["b": "goodBye"], replyHandler: nil, errorHandler: nil)
    }
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        //receiving message from iphone
        self.messageLabel.setText(message["a"]! as? String)
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
//        if(WCSession.isSupported()) {
//            self.session = WCSession.default
//            self.session.delegate = self
//            self.session.activate()
//        }
    }
    
    
    
    @IBAction func onSwitch() {
        guard let url = URL(string: "http://192.168.1.103:9898/A7000") else { return }
        
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
    @IBAction func offSwitch() {
        guard let url = URL(string: "http://192.168.1.103:9898/A7001") else { return }
        
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
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
    }
    
    
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
