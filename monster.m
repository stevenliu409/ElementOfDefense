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
+(id) makeMonster:(body *)b mhead:(body *)h mrleg:(body *)mr mlleg:(body*) lr mrarm:(body *)ra mlarm:(body *)la{
    return [[self alloc] initMonster:b mhead:h mrleg:mr mlleg:lr mrarm:ra mlarm:la];
}

-(id) initMonster:(body *)b mhead:(body *)h mrleg:(body *)mr mlleg:(body*) lr mrarm:(body *)ra mlarm:(body *)la{
    if(self = [super init]){
        mhead = h;
        mbody = b;
        mrleg = mr;
        mleg = lr;
        mrarm = ra;
        marm = la;
        [self addChild:mhead z:2];
        [self addChild:mbody z:2];
        [self addChild:mrleg z:3];
        [self addChild:mleg z:1];
        [self addChild:mrarm z:3];
        [self addChild:marm z:1];
        mbody.position = CGPointMake(400, 100);
        mhead.position = CGPointMake(400, 125);
        mrleg.position = CGPointMake(400, 50);
        mleg.position = CGPointMake(400,50);
        mrarm.position = CGPointMake(400,75);
        marm.position = CGPointMake(400,75);
        dead = NO;
        prect = 0.5;
        sstate = 2;
        health = mhead.health;
        health = 10;
        NSLog(@"monster health is %d",health);
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
        marm = NULL;
        mrarm = NULL;
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
        self.mrarm = [decoder decodeObjectForKey:@"mrarm"];
        self.marm = [decoder decodeObjectForKey:@"marm"];
    }
    return self;
}


-(void) setUpPos:(double)x yPos:(int)y{
    mbody.position = ccp(x+5,y);
    mrarm.position = ccp(x+5,y-2);
    marm.position = ccp(x+5,y-2);
    mhead.position = ccp(x,y+25);
    mrleg.position = ccp(x+5,y-28);
    mleg.position = ccp(x+5,y-28);
    rlegPos = mrleg.position;
    headPos = mhead.position;
    bodyPos = mbody.position;
    llegPos = mleg.position;
    rarmPos = mrarm.position;
    larmPos = marm.position;
    xPos = x;
    yPos = y;
}

- (void)encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeObject:mbody forKey:@"body"];
    [encoder encodeObject:mhead forKey:@"head"];
    [encoder encodeObject:mrleg forKey:@"mrleg"];
    [encoder encodeObject:mleg forKey:@"mleg"];
    [encoder encodeObject:mrarm forKey:@"mrarm"];
    [encoder encodeObject:marm forKey:@"marm"];
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
    //[self unscheduleUpdate];
    //[self updatePos];
    /*
    mhead.position = ccp(headPos.x - 0.1,headPos.y);
    mbody.position = ccp(bodyPos.x - 0.1,bodyPos.y);
    mrleg.position = ccp(rlegPos.x -0.1, rlegPos.y);
    mleg.position = ccp(llegPos.x - 0.1,llegPos.y);
    mrarm.position = ccp(rarmPos.x -0.1,rarmPos.y);
    marm.position = ccp(larmPos.x -0.1,larmPos.y);*/
    //[self updatePos];
    //[self scheduleUpdate];
    //[self setUpPos:mbody.position.x-1 yPos:mbody.position.y];
    
    [self setUpPos:xPos-0.1 yPos:yPos];
    [self fixPos:2];
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
        sstate = 1;
        return YES;
    }else{
        sstate = 2;
        [self moveMonster:ct];
        
        return NO;
    }
    
       
   
}


-(void) update:(ccTime) dt{
    
    if(sstate == 2){
        //[self updatePos];
       // [self fixPos:1];
       // return;
    }else if(sstate == 1){
        [self stopBodyActons];
        [mrarm setDisplayFrame:[[CCSpriteFrameCache
                                sharedSpriteFrameCache]
                               spriteFrameByName:@"rarm_3.png"]];
    }
    [self fixPos:sstate];
    return;

}

-(void) stopBodyActons{
    [marm stopAllActions];
    [mleg stopAllActions];
    [mrarm stopAllActions];
    [mrleg stopAllActions];
}

-(void) fixPos:(int) s{
    if(s == 2){
        int fnumber = [marm frameOfAnimation:marm.currentAni];
        if(fnumber == 0){
            self.mrleg.position = ccp(rlegPos.x -6,rlegPos.y+2);
            self.mleg.position = ccp(llegPos.x+1, llegPos.y+2);
            self.mbody.position = ccp(bodyPos.x,bodyPos.y);
            self.mhead.position = ccp(headPos.x,headPos.y);
            self.mrarm.position = ccp(rarmPos.x+5,rarmPos.y);
            self.marm.position = ccp(larmPos.x-9,larmPos.y);
            return;
        }
        if(fnumber == 1){
            self.mrleg.position = ccp(rlegPos.x,rlegPos.y+1);
            self.mleg.position = ccp(llegPos.x+10,llegPos.y+5);
            self.mbody.position = ccp(bodyPos.x,bodyPos.y+1);
            self.mhead.position = ccp(headPos.x,headPos.y+1);
            self.mrarm.position = ccp(rarmPos.x, rarmPos.y+1);
            self.marm.position = ccp(larmPos.x-3,larmPos.y);
            return;
        
        }
        if(fnumber == 2){
            self.mrleg.position = ccp(rlegPos.x+2,rlegPos.y + 3);
            self.mleg.position = ccp(llegPos.x-5,llegPos.y+3);
            self.mbody.position = ccp(bodyPos.x,bodyPos.y+1);
            self.mhead.position = ccp(headPos.x,headPos.y+1);
            self.mrarm.position = ccp(rarmPos.x-9, rarmPos.y+1);
            self.marm.position = ccp(larmPos.x+6,larmPos.y+1);
            return;
        }
        if(fnumber == 3){
            self.mrleg.position = ccp(rlegPos.x,rlegPos.y + 2);
            self.mleg.position = ccp(llegPos.x-2,llegPos.y+2);
            self.mbody.position = ccp(bodyPos.x,bodyPos.y);
            self.mhead.position = ccp(headPos.x,headPos.y);
            self.mrarm.position = ccp(rarmPos.x,rarmPos.y-1);
            self.marm.position = ccp(larmPos.x,larmPos.y- 1);
            return;
        }
    }else if(s == 1){
        
    }

}

-(void) updatePos{
    rlegPos.x = self.mrleg.position.x;
    llegPos.x = self.mleg.position.x;
    bodyPos.x = self.mbody.position.x;
    headPos.x = self.mhead.position.x;
    rarmPos.x = self.mrarm.position.x;
    larmPos.x = self.mrarm.position.x;
    
}

-(void) killed{
    //[mhead release];
    //[mbody release];
    //[self removeChild:mhead cleanup:YES];
    //[self removeChild:mbody cleanup:YES];
    //mbody = NULL;
}


-(void) dealloc{
    [mhead release];
    [mbody release];
    [marm release];
    [mrarm release];
    [mrleg release];
    [mleg release];
    [super dealloc];
}

@end
