//
//  leve1.m
//  Element Of Defense
//
//  Created by Hua Dong on 13-05-03.
//
//

#import "leve1.h"

@implementation leve1
@synthesize bgdir;
-(id) init{
    if (self = [super init]){
        bgdir = @"backpic.jpg";
        NSLog(@"here");
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)decoder {
    self = [[leve1 alloc] init];
    if (self != nil) {
        
        self.bgdir = [decoder decodeObjectForKey:@"bgdir"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder {
    
    [encoder encodeObject:bgdir forKey:@"bgdir"];
}

@end
