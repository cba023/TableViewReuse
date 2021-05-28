//
//  UITableView+Reuse.h
//  TableViewReuse
//
//  Created by bo.chen on 2021/5/28.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITableView (Reuse)

/// Reuse cell with any class. (Objective-C)
- (id)reuseCellWithAnyClass:(Class)aClass;

/// Reuse cell with nib class and bundle. (Objective-C)
- (id)reuseCellWithNibClass:(Class)nibClass bundle:(NSBundle *)bundle;

/// Reuse cell with nib class. (Objective-C)
- (id)reuseCellWithNibClass:(Class)nibClass;

/// Reuse header or footer with nib and bundle. (Objective-C)
- (id)reuseHeaderFooterWithNib:(Class)nibClass bundle:(NSBundle *)bundle;

/// Reuse header or footer with nib. (Objective-C)
- (id)reuseHeaderFooterWithNib:(Class)nibClass;

/// Reuse cell with any class. (Objective-C)
- (id)reuseHeaderFooterWithAnyClass:(Class)aClass;


@end

NS_ASSUME_NONNULL_END
