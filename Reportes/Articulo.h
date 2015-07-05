//
//  Articulo.h
//  Reportes
//
//  Created by USER on 09/05/15.
//  Copyright (c) 2015 USER. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Articulo : NSObject

@property (nonatomic, strong) NSString *codigoProveedor;
@property (nonatomic, strong) NSString *nombre;
@property (nonatomic, strong) NSString *nombreCorto;
@property (nonatomic, assign) double precio;
@property (nonatomic, assign) int intMoneda;
@property (nonatomic, strong) NSString *moneda;
@property (nonatomic, assign) BOOL tieneError;
@property (nonatomic, strong) NSString *mensaje;

@end
