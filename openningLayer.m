//
//  openningLayer.m
//  Element Of Defense
//
//  Created by Hua Dong on 13-05-03.
//
//

#import "openningLayer.h"
#import "leve1.h"
#import "HelloWorldLayer.h"
#import "loadingLayer.h"
@interface openningLayer(PrivateMethod)

-(void) initBg;
-(void) initMenu;
@end

@implementation openningLayer

+(CCScene*) scene{
    
    CCScene* s = [CCScene node];
    openningLayer* layer = [openningLayer node];
    [s addChild:layer];
    return s;
}



-(id) init{
    if(self = [super init]){
        
        prefs = [NSUserDefaults standardUserDefaults];
        leve1* l1 = [[leve1 alloc] init];
        NSLog(@"bg is %@",l1.bgdir);
        NSData *d = [NSKeyedArchiver archivedDataWithRootObject:l1];
        [prefs setValue:d forKey:@"level1"];
        [prefs synchronize];
        [self initBg];
        [self initMenu];
        
        
    }
    return self;
    
}

-(void) initBg{
    CCSprite* bg = [CCSprite spriteWithFile:@"openbg.jpg"];
    bg.anchorPoint = ccp(0,0);
    size = [[CCDirector sharedDirector] winSize];
    bg.scaleX = size.width/bg.contentSize.width;
    bg.scaleY = size.height/bg.contentSize.height;
    [self addChild:bg z:1];
}

-(void) initMenu{
    CCMenuItem* m1 = [CCMenuItemFont itemWithString:@"level1" target:self selector:@selector(goLevel1:)];
    CCMenuItem* m2 = [CCMenuItemFont itemWithString:@"level2" target:self selector:@selector(goLevel2:)];
    CCMenu* m = [CCMenu menuWithItems:m1,m2, nil];
    m.position = ccp(size.width/2,size.height/2);
    [m alignItemsVertically];
    [self addChild:m z:3];
}


-(void) goLevel1:(id) sender{
    NSData* l = [prefs objectForKey:@"level1"];
    [prefs setValue:l forKey:@"currentLevel"];
    [prefs synchronize];
    [[CCDirector sharedDirector] replaceScene:[loadingLayer loadSence:@"openbg.jpg" from:1 to:1]];
    
}

-(void) goLevel2:(id) sender{
    
}



@end
