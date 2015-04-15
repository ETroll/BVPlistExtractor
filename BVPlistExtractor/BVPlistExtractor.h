//
// PlistExtractor.h
//
// Copyright (C) 2011 by Bavarious
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import <Foundation/Foundation.h>

#ifndef __has_feature
#define __has_feature(x) 0  // Compatibility with non-clang compilers
#endif
#ifndef __has_extension
#define __has_extension __has_feature // Compatibility with pre-3.0 compilers
#endif

#if __has_feature(objc_arc)
#define BVAUTORELEASE(obj) obj
#define BVAUTORELEASING __autoreleasing
#else
#define BVAUTORELEASE(obj) [obj autorelease]
#define BVAUTORELEASING
#endif

// BVExtractPlist()
//
// Extracts a plist that has been embedded in the  __TEXT __info_plist section
// of a binary file
//
// INPUT:
//
//     url: a URL pointing to the binary file.
//
// OUTPUT:
// 
//     error: if different from NULL and the return value is nil, an error object
//     describing the reason why the plist couldn't be extracted.
//
// RETURN VALUE:
//
//     A property list object corresponding to the data in __TEXT __info_plist,
//     or nil in case of error
//
// NOTES:
//
//     This function is known to work with the following formats:
//
//     . Mach-O, i386
//     . Mach-O, x86_64
//     . Fat/universal containing at least one of
//       Mach-O i386, Mach-O x86_64

id BVExtractPlist(NSURL *url, NSError * BVAUTORELEASING *error);

// Constants for error reporting
extern NSString * const BVPlistExtractorErrorDomain;
extern const NSInteger BVPlistExtractorErrorOpenFile;
extern const NSInteger BVPlistExtractorErrorEmptyFile;
extern const NSInteger BVPlistExtractorErrorCorruptMachO;
