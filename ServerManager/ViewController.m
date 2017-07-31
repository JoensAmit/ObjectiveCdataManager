//
//  ViewController.m
//  ServerManager
//
//  Created by Amit Tiwari on 7/31/17.
//  Copyright © 2017 Amit Tiwari. All rights reserved.
//

#import "ViewController.h"
#import "ServerManager.h"
@interface ViewController ()
{
    ServerManager*jsonObject;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self SendRequestToServer];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)SendRequestToServer
{
    NSURL *url = [NSURL URLWithString:@"https://www.googleapis.com/books/v1/volumes?q=isbn:0747532699"];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    request.HTTPMethod = @"GET";
    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
    
    jsonObject  =[ServerManager new];
    [jsonObject CallAPIwithRequest:request Sender:self];
    
}
-(void)ResponseObject:(id)RsponseFromServer
{
    NSLog(@"%@",RsponseFromServer);

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
