//
//  soldier.m
//  Element Of Defense
//
//  Created by Steven Liu on 2013-05-02.
//
//

#import "soldier.h"
#import "BulletCache.h"
#import "HelloWorldLayer.h"
@implementation soldier
@synthesize dead;
@synthesize speed;
@synthesize range;
@synthesize damage;
@synthesize freq;
+(id) makeSoldier:(int)type{
    return [[self alloc] initSoldier:type];
}


-(id) initSoldier:(int)type{
    return self;
}

-(void) fire:(ccTime)ct {
    HelloWorldLayer* level = [HelloWorldLayer getLevel];
    BulletCache* cache = [level cache];
    [cache shootBulletFrom:self timer:ct];
}


-(void) updateSoldier:(ccTime)ct{
    /*CGPoint point = self.position;
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
    }*/
    [self fire:ct];

}



@end
