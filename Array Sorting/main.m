//
//  main.m
//  Array Sorting
//
//  Created by Tyler Yan on 2015-07-07.
//  Copyright (c) 2015 Foodee. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
       
//        NSCharacterSet *trim = [[NSCharacterSet alphanumericCharacterSet] invertedSet];
        
        NSArray *array = @[
                           @"eeeeeAAbfdf",
                           @"Everything",
                           @"news to me",
                           @"timepiece",
                           @"egg",
                           @"eggs",
                           @"paper",
                           @"e",
                           @"facebook",
                           @"painting",
                           @"231 thurlow st",
                           @"99 bottles"
                           ];
        
        
        NSArray *sortArray = [array sortedArrayUsingComparator:^(NSString *obj1, NSString *obj2)
        {
            return [obj1 compare:obj2];
        }];
        
        NSArray *sortLength = [array sortedArrayUsingComparator:^(NSString *s1, NSString *s2)
        {
            if ([s1 length] != [s2 length]) {
                NSNumber* s1length = [NSNumber numberWithInt:[s1 length]];
                NSNumber* s2length = [NSNumber numberWithInt:[s2 length]];
                return [s2length compare:s1length];
            }
            else return [s2 compare:s1];
        }];
            
        
        NSArray *sortLastChar = [array sortedArrayUsingComparator:^(NSString *obj1, NSString *obj2)
        {
              NSString *lastObj1 = [obj1 substringFromIndex:[obj1 length] -1];
              NSString *lastObj2 = [obj2 substringFromIndex:[obj2 length] -1];
              return [lastObj1 compare:lastObj2];
        }];
        
        NSArray *sortE = [array sortedArrayUsingComparator:^NSComparisonResult(NSString *obj1, NSString *obj2)
                                 {
                                     NSUInteger occurrence1 = [[obj1 componentsSeparatedByString:@"e"] count]-1;
                                     NSUInteger occurrence2 = [[obj2 componentsSeparatedByString:@"e"] count]-1;
                                     if (occurrence1 < occurrence2) {
                                         return NSOrderedAscending;
                                     } else if (occurrence1 == occurrence2) {
                                         return NSOrderedSame;
                                     } else if (occurrence1 > occurrence2) {
                                         return NSOrderedDescending;
                                     }
                                     return 0;
                                     
                                 }];
        
        
        NSLog(@"\nAlphabetical %@", sortArray);
        NSLog(@"\nLength %@", sortLength);
        NSLog(@"\nLast Character Alphabetical %@", sortLastChar);
        NSLog(@"\nOccurrence of e %@", sortE);
        
        
    }
    
    
    return 0;
}
