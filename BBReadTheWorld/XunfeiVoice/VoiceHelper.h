//
//  VoiceHelper.h
//  WordRecognition
//
//  Created by Kino on 19/03/15.
//  Copyright © 2019年 Kino. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <iflyMSC/IFlySpeechConstant.h>
#import <iflyMSC/IFlySpeechSynthesizer.h>
#import <iflyMSC/IFlySpeechSynthesizerDelegate.h>

@interface VoiceHelper : NSObject

@property (nonatomic, strong) IFlySpeechSynthesizer *speechSynthesizer;

/**
 *  return sharedInstance.usage:setSpeechSynthesizerDelegate first;
 *
 *  @return 
 */
+ (id)sharedInstance;

/**
 *  start speeking
 *
 *  @param word       合成语音
 *  @param paramaters 合成参数.若无,则使用默认的
 */
- (void)startSpeaking:(NSString *)word withParamaters:(NSDictionary *)paramaters;

- (void)stopSpeak;

/**
 *  set delegate
 *
 *  @param delegate 
 */
- (void)setSpeechSynthesizerDelegate:(id)delegate;

@end
