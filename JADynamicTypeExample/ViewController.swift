//
//  ViewController.swift
//  JADynamicTypeExample
//
//  Created by Alvarez, Jose (MTV) on 10/21/14.
//  Copyright (c) 2014 Jose Alvarez
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.

import UIKit

class ViewController: UIViewController {

    // Labels
    @IBOutlet weak var bodyLabel: UILabel!
    @IBOutlet weak var caption1Label: UILabel!
    @IBOutlet weak var caption2Label: UILabel!
    @IBOutlet weak var footnoteLabel: UILabel!
    @IBOutlet weak var headlineLabel: UILabel!
    @IBOutlet weak var subheadlineLabel: UILabel!
    
    // Buttons
    @IBOutlet weak var bodyButton: UIButton!
    @IBOutlet weak var caption1Button: UIButton!
    @IBOutlet weak var caption2Button: UIButton!
    @IBOutlet weak var footnoteButton: UIButton!
    @IBOutlet weak var headlineButton: UIButton!
    @IBOutlet weak var subheadlineButton: UIButton!
    
    // Container view labels
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var bodyInView: UILabel!
    @IBOutlet weak var caption1InView: UILabel!
    @IBOutlet weak var caption2InView: UILabel!
    @IBOutlet weak var footnoteInView: UILabel!
    @IBOutlet weak var headlineInView: UILabel!
    @IBOutlet weak var subheadlineInView: UITextView!
    
    // Switchers
    @IBOutlet weak var italicsLabel: UILabel!
    @IBOutlet weak var boldLabel: UILabel!
    @IBOutlet weak var italicsSwitch: UISwitch!
    @IBOutlet weak var boldSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        containerView.layer.borderColor = UIColor.grayColor().CGColor
        containerView.layer.borderWidth = 1.0
        
        let fontDescriptor = UIFontDescriptor.preferredFontDescriptorWithTextStyle(UIFontTextStyleBody)
        let italicsFontDescriptor = fontDescriptor.fontDescriptorWithSymbolicTraits(UIFontDescriptorSymbolicTraits.TraitItalic)
        italicsLabel.font = UIFont(descriptor:italicsFontDescriptor, size:0)
        let boldFontDescriptor = fontDescriptor.fontDescriptorWithSymbolicTraits(UIFontDescriptorSymbolicTraits.TraitBold)
        boldLabel.font  = UIFont(descriptor:boldFontDescriptor, size:0)
        
        NSNotificationCenter.defaultCenter().addObserverForName(UIContentSizeCategoryDidChangeNotification, object: nil, queue: NSOperationQueue.mainQueue()) { (note:NSNotification) -> Void in
            self.handleContentSizeCategoryDidChangeNotification()
        }
    }
    
    func handleContentSizeCategoryDidChangeNotification () {
        evaluateFonts()
    }
    
    func evaluateFonts () {
        
        // Update labels
        bodyLabel.font = evaluateFont(UIFontTextStyleBody)
        caption1Label.font = evaluateFont(UIFontTextStyleCaption1)
        caption2Label.font = evaluateFont(UIFontTextStyleCaption2)
        footnoteLabel.font = evaluateFont(UIFontTextStyleFootnote)
        headlineLabel.font = evaluateFont(UIFontTextStyleHeadline)
        subheadlineLabel.font = evaluateFont(UIFontTextStyleSubheadline)
        
        // Update buttons
        bodyButton.titleLabel?.font = evaluateFont(UIFontTextStyleBody)
        caption1Button.titleLabel?.font = evaluateFont(UIFontTextStyleCaption1)
        caption2Button.titleLabel?.font = evaluateFont(UIFontTextStyleCaption2)
        footnoteButton.titleLabel?.font = evaluateFont(UIFontTextStyleFootnote)
        headlineButton.titleLabel?.font = evaluateFont(UIFontTextStyleHeadline)
        subheadlineButton.titleLabel?.font = evaluateFont(UIFontTextStyleSubheadline)
        
        // Update container view labels
        bodyInView.font = evaluateFont(UIFontTextStyleBody)
        caption1InView.font = evaluateFont(UIFontTextStyleCaption1)
        caption2InView.font = evaluateFont(UIFontTextStyleCaption2)
        footnoteInView.font = evaluateFont(UIFontTextStyleFootnote)
        headlineInView.font = evaluateFont(UIFontTextStyleHeadline)
        subheadlineInView.font = evaluateFont(UIFontTextStyleSubheadline)
    }
    
    // Helper function that handles displaying a font w/ italics and bold traits.
    func evaluateFont(fontStyle:String)->UIFont {
        let fontDescriptor = UIFontDescriptor.preferredFontDescriptorWithTextStyle(fontStyle)
        var traitsDescriptor:UIFontDescriptor
        
        if (italicsSwitch.on) {
            traitsDescriptor = fontDescriptor.fontDescriptorWithSymbolicTraits(UIFontDescriptorSymbolicTraits.TraitItalic)
            
        } else if (boldSwitch.on) {
            traitsDescriptor = fontDescriptor.fontDescriptorWithSymbolicTraits(UIFontDescriptorSymbolicTraits.TraitBold)
            
        } else {
            traitsDescriptor = fontDescriptor
        }
        return UIFont(descriptor: traitsDescriptor, size: 0)
    }
    
    @IBAction func updateItalics(sender: UISwitch) {
        // Reset bold since multiple trait support does not always work
        boldSwitch.on = false
        evaluateFonts()
    }
    
    @IBAction func updateBolds(sender: UISwitch) {
        // Reset italics since multiple trait support does not always work
        italicsSwitch.on = false
        evaluateFonts()
    }
}

