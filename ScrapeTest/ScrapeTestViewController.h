//
//  ScrapeTestViewController.h
//  ScrapeTest
//
//  Created by Luke Ma on 11/1/13.
//  Copyright (c) 2013 Blue Jeans Network. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScrapeTestViewController : UIViewController<UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UILabel *renderInContext0;
@property (weak, nonatomic) IBOutlet UILabel *renderInContext1;
@property (weak, nonatomic) IBOutlet UILabel *renderInContext2;
@property (weak, nonatomic) IBOutlet UILabel *drawViewHierarchyInRect;

- (IBAction)startTests:(id)sender;

- (IBAction)capture0:(id)sender;
- (IBAction)capture1:(id)sender;
- (IBAction)capture2:(id)sender;
- (IBAction)captureDV:(id)sender;


@end
