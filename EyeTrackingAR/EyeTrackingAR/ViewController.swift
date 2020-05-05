//
//  ViewController.swift
//  EyeTrackingAR
//
//  Created by Cory Green on 5/3/20.
//  Copyright © 2020 Cory Green. All rights reserved.
//

import UIKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // setting up the sceneview //
        sceneView.delegate = self
        sceneView.showsStatistics = true
        sceneView.debugOptions = [ARSCNDebugOptions.showFeaturePoints]

    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // making sure the device supports face tracking //
        guard ARFaceTrackingConfiguration.isSupported else {
            return
        }
        
        // setting up config for face tracking //
        let config = ARFaceTrackingConfiguration()
        config.isLightEstimationEnabled = true
        sceneView.session.run(config, options: [.resetTracking, .removeExistingAnchors])
        
    }
    
    // renderer that draws out the eyes... kinda creepy //
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        
        guard anchor is ARFaceAnchor else {
            return nil
        }
        
        // creating a box //
        let box = SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0.0)
        let boxNode = SCNNode(geometry: box)
        
        return boxNode
    }


}

