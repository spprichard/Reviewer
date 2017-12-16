import Foundation
typealias TaggedToken = (String, String)

private func tagNames(text: String) -> [TaggedToken] {
    let tagger = NSLinguisticTagger(tagSchemes: [.nameType], options: 0)
    tagger.string = text
    let range = NSRange(location:0, length: text.utf16.count)
    let options: NSLinguisticTagger.Options = [.omitPunctuation, .omitWhitespace, .joinNames]
    let tags: [NSLinguisticTag] = [.personalName, .placeName, .organizationName]
    //    var tokens: [NSLinguisticTag] = []
    var tokens: [TaggedToken] = []
    if #available(OSX 10.13, *) {
        tagger.enumerateTags(in: range, unit: .word, scheme: .nameType, options: options) { tag, tokenRange, stop in
            if let tag = tag, tags.contains(tag) {
                let name = (text as NSString).substring(with: tokenRange as NSRange)
                print("\(tag.rawValue): \(name)")
                tokens.append((tag.rawValue, name))
            }
        }
    } else {
        // Fallback on earlier versions
        print("...but why haven't you upgraded? Are you noy HIGH on Sierra?...")
    }
    return tokens
}

let someText = "I've only touched the tip of iceberg with this one.  This app inspects your data and makes the smart recommendations for you.  What should you bundle together?  What should you setup for recurring purchase?  This does analysis and makes it easy to turn those types of offers on and off.   If its like any other bold app, the functionality will keep getting extended.  Bold makes some of the best apps for shopify store owners and, tangential plug, has the best professional services team to help tweak your site when you need it (yes, we all need it).   I've tried other shops but that ended when I found James and his professional services team @ Bold.  Thanks guys for 4 years of service and counting!"
let tokens = tagNames(text: someText)
print("some tokens: \(tokens)")


