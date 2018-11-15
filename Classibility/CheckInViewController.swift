//
//  CheckInViewController.swift
//  Classibility
//
//  Created by Kanta'MacPro on 10/11/2561 BE.
//  Copyright © 2561 Kanta'MacPro. All rights reserved.
//

import UIKit
import AVFoundation

class CheckInViewController: UIViewController {
    //MARK: Properties
    @IBOutlet weak var TipBar: UIImageView!
    @IBOutlet weak var camera: UIImageView!
    @IBOutlet weak var captureImageView: UIImageView!
    @IBOutlet weak var checkinButton: UIButton!
    @IBOutlet weak var previewView: UIView!
    
    let tipbarImage = UIImage(named: "TipbarIMG")
   // let cameraZoneImage = UIImage(named: "ScanPanelIMG")
    let cameraImage = UIImage(named: "CameraIMG")
    
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
        currentCamera = backCamera
    }
    func setupInputOutput(){
        do {
             let captureDeviceInput = try AVCaptureDeviceInput(device: currentCamera!)
            captureSession.addInput(captureDeviceInput)
            photoOutput?.setPreparedPhotoSettingsArray([AVCapturePhotoSettings(format: [AVVideoCodecKey: AVVideoCodecType.jpeg])], completionHandler: nil)
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
