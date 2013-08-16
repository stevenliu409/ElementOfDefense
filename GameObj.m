//
//  GameObj.m
//  ZombieDefense
//
//  Created by Hua Dong on 13-08-16.
//
//

#import "GameObj.h"
#import "cocos2d.h"

@implementation GameObj
@synthesize health,dead,sstate;

-(void) changeState:(int)state{
    
}

-(CCAnimation*) loadAnimation :(NSString *)aniName fileName:(NSString*) fn{
    //CCAnimation* ani;
    NSString* fileName = [[NSBundle mainBundle] pathForResource:fn ofType:@"plist"];
    NSDictionary* aniDic = [NSDictionary dictionaryWithContentsOfFile:fileName];
    if(aniDic == nil){
        NSLog(@"not find dic");
        return nil;
    }
    NSDictionary* aniSubDic = [aniDic objectForKey:aniName];
    if(aniSubDic == nil){
        NSLog(@"not find aniSubDic");
        return nil;
    }
    CCAnimation* ani = [CCAnimation animation];
    float d = [[aniSubDic objectForKey:@"delay"]floatValue];
    [ani setDelayPerUnit:d];
    NSString* frameNums = [aniSubDic objectForKey:@"animationFrames"];
    NSArray *animationFrameNumbers =
    [frameNums componentsSeparatedByString:@","];
    
    NSString *animationFramePrefix =
    [aniSubDic objectForKey:@"filenamePrefix"];
    
    for (NSString *frameNumber in animationFrameNumbers) {
        NSString *frameName =
        [NSString stringWithFormat:@"%@%@.png",
         animationFramePrefix,frameNumber];
        [ani addSpriteFrame:[[CCSpriteFrameCache sharedSpriteFrameCache]spriteFrameByName:frameName]];
    }
    return ani;
}


@end
