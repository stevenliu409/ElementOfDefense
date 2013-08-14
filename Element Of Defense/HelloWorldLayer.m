//
//  HelloWorldLayer.m
//  Element Of Defense
//
//  Created by Steven Liu on 2013-04-21.
//  Copyright __MyCompanyName__ 2013. All rights reserved.
//


// Import the interfaces
#import "HelloWorldLayer.h"

// Needed to obtain the Navigation Controller
#import "AppDelegate.h"
#import "leve1.h"
#import "Bullet.h"
#import "zombieHead.h"
#import "monster.h"
#import "vampireHead.h"
#import "sArmy.h"
#import "Waypoint.h"
#import "mgsoldier.h"
#import "mWave.h"
#import "snipersoldier.h"
#pragma mark - HelloWorldLayer

// HelloWorldLayer implementation
@interface HelloWorldLayer(PrivateMethod)
-(void) initUI;
-(void) initBg;
-(void) initSoldiers;
-(void) initBody;
@end

@implementation HelloWorldLayer
@synthesize cache;
@synthesize waypoints, waypoints2, waypoints3;
@synthesize wave, soldiers;


static HelloWorldLayer* level;
+(HelloWorldLayer*) getLevel{
    return level;
}

// Helper class method that creates a Scene with the HelloWorldLayer as the only child.
+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	HelloWorldLayer *layer = [HelloWorldLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

// on "init" you need to initialize your instance
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super's" return value
	if( (self=[super init]) ) {
        [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"mlist.plist"];
        
        [[CCSpriteFrameCache sharedSpriteFrameCache]
         addSpriteFramesWithFile:@"scene1atlasiPhone.plist"];         
        
        level = self;
		prefs = [NSUserDefaults standardUserDefaults];
        cache = [[BulletCache alloc] init];
        bodyCache = [[NSMutableArray alloc] init];
        monsterCache = [[NSMutableArray alloc] init];
        wave = [[mWave alloc] init];

        [self addChild:cache z:2];
        [self addChild:wave z:3];
		[self initUI];
        [self addWaypoints];
        
        soldiers = [[NSMutableArray alloc] init];
        //soldier* m = [snipersoldier makeSniper:self waypoint:waypoints3];
        [self loadArmy];
        
        //[self initBody];
        //[m runAction:[CCRepeatForever actionWithAction:[CCAnimate actionWithAnimation:m.shotAni]]];
        //[m changeState:2];
        //s = [snipersoldier makeSniper];

        [self scheduleUpdate];
                
        self.isTouchEnabled = YES;
        //[snipersoldier makeSniper:self waypoint:waypoints2];
        
    }
	return self;
}

-(void) initBg{
    
    NSData* d = [prefs objectForKey:@"currentLevel"];
    leve1* l = [NSKeyedUnarchiver unarchiveObjectWithData:d];
    CCSprite* bg = [CCSprite spriteWithFile:l.bgdir];
    [bg setAnchorPoint:CGPointMake(0, 0)];
    CGSize size = [[CCDirector sharedDirector] winSize];
    
    bg.scaleX = size.width/bg.contentSize.width;
    bg.scaleY = size.height/bg.contentSize.height;
    
    [self addChild:bg z:1];
}


-(void) initBody{
    vampireHead* vhead = [vampireHead makevampireHead];
    vhead.position = CGPointMake(120,120);
    [self addChild:vhead z:2];
    [bodyCache addObject:vhead];
    
    zombieHead* zhead = [zombieHead makeZhead];
    zhead.position = CGPointMake(200,130);
    [self addChild:zhead z:2];
    [bodyCache addObject:zhead];
    
}


-(void)addWaypoints
{
    waypoints = [[NSMutableArray alloc] init];
    
    Waypoint * waypoint1 = [Waypoint nodeWithTheGame:self location:ccp(35,35)];
    [waypoints addObject:waypoint1];
    
    Waypoint * waypoint2 = [Waypoint nodeWithTheGame:self location:ccp(-3,35)];
    [waypoints addObject:waypoint2];
    waypoint2.nextWaypoint =waypoint1;
    
    Waypoint * waypoint3 = [Waypoint nodeWithTheGame:self location:ccp(-3,100)];
    [waypoints addObject:waypoint3];
    waypoint3.nextWaypoint =waypoint2;
    
    
    
    waypoints2 = [[NSMutableArray alloc] init];
    
    Waypoint * waypoint4 = [Waypoint nodeWithTheGame:self location:ccp(35,200)];
    [waypoints2 addObject:waypoint4];
    
    Waypoint * waypoint5 = [Waypoint nodeWithTheGame:self location:ccp(-3,200)];
    [waypoints2 addObject:waypoint5];
    waypoint5.nextWaypoint =waypoint4;
    
    Waypoint * waypoint6 = [Waypoint nodeWithTheGame:self location:ccp(-3,100)];
    [waypoints2 addObject:waypoint6];
    waypoint6.nextWaypoint =waypoint5;
    
    
    waypoints3 = [[NSMutableArray alloc] init];
    
    Waypoint * waypoint7 = [Waypoint nodeWithTheGame:self location:ccp(35,100)];
    [waypoints3 addObject:waypoint7];
    
    Waypoint * waypoint8 = [Waypoint nodeWithTheGame:self location:ccp(-3,100)];
    [waypoints3 addObject:waypoint8];
    waypoint8.nextWaypoint =waypoint7;
    
    Waypoint * waypoint9 = [Waypoint nodeWithTheGame:self location:ccp(-3,100)];
    [waypoints3 addObject:waypoint9];
    waypoint9.nextWaypoint =waypoint8;

}



