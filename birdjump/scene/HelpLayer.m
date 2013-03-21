//
//  HelpLayer.m
//  birdjump
//
//  Created by Eric on 12-12-4.
//  Copyright (c) 2012年 Symetrix. All rights reserved.
//

#import "HelpLayer.h"
#import "MenuLayer.h"
@implementation HelpLayer
+(CCScene*)scene{
    CCScene* sc=[CCScene node];
    HelpLayer* la=[HelpLayer node];
    [sc addChild:la];
    return  sc;
}
-(id) init
{
	[super init];
    if (IS_IPHONE_5) {
        [self setBgWithFileName:@"bg-568h@2x.jpg"];
    }else{
        [self setBgWithFileName:SD_OR_HD(@"bg.jpg")];
    }
    //help content
    
    CCLabelTTF *label = [CCLabelTTF labelWithString:
                         [NSString stringWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"help" ofType:nil]
                          encoding:NSUTF8StringEncoding error:NULL] dimensions: CGSizeMake(winSize.width -20, winSize.height) hAlignment: UITextAlignmentCenter fontName:@"Arial"
                            fontSize: (IS_IPAD()?32:15)];
    
    
    [label setPosition:CGPointMake(winSize.width/2, winSize.height -(IS_IPAD()? 140:70))];
    
    [label setColor:ccBLACK];
    [label setAnchorPoint:CGPointMake(0.5f, 1.0f)];
    [self addChild:label];
    
    
    //-----
    CCLabelBMFont *facebookLabel = [CCLabelBMFont labelWithString:@"Folllow Me On FaceBook" fntFile:@"futura-48.fnt"];
    CCMenuItemLabel* facebook =[CCMenuItemLabel itemWithLabel:facebookLabel target:self selector:@selector(goFacebook:)];
    facebook.scale=HD2SD_SCALE;
    
    CCLabelBMFont *twitterLabel = [CCLabelBMFont labelWithString:@"Folllow Me On TWitter" fntFile:@"futura-48.fnt"];
    CCMenuItemLabel* twitter =[CCMenuItemLabel itemWithLabel:twitterLabel target:self selector:@selector(goTwitter:)];
    twitter.scale=HD2SD_SCALE;
    
    CCLabelBMFont *gorateLabel = [CCLabelBMFont labelWithString:@"Go Rate" fntFile:@"futura-48.fnt"];
    CCMenuItemLabel* rate =[CCMenuItemLabel itemWithLabel:gorateLabel target:self selector:@selector(goRate:)];
    rate.scale=HD2SD_SCALE;
    
    // go back
    CCLabelBMFont *gobackLabel = [CCLabelBMFont labelWithString:@"Go Back" fntFile:@"futura-48.fnt"];
    CCMenuItemLabel* back =[CCMenuItemLabel itemWithLabel:gobackLabel target:self selector:@selector(backCallback:)];
    back.scale=HD2SD_SCALE;
    
    
    CCMenu *menu = [CCMenu menuWithItems:
                    facebook,twitter,rate, back, nil];
    [menu alignItemsInColumns:
     [NSNumber numberWithUnsignedInt:1],
     [NSNumber numberWithUnsignedInt:1],
     [NSNumber numberWithUnsignedInt:2],
     nil
	 ];
    menu.anchorPoint=CGPointZero;
    menu.position=ccp(winSize.width/2,(IS_IPAD()? 340:110));
	[self addChild: menu];
    
    
    return self;
}
-(void) backCallback: (id) sender
{
	CCScene *sc = [CCScene node];
	[sc addChild:[MenuLayer node]];	
	[[CCDirector sharedDirector] replaceScene:  [CCTransitionSplitRows transitionWithDuration:1.0f scene:sc]];
}
-(void)goFacebook:(id)sender{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString: @"http://www.facebook.com/ygweric"]];
}
-(void)goTwitter:(id)sender{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString: @"https://twitter.com/ygweric"]];
}
-(void)goRate:(id)sender{
    [[UIApplication sharedApplication] openURL: [NSURL URLWithString:@"itms-apps://ax.itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?type=Purple+Software&id=583715731"]];
}

@end
