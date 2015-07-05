//
//  WSClientes.h
//  Reportes
//
//  Created by USER on 25/04/15.
//  Copyright (c) 2015 USER. All rights reserved.
//

#import <Foundation/Foundation.h>

@class WSCargarClientes;
@protocol EventosWSClientes <NSObject>
- (void)mostrarCliente:(NSMutableDictionary*)contCliente;
@end

@interface WSClientes : NSObject<NSXMLParserDelegate,NSURLConnectionDelegate,NSURLConnectionDataDelegate>
{
    NSMutableData *webData;
    NSXMLParser *xmlParser;
    NSString *stringActual;
    
    NSMutableDictionary *contCliente;
}
@property(nonatomic, assign) id<EventosWSClientes> delegate_clientes;

- (void)buscarProductoXRFC:(NSString*)clienteRFC;

@end
