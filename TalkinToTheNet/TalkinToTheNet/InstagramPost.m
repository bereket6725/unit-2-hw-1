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
        
        self.tags  = [json objectForKey:@"tags"];
        
        return self;
        
    }
    
    return nil;
}


@end
