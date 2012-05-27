//
//  CreditCardUtilTests.m
//  CreditCardUtilTests
//
//  Created by Ryan Murfitt on 27/05/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CreditCardUtilTests.h"
#import "CreditCardUtil.h"

@implementation CreditCardUtilTests

- (void)setUp
{
    [super setUp];
}

- (void)tearDown
{
    [super tearDown];
}

- (void)testMastercard51
{
    CreditCardType actual = [CreditCardUtil validCardTypeFromCardNumber:@"5123456789012346"];
    STAssertEquals(actual, MasterCard, nil);
}

- (void)testMastercard52
{
    CreditCardType actual = [CreditCardUtil validCardTypeFromCardNumber:@"5223456789012346"];
    STAssertEquals(actual, MasterCard, nil);
}

- (void)testMastercard53
{
    CreditCardType actual = [CreditCardUtil validCardTypeFromCardNumber:@"5323456789012346"];
    STAssertEquals(actual, MasterCard, nil);
}

- (void)testMastercard54
{
    CreditCardType actual = [CreditCardUtil validCardTypeFromCardNumber:@"5423456789012346"];
    STAssertEquals(actual, MasterCard, nil);
}

- (void)testMastercard55
{
    CreditCardType actual = [CreditCardUtil validCardTypeFromCardNumber:@"5523456789012346"];
    STAssertEquals(actual, MasterCard, nil);
}

- (void)testMastercard55Short
{
    CreditCardType actual = [CreditCardUtil validCardTypeFromCardNumber:@"552345678901234"];
    STAssertEquals(actual, Unknown, nil);
}

- (void)testMastercard55Long
{
    CreditCardType actual = [CreditCardUtil validCardTypeFromCardNumber:@"55234567890123467"];
    STAssertEquals(actual, Unknown, nil);
}

- (void)testVisa
{
    CreditCardType actual = [CreditCardUtil validCardTypeFromCardNumber:@"4123456789012"];
    STAssertEquals(actual, Visa, nil);
}

- (void)testVisa16Length
{
    CreditCardType actual = [CreditCardUtil validCardTypeFromCardNumber:@"4123456789012345"];
    STAssertEquals(actual, Visa, nil);
}

- (void)testVisaShort
{
    CreditCardType actual = [CreditCardUtil validCardTypeFromCardNumber:@"412345678901"];
    STAssertEquals(actual, Unknown, nil);
}

- (void)testVisaLong
{
    CreditCardType actual = [CreditCardUtil validCardTypeFromCardNumber:@"412345678901"];
    STAssertEquals(actual, Unknown, nil);
}

- (void)testAmex34
{
    CreditCardType actual = [CreditCardUtil validCardTypeFromCardNumber:@"341234567890123"];
    STAssertEquals(actual, Amex, nil);
}

- (void)testAmex37
{
    CreditCardType actual = [CreditCardUtil validCardTypeFromCardNumber:@"371234567890123"];
    STAssertEquals(actual, Amex, nil);
}

- (void)testAmex37Short
{
    CreditCardType actual = [CreditCardUtil validCardTypeFromCardNumber:@"37123456789012"];
    STAssertEquals(actual, Unknown, nil);
}

- (void)testAmex37Long
{
    CreditCardType actual = [CreditCardUtil validCardTypeFromCardNumber:@"37123456789012345"];
    STAssertEquals(actual, Unknown, nil);
}


- (void)testDiners300
{
    CreditCardType actual = [CreditCardUtil validCardTypeFromCardNumber:@"30012345678901"];
    STAssertEquals(actual, Diners, nil);
}

- (void)testDiners301
{
    CreditCardType actual = [CreditCardUtil validCardTypeFromCardNumber:@"30112345678901"];
    STAssertEquals(actual, Diners, nil);
}

- (void)testDiners302
{
    CreditCardType actual = [CreditCardUtil validCardTypeFromCardNumber:@"30212345678901"];
    STAssertEquals(actual, Diners, nil);
}

- (void)testDiners303
{
    CreditCardType actual = [CreditCardUtil validCardTypeFromCardNumber:@"30312345678901"];
    STAssertEquals(actual, Diners, nil);
}

- (void)testDiners304
{
    CreditCardType actual = [CreditCardUtil validCardTypeFromCardNumber:@"30412345678901"];
    STAssertEquals(actual, Diners, nil);
}

- (void)testDiners305
{
    CreditCardType actual = [CreditCardUtil validCardTypeFromCardNumber:@"30512345678901"];
    STAssertEquals(actual, Diners, nil);
}

- (void)testDiners36
{
    CreditCardType actual = [CreditCardUtil validCardTypeFromCardNumber:@"36012345678901"];
    STAssertEquals(actual, Diners, nil);
}

- (void)testDiners36Short
{
    CreditCardType actual = [CreditCardUtil validCardTypeFromCardNumber:@"3601234567890"];
    STAssertEquals(actual, Unknown, nil);
}

- (void)testDiners36Long
{
    CreditCardType actual = [CreditCardUtil validCardTypeFromCardNumber:@"360123456789012"];
    STAssertEquals(actual, Unknown, nil);
}

@end
