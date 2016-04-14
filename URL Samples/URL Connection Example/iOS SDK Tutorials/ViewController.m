//
//  ViewController.m
//  iOS SDK Tutorials
//
//  Created by Sonar Systems on 14/04/2016.
//  Copyright © 2016 Sonar Systems. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- ( void )viewDidLoad
{
    [super viewDidLoad];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    // insert whatever URL you would like to connect to
    [request setURL:[NSURL URLWithString:@"http://sonarsystems.co.uk/DeveloperTools/Tutorials/iOS_SDK/URLConnect.php"]];
    
    NSURLSessionDataTask *task = [[self getURLSession] dataTaskWithRequest:request completionHandler:^( NSData *data, NSURLResponse *response, NSError *error )
    {
        dispatch_async( dispatch_get_main_queue(),
        ^{
            // parse returned data
            NSString *result = [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding];
            
            NSLog( @"%@", result );
        } );
      
    }];
    
    [task resume];
}

- ( NSURLSession * )getURLSession
{
    static NSURLSession *session = nil;
    static dispatch_once_t onceToken;
    dispatch_once( &onceToken,
    ^{
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        session = [NSURLSession sessionWithConfiguration:configuration];
    } );
    
    return session;
}

- ( void )didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
