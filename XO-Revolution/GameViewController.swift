//
//  GameViewController.swift
//  XO-Revolution
//
//  Created by María del Pilar López on 8/27/18.
//  Copyright © 2018 María del Pilar López. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit
import Device_swift
import SwiftyStoreKit
import StoreKit
import GoogleMobileAds

/// Banner definition
var bannerView: GADBannerView!

// TODO: Fix this class
var sharedSecret = "f14e35667cce407c858e88a5d6a631be"

enum RegisteredPurchase : String {
    case BuySkins = "BuySkins"
    
}


class NetworkActivityIndicatorManager : NSObject {
    
    private static var loadingCount = 0
    
    class func NetworkOperationStarted() {
        if loadingCount == 0 {
            
            UIApplication.shared.isNetworkActivityIndicatorVisible = true
        }
        loadingCount += 1
    }
    class func networkOperationFinished(){
        if loadingCount > 0 {
            loadingCount -= 1
            
        }
        
        if loadingCount == 0 {
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
            
        }
    }
}

class GameViewController: UIViewController, GADBannerViewDelegate {
    
    let skView = SKView()
    let lottieUiView = UIView()
    
    var Money = Int()
    
    let bundleID = "com.guadianatechnologygames.xorevolution"
    var neontheme = RegisteredPurchase.BuySkins
    
    /// Scenes
    var introScene: IntroScene!
    var menuScene: MenuScene!
    var difficultyScene: DifficultyScene!
    var storeScene: StoreScene!
    var colorStoreScene: ColorStoreScene!
    var gameScene: GameScene!
    var aiHardScene: AiHardScene!
    var aiEasyScene: AiEasyScene!
    
    // MARK: Override Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /// Add banner to a subview and request it
        bannerView = GADBannerView(adSize: kGADAdSizeBanner)
        bannerView.adUnitID = "ca-app-pub-3940256099942544/2934735716"
        bannerView.rootViewController = self
        bannerView.load(GADRequest())
        bannerView.delegate = self
        
        /// Present banner
        addBannerViewToView(bannerView)
        
        if UIDevice.current.userInterfaceIdiom == .phone {
            print("iPhone")
            
        }else{
            if UIDevice.current.userInterfaceIdiom == .pad {
            print("iPad")
            }
        }
        
        let deviceType = UIDevice.current.deviceType
        
        print(deviceType)
        
        view.backgroundColor = UIColor(red: 0.1, green: 0.1, blue: 0.1, alpha: 1)
        
        skView.frame = CGRect(x: 0, y: 0, width: view.bounds.size.width, height: view.bounds.size.height)
        skView.center = self.view.center
        skView.contentMode = .scaleAspectFill
        skView.allowsTransparency = true
        
        lottieUiView.frame = CGRect(x: 0, y: 0, width: view.bounds.size.width, height: view.bounds.size.height)
        lottieUiView.center = self.view.center
        lottieUiView.contentMode = .scaleAspectFill
        lottieUiView.backgroundColor = UIColor(red: 0.1, green: 0.1, blue: 0.1, alpha: 1)
        
        /// Introduction Scene
        introScene = IntroScene.init(sceneSize: view.bounds.size, referenceGVC: self)
        
        /// Menu Scene
        menuScene = MenuScene.init(sceneSize: view.bounds.size, referenceGVC: self)
        
        /// AI Menu Difficulty
        difficultyScene = DifficultyScene.init(sceneSize: view.bounds.size, referenceGVC: self)
        
        /// Two Players Game Scene
        gameScene = GameScene.init(sceneSize: view.bounds.size, referenceGVC: self)
        
        /// AI Easy Scene
        aiEasyScene = AiEasyScene.init(sceneSize: view.bounds.size, referenceGVC: self)
        
        /// AI Hard Scene
        aiHardScene = AiHardScene.init(sceneSize: view.bounds.size, referenceGVC: self)
        
        /// Skins Store Scene
        storeScene = StoreScene.init(sceneSize: view.bounds.size, referenceGVC: self)
        
        /// Color Skins Store
        colorStoreScene = ColorStoreScene.init(sceneSize: view.bounds.size, referenceGVC: self)
        
        skView.presentScene(introScene)
        
