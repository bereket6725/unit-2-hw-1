//
//  DetailLocationViewController.m
//  TalkinToTheNet
//
//  Created by Bereket  on 9/24/15.
//  Copyright © 2015 Mike Kavouras. All rights reserved.
//
#import "DetailLocationViewController.h"
#import "API Manager.h"
@interface DetailLocationViewController ()
@property (nonatomic) NSString *yourChoice;
@property (nonatomic) NSString* locationAddress;
@property (nonatomic) NSString *placeAddress;
@property (nonatomic) NSString *placeCity;
@property (nonatomic) NSString *placeState;
@property (nonatomic) NSString *placePostalCode;



@property (nonatomic) NSArray* instagramData;

@end
@implementation DetailLocationViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"self.queryPhrase %@", self.queryPhrase);
    
    
    
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
   
    NSString *instagramURLString = [NSString stringWithFormat:@"https://api.instagram.com/v1/tags/%@/media/recent?client_id=a6dff3072d344b3c8c645275dfdc8fa2", self.yourChoice];
    
    //encoded url
    NSString *encodedString = [urlString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    
    
    self.instagramURL= [NSURL URLWithString:self.instagramURL];
    
    self.url = [NSURL URLWithString:encodedString];
    NSLog(@"self.url %@", self.url);
    
    [self fetchFourSquareData];
    [self fetchInstagramData];
    // Do any additional setup after loading the view.
}
-(void)fetchFourSquareData{
    NSLog(@"called this method");
    [API_Manager GETRequestWithURL:self.url completionHandler:^(NSData* data, NSURLResponse* response, NSError* error){
        
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        
        NSArray *results = [[json objectForKey:@"response"] objectForKey:@"venues"];
        
        for (NSDictionary* result in results){
            
            
            self.placeAddress = [[result objectForKey:@"location"] objectForKey:@"address"];
            self.placeCity = [[result objectForKey:@"location"] objectForKey:@"city"];
            self.placeState = [[result objectForKey:@"location"] objectForKey:@"state"];
            self.placePostalCode = [[result objectForKey:@"location"] objectForKey:@"postalCode"];
            
            
            
            NSLog(@"The placeAddress is %@", self.placeAddress);
            NSLog(@"The placeCity is %@", self.placeCity);
            NSLog(@"The placeState is %@", self.placeState);
            NSLog(@"The placePostalCode is %@", self.placePostalCode);
            
            
        }
        
        self.fourSquareAddressTextLabel.text = [NSString stringWithFormat:@"%@, %@, %@, %@",self.placeAddress, self.placeCity,self.placeState, self.placePostalCode] ;
    }];
    
    
}

- (void)fetchInstagramData {
    
    // create an instagram url
    
    // fetch data from the instagram endpoint and print json response
    [API_Manager GETRequestWithURL:self.instagramURL completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        
        self.instagramData = [json objectForKey:@"data"];
        
       
    }];
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
