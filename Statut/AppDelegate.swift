//
//  AppDelegate.swift
//  Statut
//
//  Created by 卢涛南 on 15/12/30.
//  Copyright © 2015年 randy. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!

    let popover = NSPopover()
    
    let statusItem = NSStatusBar.systemStatusBar().statusItemWithLength(-2)


    func applicationDidFinishLaunching(aNotification: NSNotification) {
        if let button = statusItem.button {
            button.image = NSImage(named: "StatusBarButtonImage")
            button.action = Selector("togglePopover:")
        }
        
        popover.contentViewController = PopupViewController(nibName: "PopupViewController", bundle: nil)
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }
    
    func showPopover(sender: AnyObject?){
        if let button = statusItem.button {
            popover.showRelativeToRect(button.bounds, ofView: button, preferredEdge: NSRectEdge.MinY)
        }
    }
    
    func closePopover(sender: AnyObject?){
        popover.performClose(sender)
    }
    
    func togglePopover(sender: AnyObject?) {
        if (popover.shown) {
            closePopover(sender)
        } else {
            showPopover(sender)
        }
    }
}

