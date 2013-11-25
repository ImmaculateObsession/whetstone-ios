//
//  SetupViewController.m
//  Whetstone-iOS
//
//  Created by Philip James on 11/23/13.
//  Copyright (c) 2013 Philip James. All rights reserved.
//

#import "SetupViewController.h"
#import "PhotoCardViewController.h"

@interface SetupViewController ()
@property (weak, nonatomic) IBOutlet UITextField *searchTextField;
- (IBAction)valueChanged:(UISlider *)sender;
@property (weak, nonatomic) IBOutlet UISlider *timeSlider;
@property (weak, nonatomic) IBOutlet UILabel *durationLabel;

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

    return YES;
}

- (void)saveSettings {
    [self.searchTextField endEditing:YES];
    [self performSegueWithIdentifier:@"PhotoCard" sender:self];
}

- (IBAction)valueChanged:(UISlider *)sender {
    UISlider *slider = sender;
    self.durationLabel.text = [NSString stringWithFormat:@"%0.1f", slider.value];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    PhotoCardViewController *destinationController = [segue destinationViewController];
    float duration = self.timeSlider.value;
    destinationController.duration = duration * 60;
}
@end
