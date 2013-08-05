//
//  mgsoldier.m
//  Element Of Defense
//
//  Created by Steven Liu on 2013-05-02.
//
//

#import "mgsoldier.h"
#import "Waypoint.h"

@implementation mgsoldier
@synthesize mySprite,gameLayer;
/*
+(id) makeMg:(HelloWorldLayer*)_gamelayer waypoint:(NSMutableArray*)mywaypoints{
    return [[self alloc] initMg:_gamelayer waypoint:mywaypoints];
}

-(id) initMg:(HelloWorldLayer*)_gamelayer waypoint:(NSMutableArray*)mywaypoints{
    if(self = [super init]){
        health = 10;
        damage = 2;
        range = 100;
        freq = 0.5;
        speed =1;
        active = NO;
        gameLayer = _gamelayer;
        mySprite = [CCSprite spriteWithFile:@"sv_anim_1.png"];
        mySprite.scaleX = 75/mySprite.contentSize.width;
        mySprite.scaleY = 75/mySprite.contentSize.height;
		[self addChild:mySprite];
        
        Waypoint *waypoint = (Waypoint*)[mywaypoints objectAtIndex:([mywaypoints count]-1)];
        spawnpoint = waypoint.nextWaypoint;
        CGPoint pos = waypoint.myPosition;
        myPosition = pos;
        [mySprite setPosition:pos];
        [gameLayer addChild:self z:3];
          walkAni = [self loadAnimation:@"walkingAnim"];
        if(walkAni == nil){
            NSLog(@"wrong!");
        }else{
            //CCAnimate* action = [CCRepeatForever actionWithAction:actionWithAnimation:walkAni];
            NSLog(@"load animation");
            [self runAction:[CCRepeatForever actionWithAction:[CCAnimate actionWithAnimation:walkAni]]];
        }
        
        
        [self scheduleUpdate];
      
    }
    
    return self;
}
*/


+(id) makeMg:(HelloWorldLayer*)_gamelayer waypoint:(NSMutableArray*)mywaypoints{
    return [[self alloc] initMg:_gamelayer waypoint:mywaypoints];
}

-(id) initMg:(HelloWorldLayer*)_gamelayer waypoint:(NSMutableArray*)mywaypoints{
    if(self = [super initWithSpriteFrameName:@"sv_anim_1.png"]){
        health = 10;
        damage = 2;
        range = 100;
        freq = 0.5;
        speed =1;
        active = NO;
        gameLayer = _gamelayer;
        walkAni = [self loadAnimation:@"walkingAnim"];
        
        if(walkAni == nil){
            NSLog(@"wrong!");
        
        }else{
            //CCAnimate* action = [CCRepeatForever actionWithAction:actionWithAnimation:walkAni];
            NSLog(@"load animation");
            [self runAction:[CCRepeatForever actionWithAction:[CCAnimate actionWithAnimation:walkAni]]];
        }

        Waypoint *waypoint = (Waypoint*)[mywaypoints objectAtIndex:([mywaypoints count]-1)];
        spawnpoint = waypoint.nextWaypoint;
        self.position = waypoint.myPosition;
        [gameLayer addChild:self z:3];
        [self scheduleUpdate];
        
    }
    
    return self;
}


-(void)activateSoldier{
    active = YES;
}


-(void)update:(ccTime)dt{
    if(destination_reached){
        [self changeState:1];
        return;
    }
    
    if([gameLayer circle:self.position withRadius:1 collisionWithCirle:spawnpoint.myPosition collisionCircleRadius:1]){
        //if there is a next point then move there
        if(spawnpoint.nextWaypoint){
            spawnpoint = spawnpoint.nextWaypoint;
    
        }
        else{
            destination_reached = true;
        }
    }
    CGPoint targetPoint = spawnpoint.myPosition;
    float movingspeed = speed;

    CGPoint normalized = ccpNormalize(ccp(targetPoint.x-self.position.x, targetPoint.y-self.position.y));
    
    self.position =ccp(self.position.x+normalized.x *movingspeed, self.position.y+normalized.y *movingspeed);
    [mySprite setPosition:self.position];
}

//the attack range 
-(void)draw{

    ccDrawColor4B(255, 0, 0, 0);
    ccDrawCircle(mySprite.position, range, 360, 30, false);
    [super draw];
}

@end
