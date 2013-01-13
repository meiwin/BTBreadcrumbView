//
//  BTViewController.h
//  BTFloatingMenu
//
//  Created by Meiwin Fu on 12/1/13.
//  Copyright (c) 2013 BlockThirty. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BTBreadcrumbView.h"

@interface BTViewController : UIViewController <BTBreadcrumbViewDelegate>
{
  BTBreadcrumbView * _breadcrumb;
}
@end
