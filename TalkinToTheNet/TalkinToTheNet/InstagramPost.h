//
//  InstagramPost.h
//  TalkinToTheNet
//
//  Created by Bereket  on 9/26/15.
//  Copyright © 2015 Mike Kavouras. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface InstagramPost : NSObject

//@property (nonatomic) NSDictionary* images;

@property (nonatomic) NSString* urlString;

- (instancetype)initWithJSON:(NSDictionary*)json;


@end
