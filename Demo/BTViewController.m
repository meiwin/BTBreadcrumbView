//
//  BTViewController.m
//  BTFloatingMenu
//
//  Created by Meiwin Fu on 12/1/13.
//  Copyright (c) 2013 BlockThirty. All rights reserved.
//

#import "BTViewController.h"

#define mRGBA(_red,_green,_blue,_alpha) \
[UIColor colorWithRed:(_red/255.0) green:(_green/255.0) blue:(_blue/255.0) alpha:_alpha]

@interface BTViewController ()

@end

@implementation BTViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
  self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
  if (self)
  {
    
  }
  return self;
}
- (void)loadView
{
  [super loadView];
  self.view.backgroundColor = mRGBA(148, 248, 200, 1);
  
  _breadcrumb = [[BTBreadcrumbView alloc] initWithFrame:CGRectMake(20, 75, 0, 0)];
  [_breadcrumb sizeToFit];
  [self.view addSubview:_breadcrumb];
  
  CGFloat cx = 20;
  CGFloat cy = 150;
  
  UIButton *button1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
  button1.tag = 1;
  [button1 setTitle:@"stakeholders" forState:UIControlStateNormal];
  [self.view addSubview:button1];
  button1.frame = CGRectMake(cx, cy, 200, 30);
  cy += 40;
  [button1 addTarget:self action:@selector(updateBreadcrumb:) forControlEvents:UIControlEventTouchUpInside];
  
  UIButton *button2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
  button2.tag = 2;
  [button2 setTitle:@"stakeholders > general" forState:UIControlStateNormal];
  [self.view addSubview:button2];
  button2.frame = CGRectMake(cx, cy, 200, 30);
  cy += 40;
  [button2 addTarget:self action:@selector(updateBreadcrumb:) forControlEvents:UIControlEventTouchUpInside];

  UIButton *button3 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
  button3.tag = 3;
  [button3 setTitle:@"stakeholders > political" forState:UIControlStateNormal];
  [self.view addSubview:button3];
  button3.frame = CGRectMake(cx, cy, 200, 30);
  cy += 40;
  [button3 addTarget:self action:@selector(updateBreadcrumb:) forControlEvents:UIControlEventTouchUpInside];
  
  UIButton *button4 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
  button4.tag = 4;
  [button4 setTitle:@"home > project overview" forState:UIControlStateNormal];
  [self.view addSubview:button4];
  button4.frame = CGRectMake(cx, cy, 200, 30);
  cy += 40;
  [button4 addTarget:self action:@selector(updateBreadcrumb:) forControlEvents:UIControlEventTouchUpInside];

  UIButton *button5 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
  button5.tag = 5;
  [button5 setTitle:@"home > project overview > qatar" forState:UIControlStateNormal];
  [self.view addSubview:button5];
  button5.frame = CGRectMake(cx, cy, 200, 30);
  cy += 40;
  [button5 addTarget:self action:@selector(updateBreadcrumb:) forControlEvents:UIControlEventTouchUpInside];
}
- (void)viewDidLoad
{
  [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

- (BTBreadcrumbItem *)item:(NSString *)title {
  // return [[BTFloatingMenuItem alloc] initWithTitle:title icon:nil];
  BTBreadcrumbItem *item = [[BTBreadcrumbItem alloc] init];
  item.title = title;
  return item;
}
- (void)updateBreadcrumb:(id)sender
{
  UIButton *button = (UIButton *)sender;
  if (button.tag == 1) { // stakeholders
    [_breadcrumb setItems:[NSArray arrayWithObjects:
                           [self item:@"Stakeholders"], nil]
                 animated:YES];
  } else if (button.tag == 2) { // stakeholders > general
    [_breadcrumb setItems:[NSArray arrayWithObjects:
                           [self item:@"Stakeholders"], [self item:@"General"], nil]
                 animated:YES];
  } else if (button.tag == 3) { // stakeholders > political
    [_breadcrumb setItems:[NSArray arrayWithObjects:
                           [self item:@"Stakeholders"], [self item:@"Political"], nil]
                 animated:YES];
  } else if (button.tag == 4) { // home > project overview
    [_breadcrumb setItems:[NSArray arrayWithObjects:
                           [self item:@"Home"], [self item:@"Project Overview"], nil]
                 animated:YES];
  } else {
    [_breadcrumb setItems:[NSArray arrayWithObjects:
                           [self item:@"Home"]
                           , [self item:@"Project Overview"]
                           , [self item:@"Qatar"]
                           , nil]
                 animated:YES];
  }
    
}
@end
