//
//  UNAMMobileFacebook.m
//  SOS
//
//  Created by Julio César on 5/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "UNAMMobileFacebook.h"

@interface UNAMMobileFacebook() {
@private
    
}
@end


@implementation UNAMMobileFacebook

@synthesize facebook;

-(id)init
{
    facebook = [[Facebook alloc] initWithAppId:@"324209277606758" andDelegate:self];
    
    NSMutableDictionary* params = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                   @"Come check out my app.",  @"message",
                                   nil];
    
    [facebook dialog:@"apprequests"
           andParams:params
         andDelegate:self];
    
    return self;
}

- (void)fbDidLogin
{
    NSLog(@"fbDidLogin");
}

- (void)fbDidNotLogin:(BOOL)cancelled
{
    NSLog(@"fbDidNotLogin");
}


- (void)fbDidExtendToken:(NSString*)accessToken
               expiresAt:(NSDate*)expiresAt
{
    NSLog(@"fbDidExtendToken");
}

- (void)fbDidLogout
{
    NSLog(@"fbDidLogout");
}

- (void)fbSessionInvalidated
{
    NSLog(@"fbSessionInvalidated");
}



@end
