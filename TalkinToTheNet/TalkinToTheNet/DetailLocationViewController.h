//
//  DetailLocationViewController.h
//  TalkinToTheNet
//
//  Created by Bereket  on 9/24/15.
//  Copyright © 2015 Mike Kavouras. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailLocationViewController : UIViewController <UITableViewDataSource>


@property (nonatomic) NSString* queryPhrase;


@property (strong, nonatomic) IBOutlet UITextView *fourSquareAddressTextView;


@end
