//
//  SdkManager.swift
//  OcSwiftUIDemo
//
//  Created by gbl on 2023/10/11.
//
import Foundation
import UIKit

public enum GradientOrientation {
    case vertical
    case horizontal
}

open class SdkManager {
    public init(){
        
    }
    
    public func sdk_img(named name: String) -> UIImage? {
        
        let scale = UIScreen.main.scale
        
        let bundle = Bundle(for: SdkManager.self);
        let name = "@" + String.init( format: "%d", scale ) + "x"
        let dir = "cupshe_task_ios_pod.bundle"
        var path:String? = bundle.path(forResource: name, ofType: "otf", inDirectory: dir)
//        let img = UIImage(named: name, in:bundle,compatibleWith: nil)
//        let img = UIImage(named: name)
//        return  path != nil ? [UIImage imageWithContentsOfFile:path] : nil;
        
        return path != nil ? UIImage(contentsOfFile: path!) : nil
    }
    
    
    
//    NSInteger scale = [[UIScreen mainScreen] scale];
//            NSBundle *currentBundle = [NSBundle bundleForClass:targetClass];
//            NSString *name = [NSString stringWithFormat:@"%@@%zdx",imageName,scale];
//            NSString *dir = [NSString stringWithFormat:@"%@.bundle",bundle];
//            NSString *path = [currentBundle pathForResource:name ofType:@"png" inDirectory:dir];
//            return path ? [UIImage imageWithContentsOfFile:path] : nil;

    
    
}

class FontManager {
    public init(){
        
    }
    
//    public func regBold(for classObj: AnyClass){
//        let bundle = Bundle(for: classObj.self);
//
//            let path = [currentBundle pathForResource:@"CODE BOLD.OTF" ofType:nil inDirectory:@"FFSpecialKit”];
//    }
//
//
    
    
    public func regCustomFont(for classObj: AnyClass){
        let bundle = Bundle(for: classObj.self);
        
        let bold_path = bundle.path(forResource: "bold", ofType: "otf", inDirectory: "cupshe_task_ios_pod")
        var bold_fontData = NSData.init(contentsOfFile: bold_path!)
        // ...通过CGDataProvider承载生成CGFont对象
        let bold_fontDataProvider = CGDataProvider(data: CFBridgingRetain(bold_fontData) as! CFData)
        let bold_fontRef = CGFont.init(bold_fontDataProvider!)!

        // ...注册字体
        var bold_fontError = Unmanaged<CFError>?.init(nilLiteral: ())
        CTFontManagerRegisterGraphicsFont(bold_fontRef, &bold_fontError)

//         ...获取了字体实际名字
//        bold_fontName =  bold_fontRef.fullName! as String
        
        let demi_path = bundle.path(forResource: "demi", ofType: "otf", inDirectory: "cupshe_task_ios_pod")
        var demi_fontData = NSData.init(contentsOfFile: demi_path!)
        // ...通过CGDataProvider承载生成CGFont对象
        let demi_fontDataProvider = CGDataProvider(data: CFBridgingRetain(demi_fontData) as! CFData)
        let demi_fontRef = CGFont.init(demi_fontDataProvider!)!

        // ...注册字体
        var demi_fontError = Unmanaged<CFError>?.init(nilLiteral: ())
        CTFontManagerRegisterGraphicsFont(demi_fontRef, &demi_fontError)
        
        let medium_path = bundle.path(forResource: "medium", ofType: "ttf", inDirectory: "cupshe_task_ios_pod")
        var medium_fontData = NSData.init(contentsOfFile: medium_path!)
        // ...通过CGDataProvider承载生成CGFont对象
        let medium_fontDataProvider = CGDataProvider(data: CFBridgingRetain(medium_fontData) as! CFData)
        let medium_fontRef = CGFont.init(medium_fontDataProvider!)!

        // ...注册字体
        var medium_fontError = Unmanaged<CFError>?.init(nilLiteral: ())
        CTFontManagerRegisterGraphicsFont(medium_fontRef, &medium_fontError)
        
        
        let regular_path = bundle.path(forResource: "regular", ofType: "otf", inDirectory: "cupshe_task_ios_pod")
        var regular_fontData = NSData.init(contentsOfFile: regular_path!)
        // ...通过CGDataProvider承载生成CGFont对象
        let regular_fontDataProvider = CGDataProvider(data: CFBridgingRetain(regular_fontData) as! CFData)
        let regular_fontRef = CGFont.init(regular_fontDataProvider!)!

        // ...注册字体
        var regular_fontError = Unmanaged<CFError>?.init(nilLiteral: ())
        CTFontManagerRegisterGraphicsFont(regular_fontRef, &regular_fontError)
    }
}

extension UIImage {

    public convenience init?(bounds: CGRect, colors: [UIColor], orientation: GradientOrientation = .horizontal) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = colors.map({ $0.cgColor })
        
        if orientation == .horizontal {
            gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5);
            gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5);
        }
        
        UIGraphicsBeginImageContext(gradientLayer.bounds.size)
        gradientLayer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        guard let cgImage = image?.cgImage else { return nil }
        self.init(cgImage: cgImage)
    }
}

//extension UIImage {
//    class func sdkImg(named name: String) -> UIImage {
//        print("g_image")
//        //图片放到文件中可使用
//        let fileName = "TaskSDK.framework/\(name)"
//        if let image = UIImage(named: fileName) {
//            print("g_image1")
//            return image
//        }
//        //图片放到 framework 的 bundle 中可使用
//        let bundleName = "TaskSDK.framework/TaskSDK.bundle/\(name)"
//        if let image = UIImage(named: bundleName) {
//            print("g_image2")
//            return image
//        }
//        print("g_image3")
//        return UIImage()
//    }
//}
