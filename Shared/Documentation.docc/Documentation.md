# ``Infoeduka (iOS)``

<!--@START_MENU_TOKEN@-->Summary<!--@END_MENU_TOKEN@-->

## Past Debugging Code 

### Sort through all fonts
```swift
for family: String in UIFont.familyNames {
    print(family)
    for names: String in UIFont.fontNames(forFamilyName: family) {
        print("== \(names)")
    }
}
```

### Prolongue launch screen to view launch animation
```swift
var animTest: Bool {
    do {
        sleep(2)
    }
    return true
}

...
var body: some Scene {
    WindowGroup {
        if animTest {
            ...
        }
    }
}
```