-(void) initUI{
    [self initBg];

}

// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)
	
	// don't forget to call "super dealloc"
    [self removeAllChildrenWithCleanup:YES];
    [waypoints release];
    [waypoints2 release];
    [cache release];
    [playerMonster release];
	[super dealloc];
}


-(void) update:(ccTime) dt{
    /*
    CCArray* bs = [cache getCache];
    CCArray* ms = [wave getMonsters];
    for(int n = 0; n < [bs count]; n++ ){
        Bullet* b = [bs objectAtIndex:n];
        if(b.visible == YES){
            for(int x= 0; x < [ms count]; x++){
                if([b hitMonster:[ms objectAtIndex:n]]){
                    b.visible = NO;
                    b.shoted = NO;
                    b.position = ccp(0,b.self.position.y);
                }
            }
        }
    }
    for(int n = 0; n < [ms count]; n++){
        //monster* m = [ms objectAtIndex:n];
        
    }*/
    CCArray* bs = [cache getCache];
    CCArray* ms = [wave getMonsters];
    for(int n = 0; n< [ms count]; n++){
        
        monster* m = [ms objectAtIndex:n];
        if(!m.dead){
            
            for(int x = 0; x < [bs count]; x++){
                Bullet* b = [bs objectAtIndex:x];
                if(b.shoted){
                    
                    [b hitMonster:m];
                }
            }
            for(int s = 0; s<[soldiers count];s++){
                soldier* s1 = [soldiers objectAtIndex:s];
                [m updateMonster:dt soilders:s1];
            }
        }else{
            //[self removeChild:m cleanup:YES];
            /*[self removeChild:m.mbody cleanup:YES];
            [self removeChild:m.mhead cleanup:YES];
            [self removeChild:m cleanup:YES];*/
            //[m release];
            //
            //[wave removeMonster:m];
            //m.mbody.visible = NO;
            //m.mhead.visible = NO;
            /*if(m.mbody.parent == NULL){
                NSLog(@"good");
            }*/
            [wave removeMonster:m];
        }
    }
}


-(void)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    /*
    UITouch *touch = [touches anyObject];
	CGPoint point = [touch locationInView: [touch view]];
    point = [[CCDirector sharedDirector] convertToGL: point];
    
    if([monsterCache count] == 2){
        monster* m = [monster makeMonster:[monsterCache objectAtIndex:0] mhead:[monsterCache objectAtIndex:1]];
        m.position = CGPointMake(point.x,point.y);
        [self addChild:m z:2];
        [wave addMonster:m];
        [monsterCache removeAllObjects];
    }
    
    for(int n = 0; n < [bodyCache count];n++){
        body* b = [bodyCache objectAtIndex:n];
        if([b checkTouch:point]){
            [self removeChild:b cleanup:YES];
            [monsterCache addObject:b];
            [bodyCache removeObject:b];
            break;
        }
    }
     */
}

-(void) ccTouchEnded:(NSSet *) touches withEvent:(UIEvent *)event{
}

-(BOOL)circle:(CGPoint)circlePoint withRadius:(float)radius collisionWithCirle:(CGPoint)circlePointTwo collisionCircleRadius:(float)radiusTwo{

    float xdiff =circlePoint.x-circlePointTwo.x;
    float ydiff =circlePoint.y-circlePointTwo.y;
    
    float distance = sqrtf(xdiff*xdiff+ydiff*ydiff);
    if (distance<=radius+radiusTwo) {
        return YES;
    }
    return NO;

    
}


-(BOOL)loadArmy{
    /*
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"Waves" ofType:@"plist"];
    NSArray *armyData = [NSArray arrayWithContentsOfFile:plistPath];
    if(army_count >= [armyData count]){
        return NO;
    }
    NSLog(@"here");
    NSArray *currentArmyData =[NSArray arrayWithArray:[armyData objectAtIndex:army_count]];
    
    for (NSDictionary *soldierData in currentArmyData) {
        soldier *mgsolider;
        if ([[soldierData objectForKey:@"type"]floatValue] == 1) {
            mgsolider = [mgsoldier makeMg:self waypoint:waypoints];
        }
        else if ([[soldierData objectForKey:@"type"]floatValue] == 2) {
            mgsolider = [mgsoldier makeMg:self waypoint:waypoints2];
        }

        else{
            
           mgsolider = [snipersoldier makeSniper:self waypoint:waypoints3];
        }
        if(mgsolider == NULL){
            NSLog(@"wrong");
        }
        [soldiers addObject:mgsolider];
        
        [mgsolider schedule:@selector(activateSoldier) interval:[[soldierData objectForKey:@"spawnTime"]floatValue]];
           }
    army_count++;*/
    
    soldier* s = [snipersoldier makeSniper:self waypoint:waypoints3];
    [soldiers addObject:s];
    army_count++;
  
    return YES;

}




#pragma mark GameKit delegate

-(void) achievementViewControllerDidFinish:(GKAchievementViewController *)viewController
{
	AppController *app = (AppController*) [[UIApplication sharedApplication] delegate];
	[[app navController] dismissModalViewControllerAnimated:YES];
}

-(void) leaderboardViewControllerDidFinish:(GKLeaderboardViewController *)viewController
{
	AppController *app = (AppController*) [[UIApplication sharedApplication] delegate];
	[[app navController] dismissModalViewControllerAnimated:YES];
}
@end
