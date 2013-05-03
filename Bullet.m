//
//  Bullet.m
//  Element Of Defense
//
//  Created by Leo Cheung on 13-05-03.
//
//

#import "Bullet.h"
#import "snipersoldier.h"
#import "tanksoldier.h"
#import "mgsoldier.h"

@implementation Bullet

+(id) makeBullet{
    return [[self alloc] initBullet];
}

-(id) initBullet{
    if(self = [super initWithFile:@"bullet.png"]){
    }
    return self;
}

-(void)updateBullet:(soldier *)s{
    snipersoldier* tmpss = [snipersoldier makeSniper];
    tanksoldier* tmpts = [tanksoldier makeTankSoldier];
    mgsoldier* tmpmg = [mgsoldier makeMg];
    if([tmpss isEqual:s]){
        s->damage;
    }
    else if([tmpts isEqual:s]){
        s->damage;
    }
    else if ([tmpmg isEqual:s]){
        s->damage;

    }
}


@end
