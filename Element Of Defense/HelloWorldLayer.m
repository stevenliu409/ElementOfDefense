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
#import "armyLine.h"
#import "soldierBase.h"
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
        deadSoldiers = [[NSMutableArray alloc] init];
        wave = [[mWave alloc] init];

        [self addChild:cache z:2];
        [self addChild:wave z:3];
		[self initUI];
        [self addWaypoints];
        
        soldiers = [[NSMutableArray alloc] init];
        linesDic = [[NSMutableDictionary alloc] init];
        //soldier* m = [snipersoldier makeSniper:self waypoint:waypoints3];
        [self loadArmy];
        
        self.isTouchEnabled = YES;
        [self scheduleUpdate];
                
      
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
    
    [self addChild:bg z:1 tag:1];
    
    CCSprite* bg2 = [CCSprite spriteWithFile:l.bgdir2];
    bg2.anchorPoint = CGPointMake(0,0);
    bg2.scaleX = size.width/bg2.contentSize.width;
    bg2.scaleY = size.height/bg2.contentSize.height;
    
    [self addChild:bg2 z:1 tag:2];
    bg2.visible = NO;
    
    CCSprite* bg3 = [CCSprite spriteWithFile:l.bgdir3];
    bg3.anchorPoint = CGPointMake(0,0);
    bg3.scaleX = size.width/bg3.contentSize.width;
    bg3.scaleY = size.height/bg3.contentSize.height;
    
    [self addChild:bg3 z:1 tag:3];
    bg3.visible = NO;

    

    
    
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
    [deadSoldiers release];
	[super dealloc];
}


-(void) update:(ccTime) dt{
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
            if(base.visible && (!m.dead)){
                //[m:dt soilders:base];
                if([m updateMonster:dt soilders:base]){
                    break;
                }
            }
            
            
            for(int s = 0; s<[soldiers count];s++){
                soldier* s1 = [soldiers objectAtIndex:s];
                if([m updateMonster:dt soilders:s1]){
                    if(s1.dead){
                        [soldiers removeObject:s1];
                        [deadSoldiers addObject:s1];
                    }
                    break;
                }
            }
            
        }else{
            
            double r = [self genRandom];
            if(m.prect > r){
                
                [self genBodyPart:m];
            }
            [wave removeMonster:m];
        }
    }
    if(([monsterCache count]==0 && [bodyCache count] == 0 && [ms count] == 0) || ([soldiers count] == 0)){
        [self stopGame];
        return;
    }

}


-(void)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@"touch");
    UITouch *touch = [touches anyObject];
	CGPoint point = [touch locationInView: [touch view]];
    point = [[CCDirector sharedDirector] convertToGL: point];
    if([monsterCache count] == 2){
        NSArray* lines = [linesDic allKeys];
        monster* m = [monster makeMonster:[monsterCache objectAtIndex:0] mhead:[monsterCache objectAtIndex:1]];
        //m.position = CGPointMake(point.x,point.y);
        int xpos = -1;
        int ypos = -1;
        int yDiff = 999;
        int lineIndex = -1;
        for(int n = 0; n < [lines count]; n++){
            armyLine* l = [linesDic objectForKey:[lines objectAtIndex:n]];
            if(l.alive){
                int diff = abs(point.y - l.ypos);
                if(diff <= yDiff){
                    yDiff = diff;
                    ypos = l.ypos;
                    lineIndex = n;
                }
            }
        }
        
        armyLine* l = [linesDic objectForKey:[lines objectAtIndex:lineIndex]];
        if(point.x < l.xpos+75){
            xpos = l.xpos+75;
        }else{
            xpos = point.x;
        }
        
        [m setUpPos:xpos yPos:ypos];
        [wave addMonster:m];
        [monsterCache removeAllObjects];
    }
    
    for(int n = 0; n < [bodyCache count];n++){
        body* b = [bodyCache objectAtIndex:n];
        if([b checkTouch:point]){
            [self removeChild:b cleanup:YES];
            [monsterCache addObject:b];
            [bodyCache removeObject:b];
            //NSLog(@"%d",n);
            break;
        }
    }
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
        [soldiers addObject:mgsolider];
        
        [mgsolider schedule:@selector(activateSoldier) interval:[[soldierData objectForKey:@"spawnTime"]floatValue]];
    }
    army_count++;
    */
    soldier* s = [snipersoldier makeSniper:self waypoint:waypoints3];
    [soldiers addObject:s];
    /*
    soldier* s1 = [mgsoldier makeMg:self waypoint:waypoints];
    [soldiers addObject:s1];
    army_count++;*/
    
    armyLine* line1 = [[armyLine alloc] init];
    line1.alive = YES;
    line1.ypos = 200;
    line1.xpos = 35;
    [linesDic setObject:line1 forKey:@"lines1"];
    /*
    armyLine* line2 = [[armyLine alloc]init];
    line2.alive = YES;
    line2.ypos = 35;
    line2.xpos = 35;
    [linesDic setObject:line2 forKey:@"lines2"];*/
    
    base = [soldierBase makeBase];
    base.position = ccp(50,100);
    base.flipX = YES;
    [self addChild:base z:3 tag:999];
    base.visible = NO;
    
    return YES;

}

