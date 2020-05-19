#import "PalindromeSolver.h"

@implementation PalindromeSolver

// Complete the highestValuePalindrome function below.
- (NSString *) highestValuePalindrome:(NSString *)s n:(NSNumber *)n k:(NSNumber *)k {
    NSMutableString* result = [NSMutableString new];
    if (([n intValue] % 2) != 0) {
        return @"-1";
    }else {
        NSString* str1 = [s substringToIndex:s.length/2];
        NSString* str2 = [s substringFromIndex:s.length/2];
        int n = 0;
        NSMutableArray* array1 = [NSMutableArray new];
        NSMutableArray* array2 = [NSMutableArray new];
        for (int i=0 ; i <=str1.length-1; i++) {
            unichar sign1 = [str1 characterAtIndex:i];
            unichar sign2 = [str2 characterAtIndex:i];
            NSString* stringForArray1 = [NSString stringWithCharacters:&sign1 length:1];
            NSString* stringForArray2 = [NSString stringWithCharacters:&sign2 length:1];
            [array1 addObject:stringForArray1];
            [array2 addObject:stringForArray2];
        }
        NSMutableArray* reversArray = [[array2 reverseObjectEnumerator]allObjects];
        
        NSMutableArray* arrayToStoreIndex = [NSMutableArray new];
        for (int i =0; i <= [array1 count]-1; i++) {
            if ([[array1 objectAtIndex:i] isEqualToString:[reversArray objectAtIndex:i]])  {
            }else {
                n = n+1;
                NSNumber* index = [NSNumber numberWithInt:i];
                [arrayToStoreIndex addObject:index];
            }
        }
        if (n == 1 ) {
            int replaceIndex = [[arrayToStoreIndex firstObject]intValue];
            [reversArray replaceObjectAtIndex:replaceIndex withObject:[array1 objectAtIndex:replaceIndex]];
        } else if (n == [array1 count]-1 ) {
            int replaceIndex = [[arrayToStoreIndex firstObject]intValue];
            [array1 replaceObjectAtIndex:replaceIndex withObject:@"9"];
            for (NSInteger i =0; i<= n-1; i++) {
                int replaceIndex2 = [[arrayToStoreIndex objectAtIndex:i]intValue];
                [reversArray replaceObjectAtIndex:replaceIndex2 withObject:[array1 objectAtIndex:replaceIndex]];
            }
            
        }else{
            return @"-1";
        }
        NSArray* arr2 = [[reversArray reverseObjectEnumerator]allObjects ];
        for (int i = 0; i<= [array1 count]-1; i++) {
            [result appendString:[array1 objectAtIndex:i]];
        }
        for (int i = 0; i<= [array1 count]-1; i++) {
            [result appendString:[arr2 objectAtIndex:i]];
        }
    }
    return result;
}

@end
