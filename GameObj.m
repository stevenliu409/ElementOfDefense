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
@synthesize health,dead,sstate,ani;

-(void) changeState:(int)state{
    
}

-(CCAnimation*) loadAnimation :(NSString *)aniName fileName:(NSString*) fn{
    //CCAnimation* ani;
    NSString* fileName = [[NSBundle mainBundle] pathForResource:fn ofType:@"plist"];
    NSLog(@"%@",fileName);
    NSDictionary* aniDic = [NSDictionary dictionaryWithContentsOfFile:fileName];
    if(aniDic == nil){
        NSLog(@"not find dic");
        return nil;
    }
    NSDictionary* aniSubDic = [aniDic objectForKey:aniName];
    if(aniSubDic == nil){
        NSLog(@"not find aniSubDic");
        NSLog(@"aniName is %@",aniSubDic);
        return nil;
    }
    CCAnimation* ani1 = [CCAnimation animation];
    float d = [[aniSubDic objectForKey:@"delay"]floatValue];
    [ani1 setDelayPerUnit:d];
    NSString* frameNums = [aniSubDic objectForKey:@"animationFrames"];
    NSArray *animationFrameNumbers =
    [frameNums componentsSeparatedByString:@","];
    
    NSString *animationFramePrefix =
    [aniSubDic objectForKey:@"filenamePrefix"];
    
    for (NSString *frameNumber in animationFrameNumbers) {
        NSString *frameName =
        [NSString stringWithFormat:@"%@%@.png",
         animationFramePrefix,frameNumber];
        [ani1 addSpriteFrame:[[CCSpriteFrameCache sharedSpriteFrameCache]spriteFrameByName:frameName]];
    }
    return ani1;
}

-(int)frameOfAnimation:(CCAnimation*)animation {
    CCTexture2D *tex = [self displayFrame].texture;
    CGRect rect = [self displayFrame].rect;
    
    int imageIndex = -1;
    for (int i=0; i<[animation.frames count]; i++) {
        CCAnimationFrame *frame = [[animation frames] objectAtIndex:i];
        CCTexture2D *tex2 = frame.spriteFrame.texture;
        CGRect rect2 = frame.spriteFrame.rect;
        if ([tex isEqual:tex2] && CGRectEqualToRect(rect, rect2)) {
            imageIndex = i;
            break;
        }
    }
    
    return imageIndex;
}

-(void) dealloc{
    [ani release];
    [super dealloc];
}


@end
