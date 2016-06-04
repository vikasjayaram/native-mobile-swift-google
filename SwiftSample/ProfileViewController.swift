// ProfileViewController.swift
//
// Copyright (c) 2014 Auth0 (http://auth0.com)
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

import UIKit
import Lock
import AFNetworking

class ProfileViewController: UIViewController {

    @IBOutlet var profileImage: UIImageView!
    @IBOutlet var welcomeLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        let keychain = MyApplication.sharedInstance.keychain
        let profileData:NSData! = keychain.dataForKey("profile")
        let profile:A0UserProfile = NSKeyedUnarchiver.unarchiveObjectWithData(profileData) as! A0UserProfile
        self.profileImage.setImageWithURL(profile.picture)
        self.welcomeLabel.text = "Welcome \(profile.name)!"
    }

    @IBAction func callAPI(sender: AnyObject) {
        let request = buildAPIRequest()
        let session = NSURLSession.sharedSession()
        let dataTask = session.dataTaskWithRequest(request, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error)
            } else {
                let httpResponse = response as? NSHTTPURLResponse
                let dataString = String(data:(data)!, encoding: NSUTF8StringEncoding)
                print(dataString);
                print(httpResponse)
            }
        })
        
        dataTask.resume()
    }

    private func showMessage(message: String) {
        let alert = UIAlertView(title: message, message: nil, delegate: nil, cancelButtonTitle: "OK")
        alert.show()
    }

    private func buildAPIRequest() -> NSURLRequest {
        let info = NSBundle.mainBundle().infoDictionary!
        let urlString = info["SampleAPIBaseURL"] as! String
        let request = NSMutableURLRequest(URL: NSURL(string: urlString)!)
        let keychain = MyApplication.sharedInstance.keychain
        let token = keychain.stringForKey("id_token")!
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        return request
    }
}
