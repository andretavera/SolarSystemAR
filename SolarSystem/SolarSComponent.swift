//
//  SolarSComponent.swift
//  SolarSystem
//
//  Created by andre campos on 22/02/18.
//  Copyright © 2018 andre campos. All rights reserved.
//

import UIKit
import ARKit

class SolarSComponent {

    private var component = SCNNode()
    
    init(geometry: SCNGeometry?, diffuse: UIImage?, specular: UIImage?, emission: UIImage?, normal: UIImage?, position: SCNVector3) {
        if geometry != nil {
        component = SCNNode(geometry: geometry)
        component.geometry?.firstMaterial?.diffuse.contents = diffuse
        component.geometry?.firstMaterial?.specular.contents = specular
        component.geometry?.firstMaterial?.emission.contents = emission
        component.geometry?.firstMaterial?.normal.contents = normal
        }
        component.position = position
        
    }
    
    func setRotation (duration: TimeInterval){
        let action = SCNAction.rotateBy(x: 0, y: CGFloat(360.degreeesToRadians), z: 0, duration: duration)
        let actionRepeat = SCNAction.repeatForever(action)
        component.runAction(actionRepeat)
    }
    
    func addChild(SolarSComponent: SolarSComponent) {
        component.addChildNode(SolarSComponent.component)
    }
    func addAtScene( sceneView: ARSCNView!) {
        sceneView.scene.rootNode.addChildNode(component)
    }
}
extension Int {
    var degreeesToRadians: Double { return Double(self) * .pi/180}
}
