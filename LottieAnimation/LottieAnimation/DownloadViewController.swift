//
//  DownloadViewController.swift
//  LottieAnimation
//
//  Created by Ted on 2021/02/12.
//

import UIKit
import Lottie

enum ProgressKeyFrames: CGFloat {
    
    case start = 140
    case end = 187
    case complete = 240
}

class DownloadViewController: UIViewController {
    
    private var progressView: AnimationView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        progressView = .init(name: "saving")
        progressView!.frame = view.bounds
        progressView!.contentMode = .scaleAspectFit
        view.addSubview(progressView!)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(animated)
        startProgress()
    }
    
    private func startProgress() {
        progressView?.play(fromFrame: 0, toFrame: ProgressKeyFrames.start.rawValue, loopMode: .none) { [weak self] (_) in
            self?.startDownload()
        }
    }
    
    private func startDownload() {
        let url = URL(string: "https://archive.org/download/SampleVideo1280x7205mb/SampleVideo_1280x720_5mb.mp4")!
        
        let configuration = URLSessionConfiguration.default
        let operationQueue = OperationQueue()
        let session = URLSession(configuration: configuration, delegate: self, delegateQueue: operationQueue)
        let downloadTask = session.downloadTask(with: url)
        
        downloadTask.resume()
    }
    
    private func endDownload() {
        progressView?.play(fromFrame: ProgressKeyFrames.end.rawValue, toFrame: ProgressKeyFrames.complete.rawValue, loopMode: .none)
    }
    
    private func progress(to progress: CGFloat) {
        
        let progressRange = ProgressKeyFrames.end.rawValue - ProgressKeyFrames.start.rawValue
        let progressFrame = progressRange * progress
        let currentFrame = progressFrame + ProgressKeyFrames.start.rawValue
        progressView?.currentFrame = currentFrame
        
        print("Downloading \((progress*100).rounded())%")
    }
}

extension DownloadViewController: URLSessionDownloadDelegate {
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
        
        let percentDownloaded: CGFloat = CGFloat(totalBytesWritten) / CGFloat(totalBytesExpectedToWrite)
        
        DispatchQueue.main.async {
            self.progress(to: percentDownloaded)
        }
    }
    
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        DispatchQueue.main.async {
            self.endDownload()
        }
    }
    
}
