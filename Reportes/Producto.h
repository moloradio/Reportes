//
//  Producto.h
//  Reportes
//
//  Created by Aldo Ulises on 17/05/15.
//  Copyright (c) 2015 USER. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Producto : NSObject
@property (nonatomic, assign) int intContenido;
@property (nonatomic, strong) NSString *codigoProveedor;
@property (nonatomic, strong) NSString *nombre;
@property (nonatomic, strong) NSString *nombreCorto;
@property (nonatomic, assign) double precio;
@property (nonatomic, assign) double cantidad;
@property (nonatomic, assign) double total;
@property (nonatomic, assign) int intCotizacion;

@end
