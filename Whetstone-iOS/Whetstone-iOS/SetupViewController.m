//
//  ViewController.m
//  Whetstone-iOS
//
//  Created by Philip James on 11/23/13.
//  Copyright (c) 2013 Philip James. All rights reserved.
//

#import "SetupViewController.h"

@interface SetupViewController ()
@property (weak, nonatomic) IBOutlet UITextField *searchTextField;

@end

@implementation SetupViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.searchTextField.delegate = self;
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    UIBarButtonItem *startWithSearchButton = [[UIBarButtonItem alloc] initWithTitle:@"Start" style:UIBarButtonItemStyleDone target:self action:@selector(saveSettings)];
    [self.navigationItem setRightBarButtonItem:startWithSearchButton animated:YES];
    NSLog(@"hello");

    return YES;
}

- (void)saveSettings {
    [self performSegueWithIdentifier:@"PhotoCard" sender:self];
}
@end
