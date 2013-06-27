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
@synthesize dead,speed,range,damage,freq;

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
     
    currentTime+=ct;
    if(currentTime > freq){
    
        [self fire:ct];
        currentTime = 0;
    }

}



@end
