//
//  ScrapeTestViewController.m
//  ScrapeTest
//
//  Created by Luke Ma on 11/1/13.
//  Copyright (c) 2013 Luke Ma. Some lefts reserved for 8PM, 4-top.
//

#import "ScrapeTestViewController.h"

@interface ScrapeTestViewController ()

@end

@implementation ScrapeTestViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSString *url = @"http://google.com";
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:url]]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)startTests:(id)sender {
    NSLog(@"Starting tests");
    [self test:YES withScale:0.0 updateLabel:self.renderInContext0];
    [self test:YES withScale:1.0 updateLabel:self.renderInContext1];
    [self test:YES withScale:2.0 updateLabel:self.renderInContext2];
    [self test:NO withScale:1.0 updateLabel:self.drawViewHierarchyInRect];
}

- (IBAction)capture0:(id)sender {
    [self scrape:YES withScale:0.0 andSave:YES];
}

- (IBAction)capture1:(id)sender {
    [self scrape:YES withScale:1.0 andSave:YES];
}

- (IBAction)capture2:(id)sender {
    [self scrape:YES withScale:2.0 andSave:YES];
}

- (IBAction)captureDV:(id)sender {
    [self scrape:NO withScale:0.0 andSave:YES];
}

-(void) test:(BOOL)isRIC withScale:(float)scale updateLabel:(UILabel*)label {
    double average = 0;
    for (int i = 0; i < 20; i++) {
        double timeTaken = [self scrape:isRIC withScale:scale andSave:NO];
        average = (average + timeTaken) / (i+1);
        label.text = [NSString stringWithFormat:@"%f", timeTaken];
    }
}

-(double) scrape:(BOOL)isRIC withScale:(float)scale andSave:(BOOL)save {
     double startTime = CACurrentMediaTime();
    UIGraphicsBeginImageContextWithOptions(self.webView.bounds.size, YES, scale);
    if (isRIC) {
        [self.webView.layer renderInContext:UIGraphicsGetCurrentContext()];
    } else {
        [self.webView drawViewHierarchyInRect:self.webView.bounds afterScreenUpdates:NO];
    }
    if (save) {
        UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
        UIImageWriteToSavedPhotosAlbum(img, nil, nil, nil);
    }
    UIGraphicsEndImageContext();
    double timeTaken = CACurrentMediaTime() - startTime;
    NSLog(@"Graphics context ended: %f", timeTaken);
    return timeTaken;
}

@end
