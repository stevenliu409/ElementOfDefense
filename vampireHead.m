//
//  vampireHead.m
//  Element Of Defense
//
//  Created by Hua Dong on 13-05-03.
//
//

#import "vampireHead.h"

@implementation vampireHead

+(id) makevampireHead{
    return [[self alloc] initvampireHead];
}


-(id) initvampireHead{
    if(self = [super initBody:@"vhead.png"]){
        self.scaleX = 25/self.contentSize.width;
        self.scaleY = 25/self.contentSize.height;
    }
    return self;
}

@end
