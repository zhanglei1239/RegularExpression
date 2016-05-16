//
//  RegularExpressionTool.m
//  RegularExpressionForOc
//
//  Created by Mac on 16/5/16.
//  Copyright © 2016年 zhanglei. All rights reserved.
//

#import "RegularExpressionTool.h"

@implementation RegularExpressionTool

+ (RegularExpressionTool *)sharedManager{
    static RegularExpressionTool *shareRegularManagerInstance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        shareRegularManagerInstance = [[self alloc] init];
    });
    return shareRegularManagerInstance;
}

//账号
- (BOOL) validateAccount:(NSString *)account
{
    NSString *passWordRegex = @"^[a-zA-Z0-9]{4,20}+$";
    NSPredicate *passWordPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",passWordRegex];
    return [passWordPredicate evaluateWithObject:account];
}

//密码
- (BOOL) validatePassword:(NSString *)passWord
{
    NSString *passWordRegex = @"^[a-zA-Z0-9]{6,10}+$";
    NSPredicate *passWordPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",passWordRegex];
    return [passWordPredicate evaluateWithObject:passWord];
}
//手机号
- (BOOL) validatePhone:(NSString *)phone
{
    NSString *passWordRegex = @"^[1][3458][0-9]{9}$";
    NSPredicate *passWordPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",passWordRegex];
    return [passWordPredicate evaluateWithObject:phone];
}
//邮箱
- (BOOL)validateEmail:(NSString *)email
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}

//中文2-4字验证
- (BOOL)validateChinese2_4:(NSString *)name{
    NSString *emailRegex = @"^[\u4e00-\u9fa5]{2,4}$";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:name];
}

//中文姓名判断
- (BOOL)validatePersonName:(NSString *)chinesesName{
    NSString *emailRegex = @"^[\u4e00-\u9fa5]{2,4}$";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:chinesesName];
}

//全数字判断
- (BOOL)validateNumber:(NSString *)number{
    NSString *emailRegex = @"^[0-9]*$";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:number];
}

//银行账号判断
- (BOOL)validateBankNumber:(NSString *)number{
    return [self validateNumber:number];
}

//判断营业执照编号
- (BOOL)validateBusinessLicenseCode:(NSString *)number{
    NSString *emailRegex = @"^[0-9]{15}$";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:number];
}

//判断企业法人
- (BOOL)validateLegalPerson:(NSString *)name{
    return [self validatePersonName:name];
}

//判断身份证
- (BOOL)validateIdCardNum:(NSString *)idCardNum{
    NSString *passWordRegex = @"^(\\d{14}|\\d{17})(\\d|[xX])$";
    NSPredicate *identityCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",passWordRegex];
    return [identityCardPredicate evaluateWithObject:idCardNum];
}

//判断社保号
- (BOOL)validateSocialSecurityNumber:(NSString *)socialSecurityNumber{
    return [self validateNumber:socialSecurityNumber];
}

//判断驾驶证号
- (BOOL)validateDriverLicenseNumber:(NSString *)driverLicenseNumber{
    return [self validateIdCardNum:driverLicenseNumber];
}

//判断佣金率
- (BOOL)validateCommissionRatio:(NSString *)commissionRatio{
    return [self validateNumber:commissionRatio];
}

//短信验证码
- (BOOL)validateMessagePwd:(NSString *)messagePwd{
    NSString *passWordRegex = @"^[a-zA-Z0-9]{6}+$";
    NSPredicate *passWordPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",passWordRegex];
    return [passWordPredicate evaluateWithObject:messagePwd];
}

//判断多少位的数字
- (BOOL)validateNumberWithSize:(NSString *)number size:(int)size{
    NSString *passWordRegex = [NSString stringWithFormat:@"^[0-9]{1,%d}$",size] ;
    NSPredicate *passWordPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",passWordRegex];
    return [passWordPredicate evaluateWithObject:number];
}

//判断日期格式
- (BOOL)validateDate:(NSString *)date{
    NSString * dateWordRegex = [NSString stringWithFormat:@"^(?:(?!0000)[0-9]{4}-(?:(?:0[1-9]|1[0-2])-(?:0[1-9]|1[0-9]|2[0-8])|(?:0[13-9]|1[0-2])-(?:29|30)|(?:0[13578]|1[02])-31)|(?:[0-9]{2}(?:0[48]|[2468][048]|[13579][26])|(?:0[48]|[2468][048]|[13579][26])00)-02-29)$"];
    NSPredicate * datePredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",dateWordRegex];
    return [datePredicate evaluateWithObject:date];
}

//判断价格字符串
- (BOOL)validatePrice:(NSString *)price{
    NSString * priceWordRegex = [NSString stringWithFormat:@"^[0-9]+(.[0-9]{2})?$"];
    NSPredicate * pricePredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",priceWordRegex];
    return [pricePredicate evaluateWithObject:price];
}
@end
