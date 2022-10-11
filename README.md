# Hysteria
Express poetry '시골 창녀 (김이듬)' in random language (🇰🇷, 🇺🇸, 🇨🇳) for each phrase every second

## Preview
![화면 기록 2022-10-11 오후 11 11 20](https://user-images.githubusercontent.com/20410193/195115407-3345cf9f-e52a-4af7-aa1f-67403da2ae0f.gif)

## Constants

The UI can be modified by changing the values below

```swift
    enum Constants {
        static let timerInterval: Double = 1
        static let horizontalPadding: CGFloat = 500
        static let fontName: String = "NotoSerifKR-Regular"
        static let fontSize: CGFloat = 14
    }
```

## Precautions
-  `horizontalPadding` is set by 500,  so in order to see the content well, the app screen must be extended by a certain length.
- It is not scrollable
- It would be nice if the `NotoSerifKR-Regular` font was installed on your MacBook.

## Environments
- Xcode 14.0.0
- Deployment Target : macOS 12.3
- Swift 5.7

## Dedicate to
Renee Cha, with love

