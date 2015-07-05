//
//  WSEnvioCotizacion.h
//  Reportes
//
//  Created by USER on 09/05/15.
//  Copyright (c) 2015 USER. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WSEnvioCotizacion : NSObject<NSXMLParserDelegate,NSURLConnectionDelegate,NSURLConnectionDataDelegate>
{
    NSMutableData *webData;
    NSXMLParser *xmlParser;
    NSString *stringActual;
    
    NSMutableDictionary *contCliente;
}
@end
