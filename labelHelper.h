//
//  labelHelper.h
//  ZombieDefense
//
//  Created by Hua Dong on 13-08-23.
//
//

#import "CCLabelTTF.h"
#import "CCLayer.h"
@interface labelHelper : CCLabelTTF

+(id) makeLabel:(NSString *)str layer:(CCLayer *)l position:(CGPoint)point fontsize:(int) fs zValue:(int) zv;
-(id) initLabel:(NSString*) str layer:(CCLayer* )l position:(CGPoint) point fontsize:(int) fs zValue:(int) zv;

@end
