//
//  soldier.m
//  Element Of Defense
//
//  Created by Steven Liu on 2013-05-02.
//
//

#import "soldier.h"

@implementation soldier
@synthesize dead;
@synthesize speed;

+(id) makeSoldier:(int)type{
    return [[self alloc] initSoldier:type];
}


-(id) initSoldier:(int)type{
    return self;
}


-(void) updateSoldier:(ccTime *)ct :(int)speed{
    CGPoint point = self.position;
    point.x = point.x + speed;
    int x = point.x;
    int y = point.y;
    self.position = CGPointMake(x,y);
    if ( x> 500){
        x = 0;
        health -= 5;
        self.position = CGPointMake(x,y);
    }
    if(health == 0){
        dead = true;
    }

}



@end
