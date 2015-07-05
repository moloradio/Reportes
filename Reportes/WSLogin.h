//
//  WSLogin.h
//  Reportes
//
//  Created by aldo ulises pena martinez on 28/03/15.
//  Copyright (c) 2015 USER. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import "WS/ASIFormDataRequest.h"

@class WSLogin;
@protocol EventosLogin <NSObject>
@required
- (void)autentificarUsuario:(BOOL)acceso;
@end

#import "ViewControllerLogin.h"

@interface WSLogin : NSObject<NSXMLParserDelegate,NSURLConnectionDelegate,NSURLConnectionDataDelegate>
{
    NSMutableData *webData;
    id vista;
    NSXMLParser *xmlParser;
    NSString *stringActual;
    NSString* bExisteError;
}
@property (nonatomic, assign) id<EventosLogin> delegate_login;

- (NSString*)login:(NSString*)usuarios pass:(NSString*)password vista:(id)view;
@end
