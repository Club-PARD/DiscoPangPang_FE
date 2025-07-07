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

    let triggerDate = Calendar.current.dateComponents([.year, .month, .day], from: deadline)
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

//테스트용
func scheduleTestNotification(title: String) {
    let content = UNMutableNotificationContent()
    content.title = "기분"
    content.body = "활동 기록하셨나요? 기분이가 기다리고 있어요✍️"
    content.sound = .default

    // 3초 뒤에 발송
    let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 3, repeats: false)

    let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)

    UNUserNotificationCenter.current().add(request) { error in
        if let error = error {
            print("❌ 테스트 알림 등록 실패: \(error.localizedDescription)")
        } else {
            print("✅ 테스트 알림 등록 완료")
        }
    }
}
