//
//  UNAMMobileTwitter.m
//  SOS
//
//  Created by Julio César on 5/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "UNAMMobileTwitter.h"

@interface UNAMMobileTwitter() {
@private
    ACAccountStore *store;
    ACAccountType *twitterAccountType;
    
    NSMutableArray *ids;
}

-(void) initUNAMMobileTwitter;

@end

@implementation UNAMMobileTwitter

- (id)init
{
    self = [super init];
    if (self) {
        [self initUNAMMobileTwitter];
    }
    return self;
}

-(void)initUNAMMobileTwitter
{
    //  First, we need to obtain the account instance for the user's Twitter account
    store = [[ACAccountStore alloc] init];
    twitterAccountType = [store accountTypeWithAccountTypeIdentifier:ACAccountTypeIdentifierTwitter];
}

-(void)test
{
    //  Request access from the user for access to his Twitter accounts
    [store requestAccessToAccountsWithType:twitterAccountType 
                     withCompletionHandler:^(BOOL granted, NSError *error) {
                         if (!granted) {
                             // The user rejected your request 
                             NSLog(@"User rejected access to his account.");
                         } 
                         else {
                             // Grab the available accounts
                             NSArray *twitterAccounts = 
                             [store accountsWithAccountType:twitterAccountType];
                             
                             if ([twitterAccounts count] > 0) {
                                 // Use the first account for simplicity 
                                 ACAccount *account = [twitterAccounts objectAtIndex:0];
                                 
                                 // Now make an authenticated request to our endpoint
                                 NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
                                 [params setObject:@"juiiocesar" forKey:@"screen_name"];
                                 
                                 
                                 //  The endpoint that we wish to call
                                 NSURL *url = 
                                 [NSURL 
                                  URLWithString:@"https://api.twitter.com/1/followers/ids.json"];
                                 
                                 //  Build the request with our parameter 
                                 TWRequest *request = 
                                 [[TWRequest alloc] initWithURL:url 
                                                     parameters:params 
                                                  requestMethod:TWRequestMethodGET];
                                 
                                 // Attach the account object to this request
                                 [request setAccount:account];
                                 
                                 [request performRequestWithHandler:
                                  ^(NSData *responseData, NSHTTPURLResponse *urlResponse, NSError *error) {
                                      if (!responseData) {
                                          // inspect the contents of error 
                                          NSLog(@"%@", error);
                                      } 
                                      else {
                                          NSError *jsonError;
                                          NSArray *timeline = 
                                          [NSJSONSerialization 
                                           JSONObjectWithData:responseData 
                                           options:NSJSONReadingMutableLeaves 
                                           error:&jsonError];            
                                          if (timeline) {                          
                                              // at this point, we have an object that we can parse
                                              NSLog(@"%@", timeline);
                                          } 
                                          else { 
                                              // inspect the contents of jsonError
                                              NSLog(@"%@", jsonError);
                                          }
                                      }
                                  }];
                                 
                             } // if ([twitterAccounts count] > 0)
                         } // if (granted) 
                     }];
}

-(void)lookup
{
    //  Request access from the user for access to his Twitter accounts
    [store requestAccessToAccountsWithType:twitterAccountType 
                     withCompletionHandler:^(BOOL granted, NSError *error) {
                         if (!granted) {
                             // The user rejected your request 
                             NSLog(@"User rejected access to his account.");
                         } 
                         else {
                             // Grab the available accounts
                             NSArray *twitterAccounts = 
                             [store accountsWithAccountType:twitterAccountType];
                             
                             if ([twitterAccounts count] > 0) {
                                 // Use the first account for simplicity 
                                 ACAccount *account = [twitterAccounts objectAtIndex:0];
                                 
                                 // Now make an authenticated request to our endpoint
                                 NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
                                 [params setObject:@"93055131" forKey:@"user_id"];
                                 
                                 
                                 //  The endpoint that we wish to call
                                 NSURL *url = 
                                 [NSURL 
                                  URLWithString:@"https://api.twitter.com/1/users/lookup.json"];
                                 
                                 //  Build the request with our parameter 
                                 TWRequest *request = 
                                 [[TWRequest alloc] initWithURL:url 
                                                     parameters:params 
                                                  requestMethod:TWRequestMethodGET];
                                 
                                 // Attach the account object to this request
                                 [request setAccount:account];
                                 
                                 [request performRequestWithHandler:
                                  ^(NSData *responseData, NSHTTPURLResponse *urlResponse, NSError *error) {
                                      if (!responseData) {
                                          // inspect the contents of error 
                                          NSLog(@"%@", error);
                                      } 
                                      else {
                                          NSError *jsonError;
                                          NSArray *timeline = 
                                          [NSJSONSerialization 
                                           JSONObjectWithData:responseData 
                                           options:NSJSONReadingMutableLeaves 
                                           error:&jsonError];            
                                          if (timeline) {                          
                                              // at this point, we have an object that we can parse
                                              NSLog(@"%@", timeline);
                                          } 
                                          else { 
                                              // inspect the contents of jsonError
                                              NSLog(@"%@", jsonError);
                                          }
                                      }
                                  }];
                                 
                             } // if ([twitterAccounts count] > 0)
                         } // if (granted) 
                     }];

}

-(NSMutableArray *)getFriendsMutableArray
{
    [self idFriendRequest];
    return nil;
}

-(void)idFriendRequest
{ 
    //  Request access from the user for access to his Twitter accounts
    [store requestAccessToAccountsWithType:twitterAccountType 
                     withCompletionHandler:^(BOOL granted, NSError *error) {
                         if (!granted) {
                             // The user rejected your request 
                             NSLog(@"User rejected access to his account.");
                         } 
                         else {
                             // Grab the available accounts
                             NSArray *twitterAccounts = 
                             [store accountsWithAccountType:twitterAccountType];
                             
                             if ([twitterAccounts count] > 0) {
                                 // Use the first account for simplicity 
                                 ACAccount *account = [twitterAccounts objectAtIndex:0];
                                 
                                 // Now make an authenticated request to our endpoint
                                 NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
                                 [params setObject:@"juiiocesar" forKey:@"screen_name"];
                                 
                                 
                                 //  The endpoint that we wish to call
                                 NSURL *url = 
                                 [NSURL 
                                  URLWithString:@"https://api.twitter.com/1/followers/ids.json"];
                                 
                                 //  Build the request with our parameter 
                                 TWRequest *request = 
                                 [[TWRequest alloc] initWithURL:url 
                                                     parameters:params 
                                                  requestMethod:TWRequestMethodGET];
                                 
                                 // Attach the account object to this request
                                 [request setAccount:account];
                                 
                                 [request performRequestWithHandler:
                                  ^(NSData *responseData, NSHTTPURLResponse *urlResponse, NSError *error) {
                                      if (!responseData) {
                                          // inspect the contents of error 
                                          NSLog(@"%@", error);
                                      } 
                                      else {
                                          NSError *jsonError;
                                           NSMutableDictionary *timeline = 
                                          [NSJSONSerialization 
                                           JSONObjectWithData:responseData 
                                           options:NSJSONReadingMutableLeaves 
                                           error:&jsonError];
                                          if (timeline) {       
                                              NSLog(@"%@", [timeline objectForKey:@"ids"]);
                                              ids = [timeline objectForKey:@"ids"];
                                          } 
                                          else { 
                                              // inspect the contents of jsonError
                                              NSLog(@"%@", jsonError);
                                          }
                                      }
                                  }];
                                 
                             } // if ([twitterAccounts count] > 0)
                         } // if (granted) 
                     }];
}



@end
