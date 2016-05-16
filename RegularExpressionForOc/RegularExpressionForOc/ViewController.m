//
//  ViewController.m
//  RegularExpressionForOc
//
//  Created by Mac on 16/5/16.
//  Copyright © 2016年 zhanglei. All rights reserved.
//
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define TABLEVIEWCELL_IDENT @"tableviewcell_ident"
#import "ViewController.h"
#import "RegularExpressionTool.h"
#import "Toast+UIView.h"
@interface ViewController ()
{
    UITableView * regularTableView;
    NSMutableArray * holderArray;
    NSMutableDictionary * utfDic;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
 
    [self initData];
    
    [self.view setBackgroundColor:[UIColor redColor]];
    
    UILabel * lblTitle = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 60)];
    [lblTitle setText:@"正则验证"];
    [lblTitle setTextAlignment:NSTextAlignmentCenter];
    [lblTitle setTextColor:[UIColor whiteColor]];
    [lblTitle setBackgroundColor:[UIColor blackColor]];
    [self.view addSubview:lblTitle];
    
    regularTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 60, SCREEN_WIDTH, SCREEN_HEIGHT-60)];
    regularTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    regularTableView.dataSource = self;
    regularTableView.delegate = self;
    regularTableView.backgroundColor = [UIColor whiteColor];
    [regularTableView.layer setBorderColor:[UIColor whiteColor].CGColor];
    [self.view addSubview:regularTableView];
    
}

-(void)initData{
    NSArray * arr = @[@"账号",@"密码",@"手机号",@"邮箱",@"中文2~4",@"验证数字",@"日期",@"金额"];
    holderArray = [NSMutableArray arrayWithArray:arr];
    utfDic = [[NSMutableDictionary alloc] init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 40;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:TABLEVIEWCELL_IDENT];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:TABLEVIEWCELL_IDENT];
    }
    
    UITextField * utf = [[UITextField alloc] initWithFrame:CGRectMake(5, 0, tableView.frame.size.width-60, 40)];
    utf.delegate = self;
    [utf.layer setMasksToBounds:YES];
    [utf.layer setCornerRadius:4];
    utf.placeholder = [holderArray objectAtIndex:indexPath.row];
    [cell addSubview:utf];
    
    [utfDic setObject:utf forKey:[NSString stringWithFormat:@"%ld",indexPath.row]];
    
    UIButton * btn = [[UIButton alloc] initWithFrame:CGRectMake(tableView.frame.size.width-45, 0, 40, 40)];
    [btn setTag:indexPath.row];
    [btn addTarget:self action:@selector(validate:) forControlEvents:UIControlEventTouchUpInside];
    [btn setBackgroundColor:[UIColor blackColor]];
    [btn setTitle:@"验证" forState:UIControlStateNormal];
    [cell addSubview:btn];
    
    UIView * line = [[UIView alloc] initWithFrame:CGRectMake(0, 39.5, SCREEN_WIDTH, .5)];
    [line setBackgroundColor:[UIColor grayColor]];
    [cell addSubview:line];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return holderArray.count;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

-(void)validate:(id)sender{
    UIButton * button = (UIButton *)sender;
    NSInteger tag = button.tag;
    RegularExpressionTool * tool  =[RegularExpressionTool sharedManager];
    switch (tag) {
        case 0:
        {
            UITextField * utf = [utfDic objectForKey:[NSString stringWithFormat:@"%ld",tag]];
            BOOL isTrue = [tool validateAccount:utf.text];
            if (isTrue) {
                [self.view makeToast:@"账号信息正确" withValue:@"" withTextColor:[UIColor greenColor]];
            }else{
                [self.view makeToast:@"账号信息错误" withValue:@"" withTextColor:[UIColor redColor]];
            }
        }
            break;
        case 1:
        {
            UITextField * utf = [utfDic objectForKey:[NSString stringWithFormat:@"%ld",tag]];
            BOOL isTrue = [tool validatePassword:utf.text];
            if (isTrue) {
                [self.view makeToast:@"密码信息正确" withValue:@"" withTextColor:[UIColor greenColor]];
            }else{
                [self.view makeToast:@"密码信息错误" withValue:@"" withTextColor:[UIColor redColor]];
            }
        }
            break;
        case 2:
        {
            UITextField * utf = [utfDic objectForKey:[NSString stringWithFormat:@"%ld",tag]];
            BOOL isTrue = [tool validatePhone:utf.text];
            if (isTrue) {
                [self.view makeToast:@"手机号码信息正确" withValue:@"" withTextColor:[UIColor greenColor]];
            }else{
                [self.view makeToast:@"手机号码信息错误" withValue:@"" withTextColor:[UIColor redColor]];
            }
        }
            break;
        case 3:
        {
            UITextField * utf = [utfDic objectForKey:[NSString stringWithFormat:@"%ld",tag]];
            BOOL isTrue = [tool validateEmail:utf.text];
            if (isTrue) {
                [self.view makeToast:@"邮箱信息正确" withValue:@"" withTextColor:[UIColor greenColor]];
            }else{
                [self.view makeToast:@"邮箱信息错误" withValue:@"" withTextColor:[UIColor redColor]];
            }
        }
            break;
        case 4:
        {
            UITextField * utf = [utfDic objectForKey:[NSString stringWithFormat:@"%ld",tag]];
            BOOL isTrue = [tool validateChinese2_4:utf.text];
            if (isTrue) {
                [self.view makeToast:@"中文昵称信息正确" withValue:@"" withTextColor:[UIColor greenColor]];
            }else{
                [self.view makeToast:@"中文昵称信息错误" withValue:@"" withTextColor:[UIColor redColor]];
            }
        }
            break;
        case 5:
        {
            UITextField * utf = [utfDic objectForKey:[NSString stringWithFormat:@"%ld",tag]];
            BOOL isTrue = [tool validateNumber:utf.text];
            if (isTrue) {
                [self.view makeToast:@"数字信息正确" withValue:@"" withTextColor:[UIColor greenColor]];
            }else{
                [self.view makeToast:@"数字信息错误" withValue:@"" withTextColor:[UIColor redColor]];
            }
        }
            break;
        case 6:
        {
            UITextField * utf = [utfDic objectForKey:[NSString stringWithFormat:@"%ld",tag]];
            BOOL isTrue = [tool validateDate:utf.text];
            if (isTrue) {
                [self.view makeToast:@"日期信息正确" withValue:@"" withTextColor:[UIColor greenColor]];
            }else{
                [self.view makeToast:@"日期信息错误" withValue:@"" withTextColor:[UIColor redColor]];
            }
        }
            break;
        case 7:
        {
            UITextField * utf = [utfDic objectForKey:[NSString stringWithFormat:@"%ld",tag]];
            BOOL isTrue = [tool validatePrice:utf.text];
            if (isTrue) {
                [self.view makeToast:@"金额信息正确" withValue:@"" withTextColor:[UIColor greenColor]];
            }else{
                [self.view makeToast:@"金额信息错误" withValue:@"" withTextColor:[UIColor redColor]];
            }
        }
            break;
            
        default:
            break;
    }
}

@end
