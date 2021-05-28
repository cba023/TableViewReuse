# TableViewReuse


[![Version](https://img.shields.io/cocoapods/v/TableViewReuse.svg?style=flat)](https://cocoapods.org/pods/TableViewReuse)
[![License](https://img.shields.io/cocoapods/l/TableViewReuse.svg?style=flat)](https://cocoapods.org/pods/TableViewReuse)
[![Platform](https://img.shields.io/cocoapods/p/TableViewReuse.svg?style=flat)](https://cocoapods.org/pods/TableViewReuse)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.


## Requirements

## Installation

TableViewReuse is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'TableViewReuse'
```

## Introduce

Easily UITableView cells,header and footer's reuse, make the code cleaner and shorter.

### Reuse Nib type TableViewCell

Traditional Style:

``` Swift
// Register cell
tableView.register(UINib(nibName: "NibListTableViewCell", bundle: nil), forCellReuseIdentifier: "NibListTableViewCell")
// Dequeue reusable cells
let cell = tableView.dequeueReusableCell(withIdentifier: "NibListTableViewCell", for: indexPath)
```

You can see the traditional means to reuse tableViewCell is troublesome.

Now:

So we have an easier way to do it.

```Swift
// Call the Swift API for Nib type TableViewCell
let cell = tableView.reuseCell(nibClass: NibListTableViewCell.self)
// Call the Objective-C API for Nib type TableViewCell
let cell = tableView.reuseCell(withNibClass: NibListTableViewCell.self) as! NibListTableViewCell
```

### Reuse Any Class type TableViewCell

Traditional Style:

```Swift
// Register cell
tableView.register(AnyClassTableViewCell.self, forCellReuseIdentifier: "AnyClassTableViewCell")
// Dequeue reusable cells
let cell = tableView.dequeueReusableCell(withIdentifier: "AnyClassTableViewCell.self", for: indexPath)
```

Now:

```Swift
// Call the Swift API for Any class TableViewCell
let cell = tableView.reuseCell(anyClass: AnyClassTableViewCell.self)
// Call the Objective-C API for Any class TableViewCell
let cell = tableView.reuseCell(withAnyClass: AnyClassTableViewCell.self) as! AnyClassTableViewCell
```


## Author

cba023, cba023@hotmail.com

## License

TableViewReuse is available under the MIT license. See the LICENSE file for more info.
