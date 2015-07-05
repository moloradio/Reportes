//
//  WebService.h
//  Reportes
//
//  Created by USER on 21/03/15.
//  Copyright (c) 2015 USER. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Constantes.h"

@interface WebService : NSObject<NSXMLParserDelegate,NSURLConnectionDelegate,NSURLConnectionDataDelegate>
{
    NSMutableData *webData;
}
- (void)inicio;

@end
