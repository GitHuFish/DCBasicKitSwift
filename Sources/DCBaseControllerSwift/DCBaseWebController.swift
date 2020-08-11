//
//  DCBaseWebController.swift
//  DCBasicKitSwift
//
//  Created by 杜才 on 2020/8/5.
//  Copyright © 2020 Zhongyuan. All rights reserved.
//

// TODO: 添加 JS 交互及回调
// TODO: 加载完成回调
// TODO: 开始加载回调
// TODO: 拦截请求
// TODO: Cache

import UIKit
import WebKit

open class DCBaseWebController: DCBaseViewController, WKNavigationDelegate, WKUIDelegate, WKScriptMessageHandler {
    
    var webStartY: CGFloat = 0.0
    
    deinit {
        self.wkWebView.removeObserver(self, forKeyPath: "estimatedProgress", context: nil)
        self.wkWebView.configuration.userContentController.removeAllUserScripts()
    }
    
    open override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        self.wkWebView.frame = CGRect.init(x: 0.0, y: 0.0, width: size.width, height: size.height)
        self.wkwebProgressView.frame = CGRect.init(x: webStartY, y: dc_statusBarHeight + dc_navigationBarHeight(), width: size.width, height: size.height)
    }
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // add progress observer
        webStartY = configuration.navigationBarTranslucent ? (dc_statusBarHeight + dc_navigationBarHeight()) : (0.0)
        self.wkWebView.addObserver(self, forKeyPath: "estimatedProgress", options: .new, context: nil)
    }
    
    open override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "estimatedProgress" {
            if self.wkWebView.estimatedProgress >= 1.0 {
                UIView.animate(withDuration: 0.3, delay: 0.1, options: .curveEaseInOut, animations: {
                    self.wkwebProgressView.alpha = 0.0
                }) { (finish) in
                    self.wkwebProgressView.progress = 0.0
                }
            } else {
                self.wkwebProgressView.alpha = 1.0
                wkwebProgressView.setProgress(Float(self.wkWebView.estimatedProgress), animated: true)
            }
        }
    }
    
    lazy var wkWebView: WKWebView = {
        // WKWebViewConfiguration
        let configuration = WKWebViewConfiguration.init()
        configuration.processPool = WKProcessPool.init()
        // WKPreferences
        let preferences = WKPreferences.init()
        configuration.preferences = preferences
        // WKWebView
        let wkwebview = WKWebView.init(frame: self.view.bounds, configuration: configuration)
        wkwebview.navigationDelegate = self
        wkwebview.uiDelegate = self
        self.view.addSubview(wkwebview)
        return wkwebview
    }()
    lazy var wkwebProgressView: UIProgressView = {
        //let progressView = UIProgressView.init(progressViewStyle: .bar)
        let progressView = UIProgressView.init(frame: CGRect.init(x: 0.0, y: webStartY, width: dc_screenWidth, height: 2.0))
        progressView.progress = 0.0
        progressView.tintColor = .blue
        
        self.view.addSubview(progressView)
        return progressView
    }()
}

// MARK: - Public
public extension DCBaseWebController {
    /// 添加 JS 交互 name
    /// - Parameter names: name 组合
    func addUserContentControllerScriptMessage(names: [String]) {
        let userContentController = WKUserContentController.init()
        for name in names {
            userContentController.add(self, name: name)
        }
        self.wkWebView.configuration.userContentController = userContentController
    }
    
    /// 加载本地文件(html 等), Bundle.main
    /// - Parameters:
    ///   - name: 文件名称
    ///   - extension: 扩展名
    func loadLocalFile(name: String, extension: String) {
        
    }
    
    /// 加载本地文件(html 等), 指定 Bundle
    /// - Parameters:
    ///   - name: 文件名称
    ///   - extension: 扩展名
    ///   - bundle: 指定 Bundle
    func loadLocalFile(name: String, extension: String, bundle: Bundle) {
        
    }
    
    /// 加载本地文件(html 等)
    /// - Parameter path: 文件路径
    func loadLocalFile(path: String) {
        
    }
    
