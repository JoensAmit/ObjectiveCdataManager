//
//  ServerManager.m
//  ServerManager
//
//  Created by Amit Tiwari on 7/31/17.
//  Copyright © 2017 Amit Tiwari. All rights reserved.
//

#import "ServerManager.h"

@implementation ServerManager
-(void)CallAPIwithRequest:(NSMutableURLRequest *)request Sender:(id)sender
{
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *taskSession = [session dataTaskWithRequest:request
                                            completionHandler:
                                  ^(NSData *data, NSURLResponse *response, NSError *error) {
                                      NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
                                      NSLog(@"%ld===Response Code recived from Server post",(long)httpResponse.statusCode);
                                      
                                      dispatch_async(dispatch_get_main_queue(), ^{
                                          NSDictionary *Response;
                                          if (data.length > 0 && error == nil)
                                          {
                                              
                                              Response = [NSJSONSerialization JSONObjectWithData:data options:2 error:NULL];
                                              
                                 
                                                  [sender performSelectorOnMainThread:@selector(ResponseObject:) withObject:Response waitUntilDone:NO];
                                          }
                                      });
                                  }];
    [taskSession resume];
}

@end
