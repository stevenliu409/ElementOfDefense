//
//  leve1.m
//  Element Of Defense
//
//  Created by Hua Dong on 13-05-03.
//
//

#import "leve1.h"

@implementation leve1
@synthesize bgdir,bgdir2,bgdir3;
-(id) init{
    if (self = [super init]){
        bgdir = @"backpic.jpg";
        bgdir2 = @"bg2.jpeg";
        bgdir3 = @"bg3.jpg";
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)decoder {
    self = [[leve1 alloc] init];
    if (self != nil) {
        
        self.bgdir = [decoder decodeObjectForKey:@"bgdir"];
        self.bgdir2 = [decoder decodeObjectForKey:@"bgdir2"];
        self.bgdir3 = [decoder decodeObjectForKey:@"bgdir3"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder {
    
    [encoder encodeObject:bgdir forKey:@"bgdir"];
    [encoder encodeObject:bgdir2 forKey:@"bgdir2"];
    [encoder encodeObject:bgdir3 forKey:@"bgdir3"];
}

@end
