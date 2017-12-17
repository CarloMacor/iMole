//
//  iMoleFreeAppDelegate.h
//  iMoleFree
//
//  Created by Carlo Macor on 02/02/10.
//  Copyright Carlo Macor 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class iMoleFreeViewController;

@interface iMoleFreeAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    iMoleFreeViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet iMoleFreeViewController *viewController;

@end

