#import "T1Array.h"

@implementation T1Array

// Complete the following fuction
- (NSArray *)convertToHappy:(NSArray *)sadArray {
    NSMutableArray* happyArray = [[NSMutableArray alloc]init];
    NSNumber* firstNumberInSadArray = [[NSNumber alloc]init];
    NSNumber* lastNumberInSadArray = [[NSNumber alloc]init];
    lastNumberInSadArray = [sadArray lastObject];
    firstNumberInSadArray = [sadArray firstObject];
    [happyArray addObject:firstNumberInSadArray];
    for (int i = 1; i< [sadArray count]-1; i++) {
        NSNumber* valueFromArraytoСomparison = [sadArray objectAtIndex:i];
        NSNumber* valueFromArray1= [sadArray objectAtIndex:i-1];
        NSNumber* valueFromArray2= [sadArray objectAtIndex:i+1];
        double number = [valueFromArraytoСomparison doubleValue];
        double number1 = [valueFromArray1 doubleValue];
        double number2 = [valueFromArray2 doubleValue];
        double calculation = number1 + number2;
        if (calculation > number) {
            [happyArray addObject:valueFromArraytoСomparison];
        }
    }
    [happyArray addObject:lastNumberInSadArray];
    return happyArray;
}
@end
