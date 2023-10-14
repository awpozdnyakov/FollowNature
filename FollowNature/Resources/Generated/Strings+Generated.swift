// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {
  /// Андрей
  internal static let andrew = L10n.tr("Localizable", "andrew", fallback: "Андрей")
  /// Связь с разработчиками
  internal static let connection = L10n.tr("Localizable", "connection", fallback: "Связь с разработчиками")
  /// Узнать больше
  internal static let details = L10n.tr("Localizable", "details", fallback: "Узнать больше")
  /// Localizable.strings
  ///   FollowNature
  /// 
  ///   Created by Andrey Pozdnyakov on 12.09.2023.
  internal static let home = L10n.tr("Localizable", "home", fallback: "Главная")
  /// Сделай фото чтобы повысить его!
  internal static let makeAPhoto = L10n.tr("Localizable", "makeAPhoto", fallback: "Сделай фото чтобы повысить его!")
  /// Мое “Выбраное”
  internal static let mySelected = L10n.tr("Localizable", "mySelected", fallback: "Мое “Выбраное”")
  /// Блокнот
  internal static let notepad = L10n.tr("Localizable", "notepad", fallback: "Блокнот")
  /// Профиль
  internal static let profile = L10n.tr("Localizable", "profile", fallback: "Профиль")
  /// Регина
  internal static let rehina = L10n.tr("Localizable", "rehina", fallback: "Регина")
  /// Запросов выполнено
  internal static let requests = L10n.tr("Localizable", "requests", fallback: "Запросов выполнено")
  /// Шамиль
  internal static let shamil = L10n.tr("Localizable", "shamil", fallback: "Шамиль")
  /// Тилек
  internal static let tilek = L10n.tr("Localizable", "tilek", fallback: "Тилек")
  /// https://github.com/awpozdnyakov
  internal static let urlAndrew = L10n.tr("Localizable", "urlAndrew", fallback: "https://github.com/awpozdnyakov")
  /// https://github.com/riitterz
  internal static let urlRehina = L10n.tr("Localizable", "urlRehina", fallback: "https://github.com/riitterz")
  /// https://github.com/ShAglarov
  internal static let urlShamil = L10n.tr("Localizable", "urlShamil", fallback: "https://github.com/ShAglarov")
  /// https://github.com/ti1ek
  internal static let urlTilek = L10n.tr("Localizable", "urlTilek", fallback: "https://github.com/ti1ek")
  /// Твой уровень
  internal static let yourLevel = L10n.tr("Localizable", "yourLevel", fallback: "Твой уровень")
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg..., fallback value: String) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: value, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
