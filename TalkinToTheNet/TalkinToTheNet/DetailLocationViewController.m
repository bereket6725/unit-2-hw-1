//
//  DetailLocationViewController.m
//  TalkinToTheNet
//
//  Created by Bereket  on 9/24/15.
//  Copyright © 2015 Mike Kavouras. All rights reserved.
//

#import "DetailLocationViewController.h"

@interface DetailLocationViewController ()

@property (nonatomic) NSString *yourChoice;
@property NSString* locationAddress;

@end
@implementation DetailLocationViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"%@", self.queryPhrase);
    
    
    
    if ([self.queryPhrase  isEqual: @"Waldorf Astoria"] )
    {
        self.yourChoice = @"waldorfastoriahotel";
        
        
    }
    else if([self.queryPhrase  isEqual: @"Madame Tussauds"]){
        
        self.yourChoice = @"madametussauds"; //.....  // do the same thing as above
        
        
    }
    else if([self.queryPhrase  isEqual: @"Wave Hill"]){
        
        self.yourChoice = @"wavehill";
    }
    
    
    NSString *urlString = [NSString stringWithFormat:@"https://api.foursquare.com/v2/venues/search?client_id=DQU1A2YJWRSRRIP1OM1LHRVRH4RLVBDCD11OTNGOQ2QRDNPH&client_secret=V2DXHM04GZDA1FKRGDLIPLEGZ3D0BP25GNN4XB4L1GSY3E2B&v=20130815&ll=40.7,-74&query=%@",self.yourChoice];
    
    
    NSString* encodedString = [urlString stringByAddingPercentEscapesUsingEncoding:[NSCharacterSet URLQueryAllowedCharacterSet]];
    
    self.url = [NSURL URLWithString:encodedString];
    
    
    
    //
    //    else {
    //        NSLog(@"dude you broke my code :(");
    //    }
    //
    
    [self fetchFourSquareData];
    // Do any additional setup after loading the view.
}

-(void)fetchFourSquareData{
 
    [API_Manager GETRequestWithURL:self.url completionHandler:^(NSData* data, NSURLResponse* response, NSError* error){
        
         NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        
        // NSLog(@"%@",json);
        
        NSArray* results = [[json objectForKey:@"response"]objectForKey:@"venues"];
        
        for (NSDictionary* result in results){
            NSString* address = [result objectForKey:@"formattedAddress"];
            self.locationAddress = address;
            NSLog(@"%@", address);
         
        }
        
        
        
//        self.locationAddress = [NSString stringWithFormat:[json objectForKey:@"formattedAddress"]];
//        
//        self.fourSquareAddressTextView.text = self.locationAddress;
    }];
    self.fourSquareAddressTextView.text= self.locationAddress;
    NSLog(@"%@",self.locationAddress);

}






/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