        view.addSubview(lottieUiView)
        view.addSubview(skView)
    }
    //////////////////////////////////////////////////////
    func NonRenewable(_ sender: Any) {
        purchase(purchase: neontheme)
    }
    //////////////////////////////////////////////////////
    
    override var shouldAutorotate: Bool {
        return false
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .portrait
        } else {
            return .all
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    //function to display the banner
    func addBannerViewToView(_ bannerView: GADBannerView) {
        bannerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bannerView)
        view.addConstraints(
            [NSLayoutConstraint(item: bannerView,
                                attribute: .top,
                                relatedBy: .equal,
                                toItem: topLayoutGuide,
                                attribute: .bottom,
                                multiplier: 1,
                                constant: 0),
             NSLayoutConstraint(item: bannerView,
                                attribute: .centerX,
                                relatedBy: .equal,
                                toItem: view,
                                attribute: .centerX,
                                multiplier: 1,
                                constant: 0)
            ])
    }
    
    /// Tells the delegate an ad request loaded an ad.
    func adViewDidReceiveAd(_ bannerView: GADBannerView) {
        print("adViewDidReceiveAd")
    }
    
    /// Tells the delegate an ad request failed.
    func adView(_ bannerView: GADBannerView,
                didFailToReceiveAdWithError error: GADRequestError) {
        print("adView:didFailToReceiveAdWithError: \(error.localizedDescription)")
    }
    
    /// Tells the delegate that a full-screen view will be presented in response
    /// to the user clicking on an ad.
    func adViewWillPresentScreen(_ bannerView: GADBannerView) {
        print("adViewWillPresentScreen")
    }
    
    /// Tells the delegate that the full-screen view will be dismissed.
    func adViewWillDismissScreen(_ bannerView: GADBannerView) {
        print("adViewWillDismissScreen")
    }
    
    /// Tells the delegate that the full-screen view has been dismissed.
    func adViewDidDismissScreen(_ bannerView: GADBannerView) {
        print("adViewDidDismissScreen")
    }
    
    /// Tells the delegate that a user click will open another app (such as
    /// the App Store), backgrounding the current app.
    func adViewWillLeaveApplication(_ bannerView: GADBannerView) {
        print("adViewWillLeaveApplication")
    }
    
    func getInfo(purchase : RegisteredPurchase) {
        
        NetworkActivityIndicatorManager.NetworkOperationStarted()
        SwiftyStoreKit.retrieveProductsInfo([bundleID + "." + purchase.rawValue], completion: {
            result in
            NetworkActivityIndicatorManager.networkOperationFinished()
            
            self.showAlert(alert: self.alertForProductsRetrievalInfo(result: result))
            
        })
    }
    
    func purchase(purchase : RegisteredPurchase) {
        
        NetworkActivityIndicatorManager.NetworkOperationStarted()
        SwiftyStoreKit.purchaseProduct(bundleID + "." + purchase.rawValue, completion: {
            result in
            NetworkActivityIndicatorManager.networkOperationFinished()
            
            if case .success(let product) = result {
                
                if product.productId == self.bundleID + "." + "neontheme"{
                    self.Money += 10
                }
                
                if product.needsFinishTransaction {
                    SwiftyStoreKit.finishTransaction(product.transaction)
                }
                self.showAlert(alert: self.alertForPurchaseResult(result)!)
            }
            
        })
    }
    
    func restorePurchases() {
        NetworkActivityIndicatorManager.NetworkOperationStarted()
        SwiftyStoreKit.restorePurchases(atomically: true, completion: {
            result in
            NetworkActivityIndicatorManager.networkOperationFinished()
            
            for product in result.restoredPurchases {
                if product.needsFinishTransaction {
                    SwiftyStoreKit.finishTransaction(product.transaction)
                }
            }
            self.showAlert(alert: self.alertForRestorePurchases(result: result))
        })
    }
    
    func verifyReceipt() {
        NetworkActivityIndicatorManager.NetworkOperationStarted()
        SwiftyStoreKit.verifyReceipt(using: sharedSecret as! ReceiptValidator, completion: {
            result in
            NetworkActivityIndicatorManager.networkOperationFinished()
            
            self.showAlert(alert: self.alertForVerifyReceipt(result: result))
            
            if case .error(let error) = result {
                if case .noReceiptData = error {
                    self.verifyReceipt()
                }
            }
        })
    }
    
//    func verifyPurchase(product : RegisteredPurchase,  ofType type: SubscriptionType) {
//        NetworkActivityIndicatorManager.NetworkOperationStarted()
//        SwiftyStoreKit.verifyReceipt(using: sharedSecret as! ReceiptValidator, completion: {
//            result in
//            NetworkActivityIndicatorManager.networkOperationFinished()
//
//            switch result {
//            case .success(let receipt):
//
//                var productId = self.bundleID + "." + product.rawValue
//
//                if product == .autoRenewable {
//                    let purchaseResult = SwiftyStoreKit.verifySubscriptions(ofType: type, productIds: [productId], inReceipt: receipt, validUntil: Date())
//                    self.showAlert(alert: self.alertForVerifySubscriptions(result: purchaseResult, productIds: [productId]))
//                }
//                else {
//                    let purchaseResult = SwiftyStoreKit.verifyPurchase(productId: productId, inReceipt: receipt)
//                    self.showAlert(alert: self.alertForVerifyPurchase(result: purchaseResult, productId: productId))
//                }
//            case .error(let error):
//                self.showAlert(alert: self.alertForVerifyReceipt(result: result))
//                if case .noReceiptData = error {
//                    self.refreshReceipt()
//
//                }
//
//            }
//        })
//    }
    
    func refreshReceipt() {
        SwiftyStoreKit.verifyReceipt(using: sharedSecret as! ReceiptValidator, completion: {
            result in
            NetworkActivityIndicatorManager.networkOperationFinished()
            
            self.showAlert(alert: self.alertForVerifyReceipt(result: result))
            
        })
        
    }
    
}

extension GameViewController {
    
