//
//  RMTemperatureViewController.m
//  temperatureConverter
//
//  Created by Robert Manson on 10/3/13.
//  Copyright (c) 2013 Robert Manson. All rights reserved.
//

#import "RMTemperatureViewController.h"

typedef enum _RMConvertDirection {
    RMConvertNone = 0,
    RMConvertToCelc = 1,
    RMConvertToFahr = 2,
} XLBadgeManagedType;

@interface RMTemperatureViewController ()
@property (weak, nonatomic) IBOutlet UITextField *celcTextField;
@property (weak, nonatomic) IBOutlet UITextField *fahrTextField;
- (IBAction)onConvert:(id)sender;
- (IBAction)onCelcEditEnded:(id)sender;
- (IBAction)onFahrEditEnded:(id)sender;
- (IBAction)onTap:(id)sender;
@property (assign, nonatomic) BOOL canConvert;
@property (assign, nonatomic) enum _RMConvertDirection convertDirection;
@end

@implementation RMTemperatureViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    self.title = @"TACOS!";
    if (self) {
        self.canConvert = NO;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onConvert:(id)sender
{
    if (self.convertDirection == RMConvertToCelc)
    {
        float newTemp = ([self.fahrTextField.text floatValue] - 32.0) * (5/9.0);
        self.celcTextField.text = [NSString stringWithFormat:@"%0.2f", newTemp];
    }
    else if(self.convertDirection == RMConvertToFahr)
    {
        float newTemp = (9/5.0) * [self.celcTextField.text floatValue] + 32.0;
        self.fahrTextField.text = [NSString stringWithFormat:@"%0.2f", newTemp];
    }
}

- (IBAction)onCelcEditEnded:(id)sender
{
    if (self.celcTextField.text != nil)
    {
        self.convertDirection = RMConvertToFahr;
    }
    else
    {
        self.convertDirection = RMConvertNone;
    }
}

- (IBAction)onFahrEditEnded:(id)sender
{
    if (self.fahrTextField.text != nil)
    {
        self.convertDirection = RMConvertToCelc;
    }
    else
    {
        self.convertDirection = RMConvertNone;
    }
}

- (IBAction)onTap:(id)sender
{
    [self.view endEditing:YES];
}

@end
