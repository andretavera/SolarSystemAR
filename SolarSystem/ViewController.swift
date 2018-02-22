//
//  ViewController.swift
//  SolarSystem
//
//  Created by andre campos on 22/02/18.
//  Copyright © 2018 andre campos. All rights reserved.
//

import UIKit
import ARKit

class ViewController: UIViewController {
    
    @IBOutlet weak var sceneView: ARSCNView!
    
    //Used to detect the device position and orientation
    let configuration = ARWorldTrackingConfiguration()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.sceneView.session.run(configuration)
        self.sceneView.debugOptions = [ARSCNDebugOptions.showFeaturePoints, ARSCNDebugOptions.showWorldOrigin]
        
        self.sceneView.autoenablesDefaultLighting = true

    }

    override func viewDidAppear(_ animated: Bool) {
        
        
        let sun = SolarSComponent(geometry: SCNSphere(radius: 0.35), diffuse: #imageLiteral(resourceName: "SunDiffuse"), specular: nil, emission: nil, normal: nil, position: SCNVector3(0, 0, -1))
        sun.setRotation(duration: 20)
        
        let sunNmercury = SolarSComponent(geometry: nil, diffuse: nil, specular: nil, emission: nil, normal: nil, position: SCNVector3(0, 0, -1))
        sunNmercury.setRotation(duration: 30)

        let mercury = SolarSComponent(geometry: SCNSphere(radius: 0.1), diffuse: #imageLiteral(resourceName: "mercuryDiffuse"), specular: nil, emission: nil, normal: nil, position: SCNVector3(1.93, 0, 0))
        mercury.setRotation(duration: 6)
        
        let venus = SolarSComponent(geometry: SCNSphere(radius: 0.18), diffuse: #imageLiteral(resourceName: "venusDIffuse"), specular: nil, emission: #imageLiteral(resourceName: "venusEmission"), normal: nil, position: SCNVector3(3.6, 0, 0))
        venus.setRotation(duration: 7)
        
        let sunNvenus = SolarSComponent(geometry: nil, diffuse: nil, specular: nil, emission: nil, normal: nil, position: SCNVector3(0, 0, -1))
        sunNvenus.setRotation(duration: 22)
        
        let earth = SolarSComponent(geometry:  SCNSphere(radius:0.2), diffuse: #imageLiteral(resourceName: "EarthDiffuse"), specular: #imageLiteral(resourceName: "EarthSpecular"), emission: #imageLiteral(resourceName: "EarthEmission"), normal: #imageLiteral(resourceName: "EarthNormal"), position: SCNVector3(5, 0, 0))
        earth.setRotation(duration: 8)
        
        let moon = SolarSComponent(geometry:  SCNSphere(radius:0.03), diffuse: #imageLiteral(resourceName: "moonDiffuse") , specular: nil, emission: nil, normal: nil, position: SCNVector3(1, 0, 0))
        moon.setRotation(duration: 4)
        
        
        let mars = SolarSComponent(geometry:  SCNSphere(radius:0.1), diffuse: #imageLiteral(resourceName: "marsDiffuse") , specular: nil, emission: nil, normal: #imageLiteral(resourceName: "EarthNormal"), position: SCNVector3(7.6, 0, 0))
        moon.setRotation(duration: 4)
        
        let sunNmars = SolarSComponent(geometry: nil, diffuse: nil, specular: nil, emission: nil, normal: nil, position: SCNVector3(0, 0, -1))
        sunNmars.setRotation(duration: 35)
        
        
        sunNmercury.addChild(SolarSComponent: mercury)
        sunNmercury.addAtScene(sceneView: sceneView)
        
        sunNvenus.addChild(SolarSComponent: venus)
        sunNvenus.addAtScene(sceneView: sceneView)
        
        sun.addChild(SolarSComponent: earth)
        earth.addChild(SolarSComponent: moon)
        
        sunNmars.addChild(SolarSComponent: mars)
        sunNmars.addAtScene(sceneView: sceneView)
        
        sun.addAtScene(sceneView: sceneView)
       
        
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
}