    /// 加载链接
    /// - Parameter url: 链接
    func load(url: String) {
        self.wkWebView.load(URLRequest.init(url: URL.init(string: url)!))
    }
}

// MARK: - Private
private extension DCBaseWebController {
    
}

// MARK: - WKScriptMessageHandler
public extension DCBaseWebController {
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        // TODO: 回调
        
    }
}

// MARK: - WKNavigationDelegate
public extension DCBaseWebController {
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        decisionHandler(.allow)
    }
    
    @available(iOS 13.0, *)
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, preferences: WKWebpagePreferences, decisionHandler: @escaping (WKNavigationActionPolicy, WKWebpagePreferences) -> Void) {
        decisionHandler(.allow, preferences)
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        decisionHandler(.allow)
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        
    }
    
    func webView(_ webView: WKWebView, didReceiveServerRedirectForProvisionalNavigation navigation: WKNavigation!) {
        
    }
    
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        
    }
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        self.navigationItem.title = webView.title
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        
    }
    
    func webView(_ webView: WKWebView, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
        let serverTrust = challenge.protectionSpace.serverTrust
        if serverTrust != nil {
            let exceptions = SecTrustCopyExceptions(serverTrust!)
            SecTrustSetExceptions(serverTrust!, exceptions)
            completionHandler(.useCredential, URLCredential.init(trust: serverTrust!))
        }
    }
    
    @available(iOS 9.0, *)
    func webViewWebContentProcessDidTerminate(_ webView: WKWebView) {
        
    }
}

// MARK: - WKUIDelegate
public extension DCBaseWebController {
    func webView(_ webView: WKWebView, createWebViewWith configuration: WKWebViewConfiguration, for navigationAction: WKNavigationAction, windowFeatures: WKWindowFeatures) -> WKWebView? {
        // 如果目标主视图不为空, 则允许导航
        if !(navigationAction.targetFrame?.isMainFrame != nil) {
            webView.load(navigationAction.request)
        }
        return nil
    }
    
    @available(iOS 9.0, *)
    func webViewDidClose(_ webView: WKWebView) {
        
    }
    
    func webView(_ webView: WKWebView, runJavaScriptAlertPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping () -> Void) {
        completionHandler()
    }
    
    func webView(_ webView: WKWebView, runJavaScriptConfirmPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping (Bool) -> Void) {
        completionHandler(true)
    }
    
    func webView(_ webView: WKWebView, runJavaScriptTextInputPanelWithPrompt prompt: String, defaultText: String?, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping (String?) -> Void) {
        completionHandler(nil)
    }
    
    @available(iOS, introduced: 10.0, deprecated: 13.0)
    func webView(_ webView: WKWebView, shouldPreviewElement elementInfo: WKPreviewElementInfo) -> Bool {
        return true
    }
    
    @available(iOS, introduced: 10.0, deprecated: 13.0)
    func webView(_ webView: WKWebView, previewingViewControllerForElement elementInfo: WKPreviewElementInfo, defaultActions previewActions: [WKPreviewActionItem]) -> UIViewController? {
        return self
    }
    
    @available(iOS, introduced: 10.0, deprecated: 13.0)
    func webView(_ webView: WKWebView, commitPreviewingViewController previewingViewController: UIViewController) {
        
    }
    
    @available(iOS 13.0, *)
    func webView(_ webView: WKWebView, contextMenuConfigurationForElement elementInfo: WKContextMenuElementInfo, completionHandler: @escaping (UIContextMenuConfiguration?) -> Void) {
        completionHandler(nil)
    }
    
    @available(iOS 13.0, *)
    func webView(_ webView: WKWebView, contextMenuWillPresentForElement elementInfo: WKContextMenuElementInfo) {
        
    }
    
    @available(iOS 13.0, *)
    func webView(_ webView: WKWebView, contextMenuForElement elementInfo: WKContextMenuElementInfo, willCommitWithAnimator animator: UIContextMenuInteractionCommitAnimating) {
        
    }
    
    @available(iOS 13.0, *)
    func webView(_ webView: WKWebView, contextMenuDidEndForElement elementInfo: WKContextMenuElementInfo) {
        
    }
}
