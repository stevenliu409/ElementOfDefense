//
//  mainLayer.h
//  ZombieDefense
//
//  Created by Hua Dong on 13-08-23.
//
//

#import "CCLayer.h"

@interface mainLayer : CCLayer{
    NSUserDefaults* prefs;
    int totalTime;
    int monsters;
    int totalScore;
    CGSize size;
}

+(id) sence;
-(void) goNext:(id) sender;
-(void) goShopping:(id) sender;
@end
