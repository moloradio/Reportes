//
//  TablaSugerencias.h
//  Reportes
//
//  Created by Aldo Ulises on 27/06/15.
//  Copyright (c) 2015 USER. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Productos.h"

@class TablaSugerencias;
@protocol MostrarDetallesProductos <NSObject>
- (void)mostrarDetalles:(NSString*)productSelected;
@end

@interface TablaSugerencias : UITableView<UITableViewDelegate, UITableViewDataSource>
{
    Productos *productos;
    
    NSMutableArray *arreglo;
}
@property (nonatomic, assign) id<MostrarDetallesProductos> delegateTablaSugerencias;

- (void)mostrarSugerencias:(NSString*)producto;
@end
