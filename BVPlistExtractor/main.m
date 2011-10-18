//
//  main.m
//  PlistExtractor
//

#import <Foundation/Foundation.h>
#import "BVPlistExtractor.h"

int main (int argc, const char * argv[])
{
    
    @autoreleasepool {
        NSURL *urli386 = [NSURL fileURLWithPath:@"/tmp/i386.out"];
        NSURL *urlx86_64 = [NSURL fileURLWithPath:@"/tmp/x86_64.out"];
        NSURL *urlfat = [NSURL fileURLWithPath:@"/tmp/fat.out"];
        
        NSLog(@"i386: %p", BVExtractPlist(urli386, NULL));
        NSLog(@"x86_64 %p", BVExtractPlist(urlx86_64, NULL));
        NSLog(@"fat %p", BVExtractPlist(urlfat, NULL));
    }
    return 0;
}