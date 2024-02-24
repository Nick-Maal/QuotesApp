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

    let quotes = ["Love is not about how many days, months, or years you have been together. Love is about how much you love each other every day.", "The best thing to hold onto in life is each other.", "I have found the one whom my soul loves.", "Love recognizes no barriers. It jumps hurdles, leaps fences, penetrates walls to arrive at its destination full of hope.", "To love and be loved is to feel the sun from both sides.","Love doesn’t make the world go round. Love is what makes the ride worthwhile.", "We loved with a love that was more than love.", "In the end, we don’t remember the most beautiful face and body. We will remember the most beautiful heart and soul.", "I love you not only for what you are, but for what I am when I am with you."]
    var currentQuoteIndex = 0

    let quoteSchedule: [String: String] = [
        "2024-02-16": "September 26, 2023: To: My precious gem 💎 Wow, can you believe it? We're at 9 month, and each day with you feels like a cherished treasure. You continue to show me your kindness, intelligence, and boundless love. I'm in awe of how much we've grown together and how our bond keeps getting stronger with each passing day. This past month has been filled with so much happiness and laughter. Whether it's our late night convos, our adventures, or simply cuddling up together watching our favorite movies, every moment with you is a moment I will cherish forever. You, my love, are truly one of a kind. Your smile lights up even the darkest of days, and your laughter is like music to my ears. I find myself falling for you more and more with each passing day, and I can't help but feel incredibly lucky to have you by my side. Thank you for being my rock, my confidante, and my best friend. You make every day brighter just by being in it, and I can't wait to see what the future holds for us. Here's to many more months of love, laughter, and unforgettable memories together. With all my love, Your amazing boyfriend 💖",
        "2024-02-17": "October 26, 2023: To: My amazing star ✨ Happy 10 months, my love! Can you believe it's been this long? It feels like just yesterday that we started dating, and yet here we are, more in love than ever before. This past month has been nothing short of magical. From snuggling up together under a blanket, to our spontaneous outings exploring new places, every moment with you is an adventure I never want to end. I am endlessly grateful to have you in my life. Your unwavering support, your infectious laughter, and your boundless love fills my heart with warmth and joy, and I can't imagine my life without you. I love the way you always know how to make me smile, even on the toughest of days. Your kindness and compassion know no bounds, and I feel blessed to call you mine. As we celebrate this milestone together, I want you to know just how much you mean to me. You are my everything, my reason for waking up with a smile each morning, and I will cherish you for eternity. Forever and always, Your cool boyfriend 💫",
        "2024-02-18": "November 26, 2023: To: BOOK 1 : THE HEARTS THIEF ❣️ Happy 1 year, my love! I can't believe it's been a year since we started dating? Time really flies when you're in love, and with you by my side, every moment feels like a dream come true. This past month has been filled with so much love and laughter, from hanging out, going on walks, to our fancy dates. Every moment spent with you is a treasure I hold dear to my heart, and I am endlessly grateful for your presence in my life. You are my rock, my anchor in a sea of uncertainty, and I am constantly in awe of your strength and resilience. You always manage to calm down my nerves and stress and I'll always be grateful for that. Your unwavering love and support mean the world to me, and I feel blessed to have you by my side through thick and thin. I love the way your eyes light up when you talk about the things you love, and the way your laughter fills the room with warmth and joy. You are truly one of a kind, and I am grateful for every moment we share together. As we celebrate our first year of love and happiness, I want you to know just how much you mean to me. You are my everything, my reason for smiling each day, and I will cherish you for eternity. END OF BOOK 1 💕",
        "2024-02-19": "December 26, 2023: To: My soulmate ❤️ Happy 13 months anniversary, my love! Can you believe it's been over a year since we starting dating? Time truly flies when you're deeply in love, and with you by my side, every moment feels like a blessing. This past month has been filled with so much love and happiness, from our dates and all our outings. I love the way your smile lights up my world, and the way your laughter fills my heart with joy. You are truly one of a kind, and I am grateful for every moment we share together. As we celebrate another milestone in our relationship, I want you to know just how much you mean to me. You are my everything, my reason for trying, you make me want to better myself everyday for you and I will cherish you for eternity. Here's to many more years of love, laughter, and unforgettable memories together. I love you,  Your boyfriend forever (hopefully) ❤️",
        "2024-02-20": "January 26, 2024: To: My Sweetheart 💖 Happy 14 months of us being utterly amazing together! Can you even believe it's been that long? Feels like just yesterday we were stumbling into each other's lives, and now look at us, still going strong and loving each other more than ever! This past month has been a wild ride, filled with so many moments that I'll treasure forever. From our dates to our outings with friends that always end in laughter, it's been an absolute blast. I just gotta say, you're my rock, babe. Your smile? It's like sunshine on a rainy day, and your laugh? It's my favorite sound in the whole world. Seriously, you light up my life in ways I never knew possible. So here's to us, my love. Here's to many more months of making memories, chasing dreams, and loving each other like crazy. I'm so grateful you're mine. Forever and always, Your boyfriend 💖 P.S see you soon!!!!!!",
        "2024-02-21": "I always knew you were the best The coolest girl I know So prettier than all the rest The star of my show So many times I wished you'd be the one for meI never knew it'd get like this, girl, what you do to me You're who I'm thinking of Girl, you ain't my runner-up And no matter what you're always number one My prized possession One and only Adore ya Girl, I want ya The one I can't live without, that's you, that's you You're my special Little lady The one that makes me crazy Of all the girls I've ever known, it's you, it's you My favorite, my favorite, my favorite My favorite girl, my favorite girl You're used to going out your way to impress these Mr. Wrongs But you can be yourself for me, I'll take you as you are I know they said, Believe in love, is a dream that can't be real So, girl, let's write a fairy tale And show 'em how we feel You're who I'm thinking of Girl, you ain't my runner-up And no matter what you're always number one My prized possession One and only Adore ya Girl, I want ya The one I can't live without, that's you, that's you You're my special little lady The one that makes me crazy Of all the girls I've ever known, it's you, it's you My favorite, my favorite, my favorite My favorite girl, my favorite girl My favorite, my favorite, my favorite My favorite girl, my favorite girl You take my breath away With everything you say I just wanna be with you My baby, my baby, oh Promise I'll play no games Treat you no other way than you deserve 'Cause you're the girl of my dreams My prized possession One and only Adore ya Girl, I want ya The one I can't live without that's you, that's you You're my special little lady The one that makes me crazy Of all the girls I've ever known, it's you, it's you I want you (The one I can't live without, that's you), that's you, (that's you), that's you (You're my special little lady) You're my special little lady (The one that makes me crazy) The one that makes me crazy (Of all the girls I've ever known, it's you, it's you) You're my favorite girl (My favorite, my favorite, my favorite) My favorite girl (My favorite girl, my favorite girl) My favorite girl (My favorite, my favorite, my favorite) My favorite girl (My favorite girl, my favorite girl) My favorite girl",
        "2024-02-22": "Oh, her eyes, her eyes Make the stars look like they're not shinin' Her hair, her hair Falls perfectly without her tryin' She's so beautiful and I tell her everyday Yeah, I know, I know When I compliment her, she won't believe me And it's so, it's so Sad to think that she don't see what I see But every time she asks me, Do I look okay? I say When I see your face There's not a thing that I would change 'Cause you're amazing Just the way you are And when you smile The whole world stops and stares for a while 'Cause girl, you're amazing Just the way you are Yeah Her lips, her lips I could kiss them all day if she'd let me Her laugh, her laugh She hates, but I think it's so sexy She's so beautiful and I tell her everyday Oh, you know, you know You know I'd never ask you to change If perfect's what you're searchin' for, then just stay the same So don't even bother askin' if you look okay You know I'll say When I see your face There's not a thing that I would change 'Cause you're amazing Just the way you are And when you smile The whole world stops and stares for a while 'Cause girl, you're amazing Just the way you are The way you are The way you are Girl, you're amazing Just the way you are When I see your face There's not a thing that I would change 'Cause you're amazing Just the way you are And when you smile The whole world stops and stares for a while 'Cause girl, you're amazing Just the way you are Yeah",
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
