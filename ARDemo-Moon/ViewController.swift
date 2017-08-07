//
//  ViewController.swift
//  ARDemo-Moon
//
//  Created by 刘传良 on 2017/8/7.
//  Copyright © 2017年 刘传良. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // 利用SceneKit创建一个球体，并这是材质
        let sphere = SCNSphere(radius: 0.2);
        let material = SCNMaterial();
        material.diffuse.contents = UIImage(named: "art.scnassets/mercury.jpg");
        sphere.materials = [material];
        
        //创建节点，并设置几何体为上面的球体
        let node = SCNNode();
        node.position = SCNVector3(x:0, y:0.1, z:-0.5);
        node.geometry = sphere;
        
        //将节点添加到scene中
        sceneView.scene.rootNode.addChildNode(node);
        sceneView.autoenablesDefaultLighting = true;
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingSessionConfiguration()
        
        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    // MARK: - ARSCNViewDelegate
    
/*
    // Override to create and configure nodes for anchors added to the view's session.
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let node = SCNNode()
     
        return node
    }
*/
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
}
