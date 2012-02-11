//
//  SeaquationsGoVertexViewController.h
//  seaquations
//
//  Created by goVertex on 10/17/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
#import "SubscribeAlertView.h"

@protocol SeaquationsGoVertexViewControllerDelegate <NSObject>

- (void)dismissGoVertexViewController;

@end

@interface SeaquationsGoVertexViewController : UIViewController <MFMailComposeViewControllerDelegate>
{
    id delegate;
}
@property (nonatomic, assign) id delegate;

@end