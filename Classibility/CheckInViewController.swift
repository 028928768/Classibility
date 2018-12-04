//
//  CheckInViewController.swift
//  Classibility
//
//  Created by Kanta'MacPro on 10/11/2561 BE.
//  Copyright © 2561 Kanta'MacPro. All rights reserved.
//

import UIKit
import AVFoundation
import Alamofire
import SwiftyJSON
import FirebaseDatabase

class CheckInViewController: UIViewController {
    
    var app_id = "d37e1b09"
    var app_key = "720d253758e6e33d6ba3558f6ae61a31"
    //MARK: Properties
    @IBOutlet weak var TipBar: UIImageView!
    @IBOutlet weak var camera: UIImageView!
    @IBOutlet weak var captureImageView: UIImageView!
    @IBOutlet weak var checkinButton: UIButton!
    @IBOutlet weak var previewView: UIView!
    
    
    let tipbarImage = UIImage(named: "TipbarIMG")
   // let cameraZoneImage = UIImage(named: "ScanPanelIMG")
    let cameraImage = UIImage(named: "CameraIMG")
    let clockImage = UIImage(named: "ClockIconIMG")
    
    let ref = Database.database().reference()
    //Camera
    var captureSession = AVCaptureSession()
    var backCamera: AVCaptureDevice?
    var frontCamera: AVCaptureDevice?
    var currentCamera: AVCaptureDevice?
    
    var photoOutput: AVCapturePhotoOutput?
    var cameraPreviewLayer : AVCaptureVideoPreviewLayer?
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TipBar.image = tipbarImage
        assignGraphic()
        
        //Custom Camera
        setupCaptureSession()
        setupDevice()
        setupInputOutput()
        setupPreviewLayer()
        startRunningCaptureSession()

       
    }
    
    func recognize(imageBase64: String){
        self.camera.image = self.clockImage
        var request = URLRequest(url: URL(string: "https://api.kairos.com/recognize")!)
        request.httpMethod = HTTPMethod.post.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue(app_id, forHTTPHeaderField: "app_id")
        request.setValue(app_key, forHTTPHeaderField: "app_key")
        
        let params : NSMutableDictionary? = [
            "image" : imageBase64,
            "gallery_name" : "profileEnroll",
            ]
        let data = try! JSONSerialization.data(withJSONObject: params!, options: JSONSerialization.WritingOptions.prettyPrinted)
        
        let json = NSString(data: data, encoding: String.Encoding.utf8.rawValue)
        request.httpBody = json!.data(using: String.Encoding.utf8.rawValue);
        Alamofire.request(request).responseJSON { (response) in
            if((response.result.value) != nil) {
                let json = JSON(response.result.value!)
                
                //let jsonData = Data()
//                let parsed = try? JSONSerialization.JSONObjectWithData(json, options: .MutableContainers) as! NSDictionary
//                if let name = parsed["userid"]{
//                    print("hellow")
//                }

                let alert = UIAlertController(title: "Kairos", message: "\(json)", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                self.camera.image = self.cameraImage
                self.ref.child("Class/Images Processing/members").setValue(["userid1"])
            }
        }
    }
    
    func setupCaptureSession(){
        captureSession.sessionPreset = AVCaptureSession.Preset.photo
    }
    func setupDevice(){
        let deviceDiscoverySession = AVCaptureDevice.DiscoverySession(deviceTypes: [AVCaptureDevice.DeviceType.builtInWideAngleCamera], mediaType: AVMediaType.video, position: AVCaptureDevice.Position.unspecified)
        let devices = deviceDiscoverySession.devices
        
        for device in  devices {
            if device.position == AVCaptureDevice.Position.back {
                backCamera = device
            } else if device.position == AVCaptureDevice.Position.front{
                frontCamera = device
            }
        }
        currentCamera = frontCamera
    }
    func setupInputOutput(){
        do {
             let captureDeviceInput = try AVCaptureDeviceInput(device: currentCamera!)
            captureSession.addInput(captureDeviceInput)
            photoOutput = AVCapturePhotoOutput()
            photoOutput?.setPreparedPhotoSettingsArray([AVCapturePhotoSettings(format: [AVVideoCodecKey: AVVideoCodecType.jpeg])], completionHandler: nil)
            captureSession.addOutput(photoOutput!)
        } catch {
            print("error")
            
        }
       
    }
    func setupPreviewLayer(){
        cameraPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        cameraPreviewLayer?.videoGravity = AVLayerVideoGravity.resizeAspectFill
        cameraPreviewLayer?.connection?.videoOrientation = AVCaptureVideoOrientation.portrait
        cameraPreviewLayer?.frame = self.view.frame
        self.view.layer.insertSublayer(cameraPreviewLayer!, at: 0)

        // cameraPreviewLayer?.frame = previewView.frame
      //  previewView.layer.insertSublayer(cameraPreviewLayer!, at: 0)
    }
    func startRunningCaptureSession(){
        captureSession.startRunning()
    }

    //Graphic
    func assignGraphic(){
        //CemeraZone.image = cameraZoneImage
        camera.image = cameraImage
    }
    
   //Custom Camera
    
    
    //tap checkin button
    @IBAction func takePhotoActiobn(_ sender: Any) {
        let settings = AVCapturePhotoSettings()
        settings.flashMode = AVCaptureDevice.FlashMode.off
        photoOutput?.capturePhoto(with: settings, delegate: self)
        //print("Captured!")
    }
    
    //Actions
    @IBAction func Cancel(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    
    

}

extension CheckInViewController : AVCapturePhotoCaptureDelegate {
    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
        let imageData = photo.fileDataRepresentation()
        let image = UIImage(data: imageData!)
        captureImageView.image = image
        let imagedata = image?.jpegData(compressionQuality: 1.0)
        let base64String : String = imagedata!.base64EncodedString(options: Data.Base64EncodingOptions(rawValue: 0))
        let imageStr : String = base64String.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!

        recognize(imageBase64: imageStr)
        //print("hello")
    }
}
