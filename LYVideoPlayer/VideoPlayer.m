//
//  Mannager.m
//  LYPlayerDemo
//
//  Created by 王海玉 on 2017/8/2.
//  Copyright © 2017年 com.liyang.player. All rights reserved.
//

#import "VideoPlayer.h"
#import "ViewController.h"

@interface VideoPlayer () <LYVideoPlayerDelegate>

@property (nonatomic ,strong)LYVideoPlayer *videoPlayer;
@property (nonatomic ,strong) UIView *videoPlayBGView;



@property (nonatomic, strong) UIView   *myView;
@property (nonatomic, strong) UIImageView   *myImage;
@property (nonatomic ,copy)   NSString *myUrl;

- (void)stopAnimation;

@end;

@implementation VideoPlayer



static VideoPlayer *instance;

+(instancetype)allocWithZone:(struct _NSZone *)zone
{
    @synchronized (self) {
        if (instance == nil) {
            instance = [super allocWithZone:zone];
        }
        return instance;
    }
}



- (void)videoPlayview:(UIView *)view videoImage:(UIImageView *)image videoUrl:(NSString *)url{
    
    self.myView = view ;
    self.myImage = image;
    self.myUrl = url;
    
    [UIView beginAnimations:nil context:nil];
    
    [UIView setAnimationDuration:1];
    
    [UIView setAnimationDelegate:self];
    
    [UIView setAnimationDidStopSelector:@selector(beginAnimation)];
    
    self.myImage.frame =self.myView.frame;
    
    [UIView commitAnimations];

}


- (void)beginAnimation
{
    
    self.videoPlayBGView = [[UIView alloc] initWithFrame:CGRectMake(0, 20, SCREEN_WIDTH, SCREEN_HEIGHT)];
    self.videoPlayBGView.backgroundColor = [UIColor blackColor];
    [self.myView addSubview:self.videoPlayBGView];
    self.videoPlayer = [[LYVideoPlayer alloc] init];
    self.videoPlayer.delegate = self;
    [self.videoPlayer playWithUrl:self.myUrl showView:self.videoPlayBGView];
}


- (void)videoPlayerDidBackButtonClick{
    [UIView beginAnimations:nil context:nil];
    
    [UIView setAnimationDuration:1];
    
    [UIView setAnimationDelegate:self];
    
    [UIView setAnimationWillStartSelector:@selector(stopAnimation)];
    
    self.myImage.frame =CGRectMake(100, 100, 90, 160);
    
    [UIView commitAnimations];
    
}
- (void)stopAnimation{
    [self.videoPlayer stopVideo];
    self. videoPlayBGView.frame = CGRectMake(0, 0, 0, 0);
    //[self dismissViewControllerAnimated:YES completion:nil];
}
@end
