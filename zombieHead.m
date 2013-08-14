//
//  zombieHead.m
//  Element Of Defense
//
//  Created by Hua Dong on 13-05-03.
//
//

#import "zombieHead.h"

@implementation zombieHead


+(id) makeZhead{
    return [[self alloc]initZhead];
}


-(id) initZhead{
    if(self = [super initBody:@"zhead.png"]){
        self.health = 5;
        self.scaleX = 20/self.contentSize.width;
        self.scaleY = 10/self.contentSize.height;
    }
    return self;
}

@end
