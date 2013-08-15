//
//  armyLine.m
//  ZombieDefense
//
//  Created by Hua Dong on 13-08-15.
//
//

#import "armyLine.h"

@implementation armyLine
@synthesize alive, ypos,xpos;


-(id) init{
    if((self = [super init])){
        
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)decoder{
    if(self = [super init]){
        self.alive = [decoder decodeBoolForKey:@"alive"];
        self.ypos = [decoder decodeInt32ForKey:@"ypos"];
        self.xpos = [decoder decodeInt32ForKey:@"xpos"];
    }
    
    return self;
    
}


- (void)encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeBool:alive forKey:@"alive"];
    [encoder encodeInt32:ypos forKey:@"ypos"];
    [encoder encodeInt32:xpos forKey:@"xpos"];
}





@end
