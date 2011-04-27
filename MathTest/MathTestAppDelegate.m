//
//  MathTestAppDelegate.m
//  MathTest
//
//  Created by Dan Lynch on 4/27/11.
//  Copyright 2011 UC Berkeley. All rights reserved.
//

#import "MathTestAppDelegate.h"

@implementation MathTestAppDelegate


@synthesize window=_window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    
    UIWebView * webview = [[UIWebView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
  
    bool useServer = false;
    
    if (!useServer) {
        NSString * setHtml = @"<!DOCTYPE html><html><head><title>MathJax</title><script type=\"text/javascript\" src=\"MathJax/MathJax.js\"></script><script type=\"text/x-mathjax-config\">MathJax.Hub.Config({tex2jax: {inlineMath: [[\"$\",\"$\"],[\"\\(\",\"\\)\"]]}});</script></head><body><h1>MathJax Test</h1><br><br><p>$$\\int_x^y f(x) dx$$</p><br><br><img src=\"images/test.jpg\"></body></html>"; 
        [webview loadHTMLString:setHtml baseURL:[[NSBundle mainBundle] resourceURL]];
        
        NSString * path = [[NSBundle mainBundle] resourcePath]; 
        path = [path stringByReplacingOccurrencesOfString:@"/" withString:@"//"];
        path = [path stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];

        NSString * resourcesPath = [[NSString alloc] initWithFormat:@"file://%@/", path];
        NSLog(@"%@", resourcesPath);
        
        [webview loadHTMLString:setHtml baseURL:[NSURL URLWithString:resourcesPath]];
    } else {
        NSString * setHtml = @"<!DOCTYPE html><html><head><title>MathJax</title><script type=\"text/javascript\" src=\"mathjax/MathJax.js?config=TeX-AMS_HTML-full\"></script><script type=\"text/x-mathjax-config\">MathJax.Hub.Config({tex2jax: {inlineMath: [[\"$\",\"$\"],[\"\\(\",\"\\)\"]]}});</script></head><body><h1>MathJax Test</h1><br><br><p>$$\\int_x^y f(x) dx$$</p></body></html>"; 
        [webview loadHTMLString:setHtml baseURL:[NSURL URLWithString:@"http://www.mathapedia.com"]];
    }

    
    
    
    [self.window addSubview:webview];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}

- (void)dealloc
{
    [_window release];
    [super dealloc];
}

@end
