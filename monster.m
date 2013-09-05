//
//  monster.m
//  Element Of Defense
//
//  Created by Hua Dong on 13-05-03.
//
//

#import "monster.h"
#import "cocos2d.h"
@interface monster(PrivateMethod)

-(void) makeMonster;
@end

@implementation monster
@synthesize mbody;
@synthesize mhead;
@synthesize marm,mleg,mrarm,mrleg;
@synthesize attFreq;
@synthesize damage,prect;
+(id) makeMonster:(body *)b mhead:(body *)h mrleg:(body *)mr mlleg:(body*) lr{
    return [[self alloc] initMonster:b mhead:h mrleg:mr mlleg:lr];
}

-(id) initMonster:(body *)b mhead:(body *)h mrleg:(body *)mr mlleg:(body*) lr{
    if(self = [super init]){
        mhead = h;
        mbody = b;
        mrleg = mr;
        mleg = lr;
        [self addChild:mhead z:1];
        [self addChild:mbody z:1];
        [self addChild:mrleg z:2];
        [self addChild:mleg z:1];
        mbody.position = CGPointMake(400, 100);
        mhead.position = CGPointMake(400, 125);
        mrleg.position = CGPointMake(400, 50);
        mleg.position = CGPointMake(400,50);
        dead = NO;
        prect = 0.5;
        sstate = 1;
        health = mhead.health;
        self.damage = 0;
        [self scheduleUpdate];
    }
    return self;
}

+(id) newMonster{
    return [[self alloc] init];
}

-(id) init{
    if(self = [super init]){
        mhead = NULL;
        mbody = NULL;
        mrleg = NULL;
        mleg = NULL;
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)decoder{
    self = [[monster alloc] init];
    if (self != nil) {
        self.mbody = [decoder decodeObjectForKey:@"body"];
        self.mhead = [decoder decodeObjectForKey:@"head"];
        self.mrleg = [decoder decodeObjectForKey:@"mrleg"];
        self.mleg = [decoder decodeObjectForKey:@"mleg"];
    }
    return self;
}


-(void) setUpPos:(int)x yPos:(int)y{
    mbody.position = ccp(x+5,y);
    mhead.position = ccp(x,y+25);
    mrleg.position = ccp(x+5,y-28);
    mleg.position = ccp(x+5,y-28);
    rlegPos = mrleg.position;
    headPos = mhead.position;
    bodyPos = mbody.position;
    llegPos = mleg.position;
}

- (void)encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeObject:mbody forKey:@"body"];
    [encoder encodeObject:mhead forKey:@"head"];
    [encoder encodeObject:mrleg forKey:@"mrleg"];
    [encoder encodeObject:mleg forKey:@"mleg"];
}

-(BOOL) addBody:(body *)b{
    if (mhead == NULL) {
        mhead = b;
        return true;
    }else if(mbody == NULL){
        mbody = b;
        return true;
    }else{
        return false;
    }
}

-(void) moveMonster:(ccTime)ct{
    mhead.position = ccp(mhead.position.x - 1,mhead.position.y);
    mbody.position = ccp(mbody.position.x - 1,mbody.position.y);
}

-(void) monsterAttack:(GameObj* )s timer:(ccTime)ct{
    totalTime += ct;
    currentTime = totalTime;
    if(currentTime >attFreq){
        currentTime = 0;
        totalTime = 0;
        [self attack:s];
    }
}

-(void) attack:(GameObj *)s{
    s.health -= self.damage;
    if(s.health > 0){
        [s changeState:5];
    }else{
        s.dead = YES;
    }
}

-(int) getMSpeed{
    int s = mbody.speed + mbody.speed;
    return s;
}



-(BOOL) checkMonster{
    return mhead != NULL && mbody != NULL;
}


-(BOOL) updateMonster:(ccTime)ct soilders:(GameObj *)s1{
    
    
    if((CGRectIntersectsRect(self.mbody.boundingBox, s1.boundingBox)|| CGRectIntersectsRect(self.mhead.boundingBox, s1.boundingBox))&& s1.sstate != 4){
        [self monsterAttack:s1 timer:ct];
        return YES;
    }else{
        sstate = 1;
        [self moveMonster:ct];
        return NO;
    }
    
       
   
}


-(void) update:(ccTime) dt{
    if(sstate == 1){
        int fnumber = [mrleg frameOfAnimation:mrleg.currentAni];
        NSLog(@"%d",fnumber);
        if(fnumber == 0){
            self.mrleg.position = ccp(rlegPos.x -6,rlegPos.y+2);
            self.mleg.position = ccp(llegPos.x+1, llegPos.y + 2);
            self.mbody.position = ccp(bodyPos.x,bodyPos.y);
            self.mhead.position = ccp(headPos.x,headPos.y);
            return;
        }
        if(fnumber == 1){
            self.mrleg.position = ccp(rlegPos.x,rlegPos.y+1);
            self.mleg.position = ccp(llegPos.x+10,llegPos.y+5);
            self.mbody.position = ccp(bodyPos.x,bodyPos.y+1);
            self.mhead.position = ccp(headPos.x,headPos.y+1);
            return;

        }
        if(fnumber == 2){
            self.mrleg.position = ccp(rlegPos.x+2,rlegPos.y + 3);
            self.mleg.position = ccp(llegPos.x-5,llegPos.y+3);
            self.mbody.position = ccp(bodyPos.x,bodyPos.y+1);
            self.mhead.position = ccp(headPos.x,headPos.y+1);
            return;
        }
        if(fnumber == 3){
            self.mrleg.position = ccp(rlegPos.x,rlegPos.y + 2);
            self.mleg.position = ccp(llegPos.x-2,llegPos.y+2);
            self.mbody.position = ccp(bodyPos.x,bodyPos.y);
            self.mhead.position = ccp(headPos.x,headPos.y);
            return;
        }
    
    }

}

-(void) killed{
    //[mhead release];
    //[mbody release];
    //[self removeChild:mhead cleanup:YES];
    //[self removeChild:mbody cleanup:YES];
    //mbody = NULL;
}


@end
