//
//  NotificationManager.swift
//  DiscoPangPang
//
//  Created by 임재성 on 7/7/25.
//

import UserNotifications

func scheduleDeadlineNotification(deadline: Date, title: String) {
    let content = UNMutableNotificationContent()
    content.title = "기분"
    content.body = "활동 기록하셨나요? 기분이가 기다리고 있어요✍️"
    content.sound = .default

    let triggerDate = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: deadline)
    let trigger = UNCalendarNotificationTrigger(dateMatching: triggerDate, repeats: false)

    let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)

    UNUserNotificationCenter.current().add(request) { error in
        if let error = error {
            print("❌ 알림 등록 실패: \(error.localizedDescription)")
        } else {
            print("✅ 마감 알림 등록 완료")
        }
    }
}