    func alertWithTitle(title : String, message : String) -> UIAlertController{
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        
        return alert
    }
    
    func showAlert(alert : UIAlertController) {
        guard let _ = self.presentationController else {
            self.present(alert, animated: true, completion: nil)
            return
        }
    }
    
    func alertForProductsRetrievalInfo(result : RetrieveResults) -> UIAlertController {
        if let product = result.retrievedProducts.first {
            let priceString = product.localizedPrice!
            return alertWithTitle(title: product.localizedTitle, message: "\(product.localizedDescription) - \(priceString)")
        }
        else if let invalidProductID = result.invalidProductIDs.first {
            return alertWithTitle(title: "Could not retrieve product info", message: "Invalid product identifier: \(invalidProductID)")
        }
        else {
            let errorString = result.error?.localizedDescription ?? "Unknown Error. Please Contact Support"
            return alertWithTitle(title: "Could not retrieve product info", message: errorString)
        }
    }
    
    func alertForPurchaseResult(_ result: PurchaseResult) -> UIAlertController? {
        switch result {
        case .success(let purchase):
            print("Purchase Success: \(purchase.productId)")
            return nil
        case .error(let error):
            print("Purchase Failed: \(error)")
            switch error.code {
            case .unknown: return alertWithTitle(title: "Purchase failed", message: error.localizedDescription)
            case .clientInvalid: // client is not allowed to issue the request, etc.
                return alertWithTitle(title: "Purchase failed", message: "Not allowed to make the payment")
            case .paymentCancelled: // user cancelled the request, etc.
                return nil
            case .paymentInvalid: // purchase identifier was invalid, etc.
                return alertWithTitle(title: "Purchase failed", message: "The purchase identifier was invalid")
            case .paymentNotAllowed: // this device is not allowed to make the payment
                return alertWithTitle(title: "Purchase failed", message: "The device is not allowed to make the payment")
            case .storeProductNotAvailable: // Product is not available in the current storefront
                return alertWithTitle(title: "Purchase failed", message: "The product is not available in the current storefront")
            case .cloudServicePermissionDenied: // user has not allowed access to cloud service information
                return alertWithTitle(title: "Purchase failed", message: "Access to cloud service information is not allowed")
            case .cloudServiceNetworkConnectionFailed: // the device could not connect to the nework
                return alertWithTitle(title: "Purchase failed", message: "Could not connect to the network")
            case .cloudServiceRevoked: // user has revoked permission to use this cloud service
                return alertWithTitle(title: "Purchase failed", message: "Cloud service was revoked")
            }
        }
    }
    
    func alertForRestorePurchases(result: RestoreResults) -> UIAlertController {
        
        if result.restoreFailedPurchases.count > 0 {
            print("Restore Failed: \(result.restoreFailedPurchases)")
            return alertWithTitle(title: "Restore failed", message: "Unknown error. Please contact support")
        } else if result.restoredPurchases.count > 0 {
            print("Restore Success: \(result.restoredPurchases)")
            return alertWithTitle(title: "Purchases Restored", message: "All purchases have been restored")
        } else {
            print("Nothing to Restore")
            return alertWithTitle(title: "Nothing to restore", message: "No previous purchases were found")
        }
    }
    
    func alertForVerifyReceipt(result: VerifyReceiptResult) -> UIAlertController {
        
        switch result {
        case .success(let receipt):
            print("Verify receipt Success: \(receipt)")
            return alertWithTitle(title: "Receipt verified", message: "Receipt verified remotely")
        case .error(let error):
            print("Verify receipt Failed: \(error)")
            switch error {
            case .noReceiptData:
                return alertWithTitle(title: "Receipt verification", message: "No receipt data. Try again.")
            case .networkError(let error):
                return alertWithTitle(title: "Receipt verification", message: "Network error while verifying receipt: \(error)")
            default:
                return alertWithTitle(title: "Receipt verification", message: "Receipt verification failed: \(error)")
            }
        }
    }
    
    func alertForVerifySubscriptions(result: VerifySubscriptionResult, productIds: Set<String>) -> UIAlertController {
        
        switch result {
        case .purchased(let expiryDate, let items):
            print("\(productIds) is valid until \(expiryDate)\n\(items)\n")
            return alertWithTitle(title: "Product is purchased", message: "Product is valid until \(expiryDate)")
        case .expired(let expiryDate, let items):
            print("\(productIds) is expired since \(expiryDate)\n\(items)\n")
            return alertWithTitle(title: "Product expired", message: "Product is expired since \(expiryDate)")
        case .notPurchased:
            print("\(productIds) has never been purchased")
            return alertWithTitle(title: "Not purchased", message: "This product has never been purchased")
        }
    }
    
    func alertForVerifyPurchase(result: VerifyPurchaseResult, productId: String) -> UIAlertController {
        
        switch result {
        case .purchased:
            print("\(productId) is purchased")
            return alertWithTitle(title: "Product is purchased", message: "Product will not expire")
        case .notPurchased:
            print("\(productId) has never been purchased")
            return alertWithTitle(title: "Not purchased", message: "This product has never been purchased")
        }
    }
    
}
