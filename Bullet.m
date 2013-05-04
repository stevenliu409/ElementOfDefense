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
@synthesize speed;
@synthesize damage;
@synthesize range;
@synthesize shoted;
@synthesize freq;
@synthesize lastpos;
+(id) makeBullet{
    return [[self alloc] initBullet];
}

-(id) initBullet{
    if(self = [super initWithFile:@"bullet.png"]){
        speed = 1;
        self.scaleX = 50/self.contentSize.width;
        self.scaleY = 25/self.contentSize.height;
        shoted = NO;
        
    }
    return self;
}




-(void) shootBulletFrom:(soldier *)s timer:(ccTime) dt{
    damage = s.damage;
    range = s.range;
    freq = s.freq;
    shoted = YES;
    lastpos = s.position;
    //self.position.y = s.position.y;
    self.position = CGPointMake(s.position.x,s.position.y);
    self.visible = YES;
    //[self updateBullet:dt];
    [self unscheduleUpdate];
    [self scheduleUpdate];
}

/*-(void)updateBullet:(ccTime)ct{
    CGPoint pos = self.position;
    pos.x = pos.x + speed;
    self.position = CGPointMake(pos.x,pos.y);
    if(self.position.x>480){
        [self stopAllActions];
        self.visible = NO;
        shoted = NO;
    }
}*/


-(void) update:(ccTime) delta{
    CGPoint pos = self.position;
    pos.x = pos.x + speed;
    self.position = CGPointMake(pos.x,pos.y);
    if(self.position.x>(lastpos.x+(range*100))){
        [self stopAllActions];
        self.visible = NO;
        shoted = NO;
        self.position = CGPointMake(0,self.position.y);
    }
}


@end
