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
  _breadcrumb.delegate = self;
  [_breadcrumb sizeToFit];
  [self.view addSubview:_breadcrumb];
  
  CGFloat cx = 20;
  CGFloat cy = 150;
  
  UIButton *button1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
  button1.tag = 1;
  [button1 setTitle:@"Level 1" forState:UIControlStateNormal];
  [self.view addSubview:button1];
  button1.frame = CGRectMake(cx, cy, 200, 30);
  cy += 40;
  [button1 addTarget:self action:@selector(updateBreadcrumb:) forControlEvents:UIControlEventTouchUpInside];
  
  UIButton *button2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
  button2.tag = 2;
  [button2 setTitle:@"Level 1 > Level 2" forState:UIControlStateNormal];
  [self.view addSubview:button2];
  button2.frame = CGRectMake(cx, cy, 200, 30);
  cy += 40;
  [button2 addTarget:self action:@selector(updateBreadcrumb:) forControlEvents:UIControlEventTouchUpInside];

  UIButton *button3 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
  button3.tag = 3;
  [button3 setTitle:@"Level 1 > Level 2 > Level 3" forState:UIControlStateNormal];
  [self.view addSubview:button3];
  button3.frame = CGRectMake(cx, cy, 200, 30);
  cy += 40;
  [button3 addTarget:self action:@selector(updateBreadcrumb:) forControlEvents:UIControlEventTouchUpInside];
  
  UIButton *button4 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
  button4.tag = 4;
  [button4 setTitle:@"Thank You" forState:UIControlStateNormal];
  [self.view addSubview:button4];
  button4.frame = CGRectMake(cx, cy, 200, 30);
  cy += 40;
  [button4 addTarget:self action:@selector(updateBreadcrumb:) forControlEvents:UIControlEventTouchUpInside];

  UIButton *button5 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
  button5.tag = 5;
  [button5 setTitle:@"<none>" forState:UIControlStateNormal];
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
                           [self item:@"Level 1"], nil]
                 animated:YES];
  } else if (button.tag == 2) { // stakeholders > general
    [_breadcrumb setItems:[NSArray arrayWithObjects:
                           [self item:@"Level 1"], [self item:@"Level 2"], nil]
                 animated:YES];
  } else if (button.tag == 3) { // stakeholders > political
    [_breadcrumb setItems:[NSArray arrayWithObjects:
                           [self item:@"Level 1"], [self item:@"Level 2"], [self item:@"Level 3"], nil]
                 animated:YES];
  } else if (button.tag == 4) { // home > project overview
    [_breadcrumb setItems:[NSArray arrayWithObjects:
                           [self item:@"Thank You"], nil]
                 animated:YES];
  } else {
    [_breadcrumb setItems:[NSArray arrayWithObjects:nil]
                 animated:YES];
  }
    
}

- (void)breadcrumbViewDidTapStartButton:(BTBreadcrumbView *)view
{
  NSLog(@"Start");
}
- (void)breadcrumbView:(BTBreadcrumbView *)view didTapItemAtIndex:(NSUInteger)index
{
  NSLog(@"Item at Index = %d", index);
}
@end
