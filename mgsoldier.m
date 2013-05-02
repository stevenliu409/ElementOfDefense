//
//  mgsoldier.m
//  Element Of Defense
//
//  Created by Steven Liu on 2013-05-02.
//
//

#import "mgsoldier.h"

@implementation mgsoldier

+(id) makeMg{
    return [[self alloc] initMg];
}

-(id) initMg{
    if(self = [super initWithFile:@"soilder1.png"]){
        health = 10;
        damage = 2;
        range = 5;
        freq = 7;
        
    }
    return self;
}


-(void) updateSoldier:(ccTime *)ct{
    CGPoint point = self.position;
    point.x = point.x + 1;
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
