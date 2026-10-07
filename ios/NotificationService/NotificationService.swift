import UserNotifications

/// Attaches the post's picture to incoming push notifications. The backend sends
/// the URL in `fcm_options.image` together with `mutable-content: 1`; without a
/// picture iOS shows the app icon instead.
class NotificationService: UNNotificationServiceExtension {
  private var contentHandler: ((UNNotificationContent) -> Void)?
  private var bestAttemptContent: UNMutableNotificationContent?

  override func didReceive(
    _ request: UNNotificationRequest,
    withContentHandler contentHandler: @escaping (UNNotificationContent) -> Void
  ) {
    self.contentHandler = contentHandler
    bestAttemptContent = request.content.mutableCopy() as? UNMutableNotificationContent

    guard bestAttemptContent != nil, let url = Self.imageURL(from: request.content.userInfo) else {
      finish()
      return
    }

    URLSession.shared.downloadTask(with: url) { [weak self] location, response, _ in
      defer { self?.finish() }
      guard let self = self, let location = location, let content = self.bestAttemptContent else { return }

      let file = FileManager.default.temporaryDirectory
        .appendingPathComponent(UUID().uuidString)
        .appendingPathExtension(Self.fileExtension(for: response, url: url))
      do {
        try FileManager.default.moveItem(at: location, to: file)
        let attachment = try UNNotificationAttachment(identifier: "image", url: file, options: nil)
        content.attachments = [attachment]
      } catch {
        NSLog("NotificationService: could not attach image: \(error)")
      }
    }.resume()
  }

  override func serviceExtensionTimeWillExpire() {
    finish()
  }

  // The system must be called back exactly once, either after the download or on timeout.
  private func finish() {
    guard let handler = contentHandler else { return }
    contentHandler = nil
    if let content = bestAttemptContent {
      handler(content)
    }
  }

  private static func imageURL(from userInfo: [AnyHashable: Any]) -> URL? {
    let fcmOptions = userInfo["fcm_options"] as? [String: Any]
    let value = (fcmOptions?["image"] as? String) ?? (userInfo["image"] as? String)
    guard let string = value, !string.isEmpty else { return nil }
    return URL(string: string)
  }

  // UNNotificationAttachment infers the type from the file extension.
  private static func fileExtension(for response: URLResponse?, url: URL) -> String {
    switch response?.mimeType {
    case "image/png": return "png"
    case "image/gif": return "gif"
    case "image/jpeg", "image/jpg": return "jpg"
    default: return url.pathExtension.isEmpty ? "jpg" : url.pathExtension
    }
  }
}
