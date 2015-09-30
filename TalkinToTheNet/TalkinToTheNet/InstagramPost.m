//
//  InstagramPost.m
//  TalkinToTheNet
//
//  Created by Bereket  on 9/26/15.
//  Copyright © 2015 Mike Kavouras. All rights reserved.
//

#import "InstagramPost.h"

@implementation InstagramPost

- (instancetype)initWithJSON:(NSDictionary *)json{
    if (self = [super init]){
        
        
        NSLog(@"%@",json);
        
        NSDictionary* imagesDictionary  = [json objectForKey:@"images"];
       
        
        NSDictionary* lowResolutiondictionary = [imagesDictionary objectForKey:@"low_resolution"];
        
        
        self.urlString = [lowResolutiondictionary objectForKey:@"url"];
        
        
        return self;
        
    }
    
    return nil;
}


@end
