//
//  ImageHelper.swift
//  Mabiatak
//
//  Created by ahmed ezz on 8/16/19.
//

import UIKit
//import MobileCoreServices
//import Photos
//import QBImagePickerController
//
//class ImageHelper : NSObject  {
//
//    private var galleryImagePicker = QBImagePickerController()
//    private let cameraImagePicker = UIImagePickerController()
//    private var mainController:UIViewController!
//    private var isMultiple = false
//    private var count = 0
//    private var galleryImageDelegate : QBImagePickerControllerDelegate!
//    public func isMultiple(isMultiple:Bool)
//    {
//        self.isMultiple = isMultiple
//    }
//    init(mainController:UIViewController,imagePickerDelegate:UIImagePickerControllerDelegate,galleryImagePickerDelegate:QBImagePickerControllerDelegate)
//    {
//        self.mainController = mainController
//        self.galleryImageDelegate = galleryImagePickerDelegate
//        self.galleryImagePicker.delegate = galleryImagePickerDelegate
//        self.cameraImagePicker.delegate = imagePickerDelegate as! UIImagePickerControllerDelegate & UINavigationControllerDelegate
//    }
//    public func setCount(count:Int)
//    {
//        self.count = count
//    }
//    public func showMediaDialog(isVideo:Bool = false)
//    {
//        let alert = UIAlertController(title: nil, message:"", preferredStyle: .alert)
//        let actionButton = UIAlertAction(title: "Cancel".localized, style: UIAlertAction.Style.cancel, handler: nil)
//        alert.addAction(actionButton)
//        if isVideo
//        {
//            let selectVideoButton = UIAlertAction(title: "Choose Video".localized, style: .default, handler: { (action) -> Void in
//                self.checkPhotoLibraryPermission(isVideo:true)
//            })
//            alert.addAction(selectVideoButton)
//        }
//        else
//        {
//            let takePhotoButton = UIAlertAction(title: "Capture Image".localized, style: .default, handler: { (action) -> Void in
//                self.checkCameraPermission()
//            })
//            let selectFromGalleryButton = UIAlertAction(title: "Choose Image".localized, style: .default, handler: { (action) -> Void in
//                self.checkPhotoLibraryPermission()
//            })
//            alert.addAction(takePhotoButton)
//            alert.addAction(selectFromGalleryButton)
//        }
//        self.mainController.present(alert, animated: true, completion: nil)
//    }
//    // camera permission
//    private func checkCameraPermission()
//    {
//        let authStatus = AVCaptureDevice.authorizationStatus(for: AVMediaType.video)
//        switch authStatus
//        {
//        case .authorized:
//            print("access")
//            self.pickFromCamera()
//        case .notDetermined,.restricted:
//            // camera
//            AVCaptureDevice.requestAccess(for: AVMediaType.video, completionHandler:
//                {(result) in
//                    if result
//                    {
//                        print("access")
//                        // gallery for save image from camera
//                        PHPhotoLibrary.requestAuthorization ({ (granted) in
//                            if granted == PHAuthorizationStatus.authorized
//                            {
//                                print("you can access Gallery")
//                                self.pickFromCamera()
//                            }
//
//
//                        })
//
//                    }
//            })
//        case .denied:
//            Helper.showAlert(message: "Camera Permission Required ! ", buttonTitle: "Ok".localized,mainController: mainController, onComplete: {() -> Void in })
//        default:
//            break
//        }
//    }
//    //pick from camera
//    func pickFromCamera()
//    {
//        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera)
//        {
//
//            cameraImagePicker.sourceType = .camera
//            cameraImagePicker.allowsEditing = true
//            cameraImagePicker.mediaTypes = [String(kUTTypeImage)]
//            cameraImagePicker.modalPresentationStyle = .fullScreen
//            mainController.present(cameraImagePicker,animated: true,completion: nil)
//        }
//        else
//        {
//            Helper.showAlert(message: "No Camera".localized, buttonTitle: "Ok".localized,mainController: mainController, onComplete: {() -> Void in })
//        }
//    }
//    // gallery permission
//    func checkPhotoLibraryPermission(isVideo:Bool = false)  {
//        let status = PHPhotoLibrary.authorizationStatus()
//        switch status
//        {
//        case .authorized:
//            print("access")
//            selectFromGallery(isVideo: isVideo)
//        case .restricted,.notDetermined :
//            print("no access")
//            // gallery
//            PHPhotoLibrary.requestAuthorization( { (granted) in
//                if granted == PHAuthorizationStatus.authorized
//                {
//                    print("you can access Gallery")
//                    self.selectFromGallery(isVideo: isVideo)
//                }
//            })
//        case .denied :
//            Helper.showAlert(message: "Gallery Permission Required",buttonTitle: "Ok".localized,mainController: mainController, onComplete: {() -> Void in })
//        default:
//            print("default")
//        }
//    }
//    // save image taken by camera
//    func saveToCameraRoll(image: UIImage, completion: @escaping () -> Void)
//    {
//        PHPhotoLibrary.shared().performChanges({
//            PHAssetChangeRequest.creationRequestForAsset(from: image)
//        }) { saved, error in
//            if saved
//            {
//                //self.getFilePath("camera","")
//                completion()
//            }
//
//        }
//    }
//    // get path of image or video from camera or gallery
//    func getFilePath(_ type:String,_ fileURL:Any,isVideo:Bool = false,imageResult:PHAsset, completion: @escaping (Any) -> Void)
//    {
//        //progressLoaderImageGif.isHidden = false
//        var fetchResult:PHAsset!
//        if(type == "camera")
//        {
//            let fetchOptions = PHFetchOptions()
//            fetchOptions.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: true)]
//            fetchResult = PHAsset.fetchAssets(with: .image, options: fetchOptions).lastObject
//
//        }
//        else
//        {
//            if isVideo
//            {
//                fetchResult = imageResult
//            }
//            else
//            {
//                fetchResult = imageResult
//            }
//        }
//        if !isVideo
//        {
//            PHImageManager().requestImageData(for: fetchResult!, options: nil , resultHandler:
//                { (avurlAsset, audioMix,x, dict) in
//                    if let dictionary = dict as? [String:Any]
//                    {
//                        let data = ["data":avurlAsset!,"inf":dictionary] as [String : Any]
//                        completion(data)
//                    }
//                    else
//                    {
//                        Helper.showAlert(message: "Can`t Download Image".localized, buttonTitle: "Ok".localized,mainController: self.mainController, onComplete: {() -> Void in
//                            completion("fail")
//                        })
//
//                    }
//
//            })
//        }
//        else
//        {
//            PHImageManager().requestAVAsset(forVideo: fetchResult!, options: nil, resultHandler:
//                { (avurlAsset, audioMix, dict) in
//                    do
//                    {
//                        if let file = avurlAsset as? AVURLAsset
//                        {
//                            let generator = AVAssetImageGenerator(asset: file)
//                            generator.appliesPreferredTrackTransform = true
//                            let timestamp = CMTime(seconds: 1, preferredTimescale: 60)
//                            do {
//                                let imageRef = try generator.copyCGImage(at: timestamp, actualTime: nil)
//                                let image = UIImage(cgImage: imageRef)
//                                let data = image.pngData() as Data?
//                                let dataResult = ["file":file,"imageData":data] as [String : Any]
//                                completion(dataResult)
//                            }
//                            catch let error as NSError
//                            {
//                                print("Image generation failed with error \(error)")
//                                completion("fail")
//                            }
//                        }
//                        else
//                        {
//                            Helper.showAlert(message: "Can`t Download Video".localized, buttonTitle: "Ok".localized,mainController: self.mainController, onComplete: {() -> Void in
//                                completion("fail")
//                            })
//                        }
//                    }
//                    catch
//                    {
//                        print(" error in conversion image \(error)")
//                        Helper.showAlert(message: "Can`t Download Video".localized, buttonTitle: "Ok".localized,mainController: self.mainController, onComplete: {() -> Void in
//                            completion("fail")
//                        })
//                    }
//            })
//        }
//    }
//    //from gallery
//    func selectFromGallery(isVideo:Bool = false)
//    {
//        galleryImagePicker = QBImagePickerController()
//        galleryImagePicker.delegate = galleryImageDelegate
//        if isMultiple
//        {
//            galleryImagePicker.allowsMultipleSelection = true
//            galleryImagePicker.maximumNumberOfSelection = 4 - UInt(self.count)
//        }
//        galleryImagePicker.showsNumberOfSelectedAssets = true
//        galleryImagePicker.mediaType = isVideo ? .video :  .image
//        mainController.present(galleryImagePicker, animated: true, completion: nil)
//    }
//
//}
