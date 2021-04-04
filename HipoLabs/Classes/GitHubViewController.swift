//
//  GitHubViewController.swift
//  HipoLabs
//
//  Created by bahadir on 31.03.2021.
//

import UIKit
import WebKit

class GitHubViewController: UIViewController, WKNavigationDelegate, WKUIDelegate {

    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var topLogoImage: UIImageView!
    var activityIndicator: UIActivityIndicatorView!
    
    var githubName: String = ""
    var url: String = ""
   
    override func viewDidLoad() {
        super.viewDidLoad()

        webView.navigationDelegate = self
        webView.uiDelegate = self
        loadGitHub()
    }
    
    func initializer(github: String) {
        self.githubName = github
    }
    
    @IBAction func backButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
   private func loadGitHub(){
        topLogoImage.image = UIImage(named: "logohipo")
        url = "https://github.com/\(githubName)"
        setupUI(url: url)
    }
    @IBAction func hipoBttnClicked(_ sender: UIButton) {
        let hipoURL = "https://hipolabs.com"
        if url != hipoURL {
            topLogoImage.image = UIImage(named: "github3")
            url = "https://hipolabs.com"
            setupUI(url: url)
        } else {
            topLogoImage.image = UIImage(named: "logohipo")
            url = "https://github.com/\(githubName)"
            setupUI(url: url)
        }
    }
    
    
   private func setupUI(url: String){
        
        activityIndicator = UIActivityIndicatorView()
        activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = true
        
        if #available(iOS 13.0, *) {
            activityIndicator.style = UIActivityIndicatorView.Style.large
            activityIndicator.color = UIColor(red: 218/255, green: 0/255, blue: 42/255, alpha: 1.0)
                } else { activityIndicator.style = .gray }
        view.addSubview(activityIndicator)
        let url = URL(string: url)
        self.webView.load(URLRequest(url: url!))
    }
    
   private func showActivityIndicator(show: Bool) {
          if show {
              activityIndicator.startAnimating()
          } else {
              activityIndicator.stopAnimating()
          }
      }

      func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
          showActivityIndicator(show: false)
      }

      func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
          showActivityIndicator(show: true)
      }

      func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
          showActivityIndicator(show: false)
      }
}
