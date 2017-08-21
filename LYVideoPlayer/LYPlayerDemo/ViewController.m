//
//  ViewController.m
//  LYPlayerDemo
//
//  Created by liyang on 16/11/4.
//  Copyright © 2016年 com.liyang.player. All rights reserved.
//

#import "ViewController.h"
#import "VideoPlayer.h"

#import "LYVideoPlayer.h"



@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    _imageView = [[UIImageView alloc] init ];
    _imageView. frame = CGRectMake(100, 100, 90, 160);
    _imageView.image = [UIImage imageNamed:@"TK001.png"];
    _url =@"http://neptune.jipi-nobug.cn/quanminhongbao/moment/video/8.mp4";
    [self.view addSubview:_imageView];
    UIButton * myBtn = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 90,160)];

    [myBtn addTarget:self action:@selector(toPlayVideo) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:myBtn];
}
- (void)toPlayVideo{
    
    
    VideoPlayer *videoPlayer = [VideoPlayer new];
   // [videoPlayer beginAnimation:self.view image:_imageView];
    [videoPlayer videoPlayview:self.view videoImage:_imageView videoUrl:_url];

    
}






@end
