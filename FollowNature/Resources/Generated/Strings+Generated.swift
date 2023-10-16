// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {
  /// Все
  internal static let allSelected = L10n.tr("Localizable", "allSelected", fallback: "Все")
  /// Нажими на жучка
  /// Создай свой список “Выбранное
  internal static let clickOntheBugOrCreateYourSelectedList = L10n.tr("Localizable", "clickOntheBugOrCreateYourSelectedList", fallback: "Нажими на жучка\nСоздай свой список “Выбранное")
  /// Узнать больше
  internal static let details = L10n.tr("Localizable", "details", fallback: "Узнать больше")
  /// Введите название растения
  internal static let enterPlantName = L10n.tr("Localizable", "enterPlantName", fallback: "Введите название растения")
  /// Localizable.strings
  ///   FollowNature
  /// 
  ///   Created by Andrey Pozdnyakov on 12.09.2023.
  internal static let home = L10n.tr("Localizable", "home", fallback: "Главная")
  /// Сделай фото чтобы повысить его!
  internal static let makeAPhoto = L10n.tr("Localizable", "makeAPhoto", fallback: "Сделай фото чтобы повысить его!")
  /// Блокнот
  internal static let notepad = L10n.tr("Localizable", "notepad", fallback: "Блокнот")
  /// Профиль
  internal static let profile = L10n.tr("Localizable", "profile", fallback: "Профиль")
  /// Выбранное
  internal static let selected = L10n.tr("Localizable", "selected", fallback: "Выбранное")
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
