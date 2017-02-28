//
//  ViewController.swift
//  DrawGraphics
//
//  Created by Lucia on 2017. 2. 28..
//  Copyright © 2017년 Lucia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imgView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnDrawLine(_ sender: UIButton) {
        UIGraphicsBeginImageContext(imgView.frame.size) // context를 이미지 뷰의 크기와 같게 생성.
        let context = UIGraphicsGetCurrentContext()! // 생성한 context의 정보를 가져옴.
        
        // Draw Line
        context.setLineWidth(2.0) // 선의 굵기
        context.setStrokeColor(UIColor.red.cgColor) // 선 색상.
        
        context.move(to: CGPoint(x: 50, y: 50)) // 시작 위치로 커서를 이동.
        context.addLine(to: CGPoint(x: 250, y: 250)) // 현재 위치에서 지정한 위치까지 선을 추가.
        
        context.strokePath() // 추가한 경로를 콘텍스트에 그린다.
        
        // Draw Triangle
        // Draw Line과 같은 방법으로 삼각형을 그린다. 꼭지점은 3개이므로 좌표를 다르게 하여 세번 입력한다.
        context.setLineWidth(4.0)
        context.setStrokeColor(UIColor.blue.cgColor)
        
        context.move(to: CGPoint(x: 150, y: 200))
        context.addLine(to: CGPoint(x: 250, y: 350))
        context.addLine(to: CGPoint(x: 50, y: 350))
        context.addLine(to: CGPoint(x: 150, y: 200))
        context.strokePath()
        
        imgView.image = UIGraphicsGetImageFromCurrentImageContext() // 이미지 뷰에 콘텍스트의 이미지 나타냄.
        UIGraphicsEndImageContext()
        
    }

    @IBAction func btnDrawRectangle(_ sender: UIButton) {
        UIGraphicsBeginImageContext(imgView.frame.size)
        let context = UIGraphicsGetCurrentContext()!
        
        // Draw Rectangle
        context.setLineWidth(2.0)
        context.setStrokeColor(UIColor.red.cgColor)
        
        // (50, 100)의 좌표에서 시작하고 폭이 200픽셀, 높이가 200픽셀인 사각형을 그린다. 이때 (50, 100)읜 왼쪽 위 꼭지점.
        context.addRect(CGRect(x: 50, y: 100, width: 200, height: 200))
        
        context.strokePath()
        
        imgView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
    }
    @IBAction func btnDrawCircle(_ sender: UIButton) {
        
        UIGraphicsBeginImageContext(imgView.frame.size)
        let context = UIGraphicsGetCurrentContext()!
        
        // Draw Ellipse
        context.setLineWidth(2.0)
        context.setStrokeColor(UIColor.red.cgColor)
        
        // xy(50, 50)에서 시작하고 폭이 200픽셀, 높이가 100픽셀인 사각형 안에 내접하는 타원을 그린다.
        context.addEllipse(in: CGRect(x: 50, y: 50, width: 200, height: 100))
        context.strokePath()
        
        // DrawCircle
        context.setLineWidth(5.0)
        context.setStrokeColor(UIColor.green.cgColor)
        
        // xy(50, 200)에서 시작하고 폭이 200픽셀, 높이가 200픽셀인 사각형 안에 내접하는 원을 그린다.
        // 폭과 높이를 같게 설정하면 원을 그릴 수 있다.
        context.addEllipse(in: CGRect(x: 50, y: 200, width: 200, height: 200))
        context.strokePath()
        
        imgView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
    }

    // 호는 양 끝점과 반지름을 이용하여 그릴 수 있다.
    @IBAction func btnDrawArc(_ sender: UIButton) {
        UIGraphicsBeginImageContext(imgView.frame.size)
        let context = UIGraphicsGetCurrentContext()!
        
        // Draw Arc
        context.setLineWidth(5.0)
        context.setStrokeColor(UIColor.purple.cgColor)
        
        context.move(to: CGPoint(x: 50, y: 50))
        
        // 현재 위치에서 두개의 접점(200, 50), (200, 200) 사이에 내접한 반지름이 50인 호를 그린다.
        context.addArc(tangent1End: CGPoint(x: 200, y: 50), tangent2End: CGPoint(x: 200, y: 200), radius: CGFloat(50))
        context.addLine(to: CGPoint(x: 200, y: 200))
        
        context.move(to: CGPoint(x: 100, y: 250))
        context.addArc(tangent1End: CGPoint(x: 250, y: 250), tangent2End: CGPoint(x: 100, y: 400), radius: CGFloat(20))
        context.addLine(to: CGPoint(x: 100, y: 400))
        
        context.strokePath()
        
        // Drawing complete, retrieve the finished image and cleanup
        imgView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    }
    @IBAction func btnDrawFill(_ sender: UIButton) {
        UIGraphicsBeginImageContext(imgView.frame.size)
        let context = UIGraphicsGetCurrentContext()!
       
        // Draw Rectangle
        context.setLineWidth(2.0)
        context.setStrokeColor(UIColor.red.cgColor)
        context.setFillColor(UIColor.red.cgColor)
        
        let rectangle = CGRect(x: 50, y: 50, width: 200, height: 100)
        context.addRect(rectangle)
        context.fill(rectangle)
        context.strokePath()
        
        
        // Draw Circle
        context.setLineWidth(1.0)
        context.setStrokeColor(UIColor.blue.cgColor)
        context.setFillColor(UIColor.blue.cgColor)
        
        let circle = CGRect(x: 50, y: 200, width: 200, height: 100)
        context.addEllipse(in: circle)
        context.fillEllipse(in: circle)
        context.strokePath()
        
        // Draw Triangle
        context.setLineWidth(1.0)
        context.setStrokeColor(UIColor.green.cgColor)
        context.setFillColor(UIColor.green.cgColor)
        
        context.move(to: CGPoint(x: 150, y: 350))
        context.addLine(to: CGPoint(x: 250, y: 450))
        context.addLine(to: CGPoint(x: 50, y: 450))
        context.addLine(to: CGPoint(x: 150, y: 350))
        context.fillPath()
        context.strokePath()
        
        imgView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        
    }

}

