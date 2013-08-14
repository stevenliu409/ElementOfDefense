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
        self.scaleX = 20/self.contentSize.width;
        self.scaleY = 10/self.contentSize.height;
        
        //self.boundingBox = CGRectMake(self.boundingBox.origin.x,self.boundingBox.origin.y, 10,10);
        
        
    }
    return self;
}

@end
