//
//  ComplexViewController.swift
//  Demo
//
//  Created by Lee on 2020/9/18.
//  Copyright © 2020 Lee. All rights reserved.
//

import UIKit
import SnapKit
import LinearView
import AVFoundation

class ComplexViewController: UIViewController {

    lazy var linearView = LinearView()
    
    private let player = AVPlayer(
        url: URL(string: "https://devstreaming-cdn.apple.com/videos/wwdc/2020/10648/3/B4DA06E5-8715-4478-B755-EDFF6EC473F9/master.m3u8")!
    )
    private var playerView = VideoPlayerView()
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        player.play()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        player.pause()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        setupPlayer()
        setupViews()
    }
    
    private func setup() {
        view.addSubview(linearView)
        linearView.layer.shadowColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        linearView.layer.shadowOffset = .zero
        linearView.layer.shadowRadius = 20
        linearView.layer.shadowOpacity = 0.2
        
        linearView.snp.makeConstraints { (make) in
            make.leading.trailing.equalToSuperview().inset(20)
            make.center.equalToSuperview()
        }
    }
    
    private func setupPlayer() {
        let playerLayer = AVPlayerLayer(player: player)
        playerView = VideoPlayerView({ (view) in
            view.layer.addSublayer(playerLayer)
        })
        playerView.observe { (size, animation) in
            if let animation = animation {
                CATransaction.begin()
                CATransaction.setAnimationDuration(animation.duration)
                CATransaction.setAnimationTimingFunction(animation.timingFunction)
                playerLayer.frame = .init(origin: .zero, size: size)
                CATransaction.commit()
                
            } else {
                playerLayer.frame = .init(origin: .zero, size: size)
            }
        }
        playerView.observe { (contentMode) in
            switch contentMode {
            case .scaleToFill:
                playerLayer.videoGravity = .resize
                
            case .scaleAspectFit:
                playerLayer.videoGravity = .resizeAspect
                
            case .scaleAspectFill:
                playerLayer.videoGravity = .resizeAspectFill
                
            default:
                playerLayer.videoGravity = .resizeAspectFill
            }
        }
        playerView.contentMode = .scaleAspectFit
        playerView.backgroundColor = .black
        playerView.layer.masksToBounds = true
        playerView.layer.cornerRadius = 6
        
        playerView.snp.makeConstraints { (make) in
            make.height.equalTo(playerView.snp.width).multipliedBy(9.0 / 16.0)
        }
    }
    
    private func setupViews() {
        let a = UIImageView(image: #imageLiteral(resourceName: "swift"))
        a.contentMode = .scaleAspectFit
        
        a.snp.makeConstraints { (make) in
            make.size.equalTo(64)
        }
        
        let b = UILabel()
        b.text = "Swift"
        b.font = .systemFont(ofSize: 40, weight: .bold)
        b.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        b.textAlignment = .center
        
        let c = UILabel()
        c.text = "The powerful programming language that is also easy to learn."
        c.font = .systemFont(ofSize: 24, weight: .medium)
        c.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        c.textAlignment = .center
        c.numberOfLines = 0
        
        let d = UILabel()
        d.text = "Swift is a powerful and intuitive programming language for macOS, iOS, watchOS, tvOS and beyond. Writing Swift code is interactive and fun, the syntax is concise yet expressive, and Swift includes modern features developers love. Swift code is safe by design, yet also produces software that runs lightning-fast."
        d.font = .systemFont(ofSize: 17, weight: .regular)
        d.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        d.textAlignment = .center
        d.numberOfLines = 0
        
        linearView.layout(.vertical)
        .view(.init(a, layout: .constant(64, .center)))
        .spacing(10)
        .view(b)
        .spacing(20)
        .view(c)
        .spacing(16)
        .view(d)
        .spacing(20)
        .view(playerView)
        .done()
    }
}
