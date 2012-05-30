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
    CreditCardType actual = [CreditCardUtil determineTypeFromCardNumber:@"5123456789012346"];
    STAssertEquals(actual, MasterCard, nil);
}

- (void)testMastercard52
{
    CreditCardType actual = [CreditCardUtil determineTypeFromCardNumber:@"5223456789012346"];
    STAssertEquals(actual, MasterCard, nil);
}

- (void)testMastercard53
{
    CreditCardType actual = [CreditCardUtil determineTypeFromCardNumber:@"5323456789012346"];
    STAssertEquals(actual, MasterCard, nil);
}

- (void)testMastercard54
{
    CreditCardType actual = [CreditCardUtil determineTypeFromCardNumber:@"5423456789012346"];
    STAssertEquals(actual, MasterCard, nil);
}

- (void)testMastercard55
{
    CreditCardType actual = [CreditCardUtil determineTypeFromCardNumber:@"5523456789012346"];
    STAssertEquals(actual, MasterCard, nil);
}

- (void)testVisa
{
    CreditCardType actual = [CreditCardUtil determineTypeFromCardNumber:@"4123456789012"];
    STAssertEquals(actual, Visa, nil);
}

- (void)testAmex34
{
    CreditCardType actual = [CreditCardUtil determineTypeFromCardNumber:@"341234567890123"];
    STAssertEquals(actual, Amex, nil);
}

- (void)testAmex37
{
    CreditCardType actual = [CreditCardUtil determineTypeFromCardNumber:@"371234567890123"];
    STAssertEquals(actual, Amex, nil);
}

- (void)testDiners300
{
    CreditCardType actual = [CreditCardUtil determineTypeFromCardNumber:@"30012345678901"];
    STAssertEquals(actual, Diners, nil);
}

- (void)testDiners301
{
    CreditCardType actual = [CreditCardUtil determineTypeFromCardNumber:@"30112345678901"];
    STAssertEquals(actual, Diners, nil);
}

- (void)testDiners302
{
    CreditCardType actual = [CreditCardUtil determineTypeFromCardNumber:@"30212345678901"];
    STAssertEquals(actual, Diners, nil);
}

- (void)testDiners303
{
    CreditCardType actual = [CreditCardUtil determineTypeFromCardNumber:@"30312345678901"];
    STAssertEquals(actual, Diners, nil);
}

- (void)testDiners304
{
    CreditCardType actual = [CreditCardUtil determineTypeFromCardNumber:@"30412345678901"];
    STAssertEquals(actual, Diners, nil);
}

- (void)testDiners305
{
    CreditCardType actual = [CreditCardUtil determineTypeFromCardNumber:@"30512345678901"];
    STAssertEquals(actual, Diners, nil);
}

- (void)testDiners36
{
    CreditCardType actual = [CreditCardUtil determineTypeFromCardNumber:@"36012345678901"];
    STAssertEquals(actual, Diners, nil);
}

@end
