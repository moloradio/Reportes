//
//  Cotizacion.h
//  Reportes
//
//  Created by USER on 09/05/15.
//  Copyright (c) 2015 USER. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cliente.h"
#import "Articulo.h"

@interface Cotizacion : NSObject
@property(nonatomic, assign) int intCotizacion;
@property(nonatomic, assign) int intCliente;
@property(nonatomic, retain) NSString *nomCliente;
@property(nonatomic, retain) NSString *rfcCliente;
@property(nonatomic, retain) NSString *fechaAlta;
@property(nonatomic, strong) NSString *horaAlta;
@property(nonatomic, strong) NSString *fechaModificacion;
@property(nonatomic, assign) int intUsuario;
@property(nonatomic, strong) NSString *nomUsuario;
@property(nonatomic, strong) NSString *estatus;

@end
