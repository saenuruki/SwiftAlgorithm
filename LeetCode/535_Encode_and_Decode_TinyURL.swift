class Codec {
    
    var cacheTable = [String: String]()
    let domain = "https://tinyurl.com/"

    // Encodes a URL to a shortened URL.
    func encode(_ longUrl: String) -> String {
        let key = String(longUrl.hashValue, radix: 16)
        cacheTable[key] = longUrl
        return domain + key
    }
    
    // Decodes a shortened URL to its original URL.
    func decode(_ shortUrl: String) -> String {
        let key = shortUrl.replacingOccurrences(of: domain, with: "")
        return cacheTable[key] ?? shortUrl
    }
}

/**
 * Your Codec object will be instantiated and called as such:
 * let obj = Codec()
 * val s = obj.encode(longUrl)
 * let ans = obj.decode(s)
*/
