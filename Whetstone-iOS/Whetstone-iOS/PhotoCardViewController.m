//
//  PhotoCardViewController.m
//  Whetstone-iOS
//
//  Created by Philip James on 11/24/13.
//  Copyright (c) 2013 Philip James. All rights reserved.
//

#import "PhotoCardViewController.h"

@interface PhotoCardViewController ()
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (nonatomic) float timePassed;
@property (nonatomic, weak) NSTimer *durationTimer;
@property (nonatomic, weak) NSTimer *imageTimer;
@property (weak, nonatomic) IBOutlet UIImageView *imageCard;
@property (weak, nonatomic) NSString *imageName;

@end

@implementation PhotoCardViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    UIBarButtonItem *backBarButton = [[UIBarButtonItem alloc] init];
    backBarButton.title = @"Setup";
    self.navigationItem.backBarButtonItem.title = @"Setup";
    self.imageName = @"female_face.jpg";
    self.timePassed = self.duration;
    [self startRepeatingTimer];
    [self startImageTimer];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)updateTimeLabel {
    if (self.timePassed <= 0) {
        self.timePassed = self.duration;
    }
    self.timePassed = self.timePassed - 1;
    self.timeLabel.text = [NSString stringWithFormat:@"%0.0f", self.timePassed];
}

- (void)startRepeatingTimer {
    [self.durationTimer invalidate];
    
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(updateTimeLabel) userInfo:nil repeats:YES];
    
    self.durationTimer = timer;
}

- (void)startImageTimer {
    [self.imageTimer invalidate];

    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:self.duration target:self selector:@selector(updateImage) userInfo:nil repeats:YES];
    
    self.imageTimer = timer;
}

- (void)updateImage {
    if ([self.imageName isEqual: @"female_face.jpg"]) {
        self.imageName = @"man_with_hat.jpg";
    } else {
        self.imageName = @"female_face.jpg";
    }
    self.imageCard.image = [UIImage imageNamed:self.imageName];
}

@end
