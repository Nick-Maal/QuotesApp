//
//  ViewController.swift
//  Quote-A-Day
//
//  Created by Nicolas Maalouly on 2024-01-30.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {
    @IBOutlet weak var currentQuoteTextView: UITextView!
    @IBOutlet weak var oldQuotesTextView: UITextView!
    @IBOutlet weak var nextQuoteButton: UIButton!
    @IBOutlet weak var todaysQuoteButton: UIButton!

    let quotes = ["Quote 1", "Quote 2", "Quote 3"]
    var currentQuoteIndex = 0

    let quoteSchedule: [String: String] = [
        "YEAR-MONTH-DAY: "Quote"
        "2024-02-16": "Quote 1"
    
    ]

    var oldQuotes: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        requestNotificationPermission()
        scheduleNotifications()
        displayTodaysQuote()
        configureTextViews()
    }
    
    private func configureTextViews() {
        currentQuoteTextView.isScrollEnabled = true
        currentQuoteTextView.isEditable = false
        currentQuoteTextView.isSelectable = true
        currentQuoteTextView.textContainer.lineBreakMode = .byWordWrapping
        
        oldQuotesTextView.isScrollEnabled = true
        oldQuotesTextView.isEditable = false
        oldQuotesTextView.isSelectable = true
        oldQuotesTextView.textContainer.lineBreakMode = .byWordWrapping
    }

    @IBAction func newQuoteButtonTapped(_ sender: UIButton) {
        advanceToNextQuote()
    }

    @IBAction func todaysQuoteButtonTapped(_ sender: UIButton) {
        displayTodaysQuote()
    }


    func displayTodaysQuote() {
        let today = getCurrentDateString()
        if let todaysQuote = quoteSchedule[today] {
            currentQuoteTextView.text = todaysQuote
            addQuoteToOldQuotes(todaysQuote)
        } else {
            currentQuoteTextView.text = "No special quote for today."
        }
    }

    private func advanceToNextQuote() {
        currentQuoteIndex += 1
        if currentQuoteIndex >= quotes.count {
            currentQuoteIndex = 0
        }
        currentQuoteTextView.text = quotes[currentQuoteIndex]
        addQuoteToOldQuotes(quotes[currentQuoteIndex])
    }


    private func addQuoteToOldQuotes(_ quote: String) {
        if !oldQuotes.contains(quote) {
            oldQuotes.append(quote)
            updateOldQuotesTextView()
        }
    }

    private func updateOldQuotesTextView() {
        oldQuotesTextView.text = oldQuotes.joined(separator: "\n\n")
    }

    private func getCurrentDateString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.string(from: Date())
    }

    func scheduleNotifications() {
        let center = UNUserNotificationCenter.current()
        scheduleNotification(at: "07:00", center: center) // For 7 AM EST
        scheduleNotification(at: "17:00", center: center) // For 5 PM EST
    }

    private func scheduleNotification(at time: String, center: UNUserNotificationCenter) {
        let content = UNMutableNotificationContent()
        content.title = "Daily Quote"
        content.body = "Here's your inspirational quote for the day!"
        content.sound = .default

        var dateComponents = DateComponents()
        dateComponents.timeZone = TimeZone(identifier: "America/New_York") // EST timezone
        let timeParts = time.split(separator: ":").compactMap { Int($0) }
        dateComponents.hour = timeParts[0]
        dateComponents.minute = timeParts[1]

        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)

        center.add(request) { (error) in
            if let error = error {
                print("Error scheduling notification: \(error)")
            }
        }
    }

    private func requestNotificationPermission() {
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .sound]) { granted, error in
            if granted {
                print("Notification permission granted.")
            } else {
                print("Notification permission denied.")
            }
        }
    }
}
