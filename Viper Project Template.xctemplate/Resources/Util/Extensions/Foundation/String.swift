import Foundation

// MARK:- STRINGS EXTENSION
public extension String {
    
    // MARK: - COMPUTED PROPETIES
    var length: Int {
        return self.characters.count
    }
    var reversed: String {
        return String(self.characters.reversed())
    }
    var isPalindrome: Bool {
        return self == reversed
    }
    var trimmed: String {
        return self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }
    var firstWord: String {
        return self.components(separatedBy: " ")[0]
    }
    var lastWord: String? {
        return self.components(separatedBy: " ").last
    }
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
    
    var fileExtension: String {
        return (self as NSString).pathExtension
    }
    var fileName: String {
        return (self as NSString).deletingPathExtension
    }
    var fileLocation: String {
        return (self as NSString).deletingLastPathComponent
    }
    
    // MARK: Character search
    func charAt(index: Int) -> Character? {
        guard index < self.length  else { return nil }
        return self[self.index(startIndex, offsetBy: index)]
    }
    // MARK: Word At Index
    func wordAt(index: Int) -> String? {
        let components = self.components(separatedBy: " ")
        guard components.count > index else { return nil }
        return components[index]
    }
    // MARK: - Equality Check
    func equalTo(string: String, compareOption: CompareOptions) -> Bool {
        return self.length == string.length &&
            self.hasSubString(string: string, compareOption: compareOption)
    }
    func equalsToIgnoringCase(string: String) -> Bool {
        return equalTo(string: string, compareOption: .caseInsensitive)
    }
    func equalToWithCase(string: String) -> Bool {
        return equalTo(string: string, compareOption: .literal)
    }
    
    // MARK: - REPLACING
    mutating func replace(string: String, with replacement: String) {
        self = self.replacingOccurrences(of: string, with: replacement)
    }
    // MARK: SUBSTRING GENERATION
    func subString(start: Int, length: Int) -> String? {
        if start + length <= self.length {
            let subStringEndIndex = self.index(startIndex, offsetBy: length)
            return self.substring(with: startIndex..<subStringEndIndex)
        } else {
            return nil
        }
    }
    func prefixWithLength(length: Int) -> String? {
        guard length <= self.length else { return nil }
        return substring(to: self.index(startIndex, offsetBy: length))
    }
    func sufixWithLength(length: Int) -> String? {
        guard self.index(self.endIndex, offsetBy: -length) > self.startIndex else {
            return nil
        }
        let rangeStart = self.index(self.endIndex, offsetBy: -length)
        return substring(with: rangeStart..<endIndex)
        
    }
    func subStringUptoString(string: String) -> String? {
        guard let index = self.range(of: string, options: .caseInsensitive) else {
            return nil
        }
        return self.substring(to: index.lowerBound)
    }
    
    // MARK: - CUSTOM OPERATORS
    static func * (lsh: String, times: Int) -> String {
        return Array(repeatElement(lsh, count: times)).joined(separator: "")
    }
    
    // MARK: - LOCALIZATION
    func localizedWithComment(comment: String?) -> String {
        return NSLocalizedString(self, comment: comment ?? "")
    }
    func hasSubString(string: String, compareOption: CompareOptions = .caseInsensitive) -> Bool {
        return self.range(of: string, options: compareOption) != nil
    }
    
    
    
}
