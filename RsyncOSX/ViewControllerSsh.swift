//
//  ViewControllerSsh.swift
//  RsyncOSX
//
//  Created by Thomas Evensen on 23.04.2017.
//  Copyright © 2017 Thomas Evensen. All rights reserved.
//

import Foundation
import Cocoa

class ViewControllerSsh: NSViewController {
    
    var ras:Bool = false
    var dsa:Bool = false
    var Ssh:ssh?
    
    @IBOutlet weak var dsaCheck: NSButton!
    @IBOutlet weak var rsaCheck: NSButton!
    
    // Index of selected row
    var index:Int?
    // Delegate for getting index from Execute view
    weak var index_delegate:GetSelecetedIndex?
    
    // Information about rsync output
    // self.presentViewControllerAsSheet(self.ViewControllerInformation)
    lazy var ViewControllerInformation: NSViewController = {
        return self.storyboard!.instantiateController(withIdentifier: "StoryboardInformationCopyFilesID")
            as! NSViewController
    }()
    
    // Source for CopyFiles
    // self.presentViewControllerAsSheet(self.ViewControllerAbout)
    lazy var ViewControllerSource: NSViewController = {
        return self.storyboard!.instantiateController(withIdentifier: "CopyFilesID")
            as! NSViewController
    }()

    @IBAction func Source(_ sender: NSButton) {
        self.presentViewControllerAsSheet(self.ViewControllerSource)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear() {
        super.viewDidAppear()
        self.Ssh = ssh()
        if self.Ssh!.rsaBool {
            self.rsaCheck.state = NSOnState
        } else {
            self.rsaCheck.state = NSOffState
        }
        if self.Ssh!.dsaBool {
            self.dsaCheck.state = NSOnState
        } else {
            self.dsaCheck.state = NSOffState
        }
    }
}

extension ViewControllerSsh: DismissViewController {
    
    // Protocol DismissViewController
    func dismiss_view(viewcontroller: NSViewController) {
        self.dismissViewController(viewcontroller)
    }
}
