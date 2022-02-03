//
//  VijestiBackgroundRefershTask.swift
//  Infoeduka (iOS)
//
//  Created by lcabraja on 1/30/22.
//

import Combine
import Foundation
import BackgroundTasks

class VijestiBackgroundRefresh {
    let shared = VijestiBackgroundRefresh()
    
    let taskIdentifier = "hr.algebra.infoeduka.vijestirefresh"
    var cancellables = Set<AnyCancellable>()
    
    static func processData(data: VijestiResponseWelcome) {
        let stringData = String(describing: data)
        let index = stringData.index(stringData.startIndex, offsetBy: 100)
        print("data fetched @ \(Date()): \(stringData[..<index])...")
        LocalNotificationManager.shared.sendNotification(title: "Test", substitle: nil, body: "\(data)", launchIn: 0.5)
    }
    
    func getNews() {
        URLSession.shared.dataTaskPublisher(for: VijestiResponseWelcome.endpoint.url)
            .map { $0.data }
            .decode(type: VijestiResponseWelcome.self, decoder: newJSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { print("Received completion: \($0)") },
                receiveValue: { data in
                    print("\(data)")
                }
            )
            .store(in: &cancellables)
    }
    
    func register() {
        BGTaskScheduler.shared.register(forTaskWithIdentifier: taskIdentifier, using: nil) { task in
            self.handleAppRefresh(task: task as! BGAppRefreshTask)
        }
    }
    
    func scheduleAppRefresh() {
        let request = BGAppRefreshTaskRequest(identifier: taskIdentifier)
        request.earliestBeginDate = Date(timeIntervalSinceNow: 1 * 60)
        do {
            try BGTaskScheduler.shared.submit(request)
            print("Scheduled app refresh.")
        } catch {
            print("Could not schedule app refresh: \(error)")
        }
    }
    
    func handleAppRefresh(task: BGAppRefreshTask) {
        scheduleAppRefresh()
        
        task.expirationHandler = {
            print("expired")
        }
        self.getNews()
        task.setTaskCompleted(success: true)
    }
}
