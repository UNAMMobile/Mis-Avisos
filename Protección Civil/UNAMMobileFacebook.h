//
//  UNAMMobileFacebook.h
//  SOS
//
//  Created by Julio César on 5/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Facebook.h"

@interface UNAMMobileFacebook : NSObject <FBSessionDelegate ,FBDialogDelegate>
{
    Facebook *facebook;
}

@property(nonatomic,retain) Facebook *facebook;

@end
