//
//  WSCargarProductos.h
//  Reportes
//
//  Created by USER on 11/04/15.
//  Copyright (c) 2015 USER. All rights reserved.
//

#import <Foundation/Foundation.h>

@class WSCargarProductos;
@protocol EventosWSProductos <NSObject>
@required
- (void)mostrarProducto:(NSMutableDictionary*)contProducto;
@end

@interface WSCargarProductos : NSObject<NSXMLParserDelegate,NSURLConnectionDelegate,NSURLConnectionDataDelegate>
{
    NSMutableData *webData;
    NSXMLParser *xmlParser;
    NSString *stringActual;
    
    NSMutableDictionary *contProducto;
    BOOL isExistProduct;
}
@property (nonatomic, assign) id<EventosWSProductos> delegate_producto;

- (NSString*)cargarProductos:(NSString*)producto;

@end