-(void) genBodyPart:(monster* )m{
    zombieHead* zh = [zombieHead makeZhead];
    zh.position = ccp(m.mhead.position.x+50,m.mhead.position.y+50);
    [self addChild:zh z:3];
    [bodyCache addObject:zh];
    vampireHead* vh = [vampireHead makevampireHead];
    vh.position = ccp(m.mhead.position.x+50,m.mhead.position.y-50);
    [self addChild:vh z:3];
    [bodyCache addObject:vh];
    
}


-(double) genRandom{
    double n = arc4random()%10;
    return n/10;
}

-(void) stopGame{
    //NSLog(@"Game stop!");
    [self unscheduleUpdate];
    self.isTouchEnabled = NO;
    if([soldiers count] == 0){
        [self moveLeft];
    }else if([[wave getMonsters] count] == 0){
        [self moveRight];
    }else{
        
    }
}


-(void) moveLeft{
    //NSLog(@"move left");
    [self schedule:@selector(changeToLeft:)];
}
-(void) moveRight{
    //NSLog(@"move right");
    [self schedule:@selector(changeToRight:)];
}

-(void) changeToLeft:(ccTime)dt{
    BOOL moveOut = NO;
    CCArray* array = [wave getMonsters];
    for(int n = 0; n < [array count]; n++){
        monster* m = [array objectAtIndex:n];
        [m moveMonster:dt];
        //NSLog(@"%f,%f",m.mbody.position.x,m.mhead.position.x);
        if(m.mbody.position.x < -10 && m.mhead.position.x < -10){

            moveOut = YES;
        }else{
            moveOut = NO;
        }
    }
    
    if(moveOut){
        //NSLog(@"move out to left");
        CCSprite* bg1 =(CCSprite*) [self getChildByTag:1];
        bg1.visible = NO;
        for(int n = 0; n< [deadSoldiers count]; n++){
            soldier* s = [deadSoldiers objectAtIndex:n];
            [self removeChild:s cleanup:YES];
        }
        
        for(int n = 0; n< [[wave getMonsters] count]; n++){
            monster* m = [[wave getMonsters] objectAtIndex:n];
            //NSLog(@"%f",m.mbody.position.y);
            [m setUpPos:500 yPos:m.mbody.position.y];
            //NSLog(@"%f",m.mbody.position.x);
        }
        CCSprite* b3 = (CCSprite*) [self getChildByTag:3];
        b3.visible = YES;
        soldierBase* base =(soldierBase*) [self getChildByTag:999];
        base.visible = YES;
        [base scheduleUpdate];
        [self scheduleUpdate];
        //[self loadArmy];
        [soldiers addObject:[snipersoldier makeSniper:self waypoint:waypoints]];
        self.isTouchEnabled = YES;
        
        [self unschedule:@selector(changeToLeft:)];
    }
     
    
    
}

-(void) changeToRight:(ccTime)dt{
    //NSLog(@"changing to right");
    BOOL moveOut = NO;
    for(int n = 0; n < [soldiers count]; n++){
        soldier* s = [soldiers objectAtIndex:n];
        [s unscheduleUpdate];
        if(s.sstate != 2){
            [s changeState:2];
        }
        if(s.position.x > 550){
            moveOut = YES;
        }else{
           s.position = ccp(s.position.x + s.speed, s.position.y);
           moveOut = NO;
        }
    }
    
    if(moveOut){
        //NSLog(@"all move out");
        CCSprite* bg1 =(CCSprite*) [self getChildByTag:1];
        bg1.visible = NO;
        CCSprite* b2 = (CCSprite*) [self getChildByTag:2];
        b2.visible = YES;
        
        for(int n = 0; n < [soldiers count]; n++){
            soldier* s = [soldiers objectAtIndex:n];
            [s reset];
        }
        [wave geneMonsters];
        [self scheduleUpdate];
        self.isTouchEnabled = YES;
        [self unschedule:@selector(changeToRight:)];
    }
    

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
