//
//  ViewController.m
//  TheCountDown
//
//  Created by xunli on 2018/4/23.
//  Copyright © 2018年 caoji. All rights reserved.
//

#import "ViewController.h"
#import "WB_Stopwatch.h"
@interface ViewController ()<WB_StopWatchDelegate>
{
    WB_Stopwatch * stopWatchLabel;
}
@property(nonatomic,strong)UILabel* customLabel;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.customLabel =[[UILabel alloc]initWithFrame:CGRectMake(15, 150, self.view.frame.size.width-30, 40)];
    self.customLabel.textAlignment =NSTextAlignmentCenter;
    self.customLabel.textColor = [UIColor whiteColor];
    self.customLabel.backgroundColor =[UIColor blackColor];
    self.customLabel.text =@"00:00:00";
    [self.customLabel setFont:[UIFont fontWithName:@"Arial" size:45]];
    [self.view addSubview:self.customLabel];
    /****************************我是分割线**************************************************/
    stopWatchLabel = [[WB_Stopwatch alloc]initWithLabel:_customLabel andTimerType:WBTypeTimer];
    stopWatchLabel.delegate = self;
    [stopWatchLabel setTimeFormat:@"HH:mm:ss SS"];
    [stopWatchLabel setCountDownTime:3700];//多少秒 （1分钟 == 60秒）
    /****************************我是分割线**************************************************/
    UIButton* starButton =[[UIButton alloc]initWithFrame:CGRectMake(20, 210, 60, 40)];
    [starButton setTitle:@"开始" forState:UIControlStateNormal];
    [starButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [starButton addTarget:self action:@selector(startButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:starButton];
    
    UIButton* SopButton =[[UIButton alloc]initWithFrame:CGRectMake(80, 210, 60, 40)];
    [SopButton setTitle:@"暂停" forState:UIControlStateNormal];
    [SopButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [SopButton addTarget:self action:@selector(SopButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:SopButton];
    
    UIButton* restButton =[[UIButton alloc]initWithFrame:CGRectMake(140, 210, 60, 40)];
    [restButton setTitle:@"重置" forState:UIControlStateNormal];
    [restButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [restButton addTarget:self action:@selector(restButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:restButton];
}
-(void)startButton{
    [stopWatchLabel start];
}
-(void)SopButton{
     [stopWatchLabel pause];
}
-(void)restButton{
    [stopWatchLabel reset];
}

//时间到了
-(void)timerLabel:(WB_Stopwatch*)timerLabel finshedCountDownTimerWithTime:(NSTimeInterval)countTime{
    
    UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"抢购时间结束" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        NSLog(@"countTime:%f",countTime);
    }];
    [alert addAction:action];
    [self presentViewController:alert animated:YES completion:nil];
}

//开始倒计时
-(void)timerLabel:(WB_Stopwatch*)timerlabel
       countingTo:(NSTimeInterval)time
        timertype:(WB_StopwatchLabelType)timerType {
    //NSLog(@"time:%f",time);
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
