# Styling

## Table of contents

- [Context](#context)
- [Demo](#demo)
- [Installation](#installation)
- [Third-party component licenses](#third-party-component-licenses)
   - [Tools](#tools)

## Context

This repository contains the source code of of Styling, a framework to help style UI elements with functions.

## Demo

```sh
git https://github.com/jrBordet/Styling.git
cd Styling

xcodegen
pod install
```

# Installation

To integrate the library into your project add the follwing lines to your Podfile

```ruby
source "https://github.com/jrBordet/RxFramework.podspec.git"
source "https://cdn.cocoapods.org/"

pod 'Styling', '0.0.1'
```

```ruby
pod install
```

## Frameworks


| Pod               | Version         
| -------------     |:-------------:| 
| RxSwift           | 5.0.x         |
| RxCocoa           | 5.0.x         |

## Third-party component licenses

### Tools

| Name                                                        | License                   |
| ----------------------------------------------------------- | ------------------------- |
| [Brew](https://brew.sh/)                                    | BSD 2-Clause 'Simplified' |
| [Cocoapods](https://cocoapods.org/)                         | MIT                       |
| [XcodeGen](https://github.com/yonaskolb/XcodeGen)           | MIT                       |
