//
//  DetailLocationViewController.h
//  TalkinToTheNet
//
//  Created by Bereket  on 9/24/15.
//  Copyright © 2015 Mike Kavouras. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "API Manager.h"

@interface DetailLocationViewController : UIViewController 


@property (nonatomic) NSString* queryPhrase;
@property (nonatomic) NSURL   * url;
@property (nonatomic) NSURL   * instagramURL;


-(void)fetchFourSquareData;

@property (strong, nonatomic) IBOutlet UILabel *fourSquareAddressTextLabel;

@property (strong, nonatomic) IBOutlet UIImageView *instagramImage;

@end
