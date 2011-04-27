//
//  DynamicHTMLWebViewController.m
//  MathTest
//
//  Created by Dan Lynch on 4/27/11.
//  Copyright 2011 UC Berkeley. All rights reserved.
//

#import "DynamicHTMLWebViewController.h"


@implementation DynamicHTMLWebViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        
        UIWebView * webview = [[UIWebView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
        
        NSString * setHtml = @"<!DOCTYPE html><html><head><title>MathJax</title><script type=\"text/javascript\" src=\"MathJax/MathJax.js\"></script><script type=\"text/x-mathjax-config\">MathJax.Hub.Config({tex2jax: {inlineMath: [[\"$\",\"$\"],[\"\\(\",\"\\)\"]]}});</script></head><body><br><br><h1>MathJax Test</h1><br><p>Here the HTML is dynamically inserted using loadHTMLString in a UIWebView, and the JavaScript and image are referenced from the resources of the application.</p><br><p>$$\\int_x^y f(x) dx$$</p><br><br><img src=\"images/test.jpg\"></body></html>"; 
        
//        [webview loadHTMLString:setHtml baseURL:[[NSBundle mainBundle] resourceURL]];

//        NSString * path = [[NSBundle mainBundle] resourcePath]; 
//        path = [path stringByReplacingOccurrencesOfString:@"/" withString:@"//"];
//        path = [path stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
//        
//        NSString * resourcesPath = [[NSString alloc] initWithFormat:@"file://%@/", path];
//        NSLog(@"%@", resourcesPath);
//        
//        [webview loadHTMLString:setHtml baseURL:[NSURL URLWithString:resourcesPath]];

        [webview loadHTMLString:setHtml 
                        baseURL:[NSURL fileURLWithPath:
                                 [[NSBundle mainBundle] bundlePath]]];
        
        
        [self setView: webview];
        [webview release];
        
        
    }
    return self;
}

- (void)dealloc
{
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}
*/

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
	return YES;
}

@end
