//
//  InterfaceController.m
//  TextInputInWatchKit WatchKit Extension
//
//  Created by Peng on 3/16/15.
//  Copyright (c) 2015 Peng. All rights reserved.
//

#import "InterfaceController.h"


@interface InterfaceController()

@property (weak, nonatomic) IBOutlet WKInterfaceButton *handleInputBtn;
@property (weak, nonatomic) IBOutlet WKInterfaceLabel *messageLabel;

@end


@implementation InterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];

    // Configure interface objects here.
}
- (IBAction)handleInput {
    
    NSArray* perdefinedAnswer = @[@"I will call back later.", @"I'm in a meeting now."];
    [self presentTextInputControllerWithSuggestions:perdefinedAnswer
                                   allowedInputMode:WKTextInputModeAllowAnimatedEmoji
                                         completion:^(NSArray *results) {
                                             if (results && results.count > 0) {
                                                 [self.messageLabel setText:[results objectAtIndex:0]];
                                                 
                                             }
                                             else {
                                                 NSLog(@"no input from user");
                                             }
                                         }];

}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}



@end



