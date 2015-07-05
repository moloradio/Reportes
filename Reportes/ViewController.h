//
//  ViewController.h
//  Reportes
//
//  Created by USER on 21/03/15.
//  Copyright (c) 2015 USER. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WebService.h"
#import "WSCargarProductos.h"
#import "WSClientes.h"
#import "Productos.h"
#import "RowProducto.h"
#import "Cliente.h"
#import "Producto.h"
#import "Cotizaciones.h"
#import "TablaSugerencias.h"

@interface ViewController : UIViewController<UITableViewDataSource, UITableViewDelegate, EventosWSProductos, EventosWSClientes, MostrarDetallesProductos>
{
    WSCargarProductos *productos;
    WSClientes *wsClientes;
    Productos *modelProducto;
    
    NSMutableArray *rowProductos;
    
    double totalProductSelected;
    
    Producto *cellProducto;
    
    TablaSugerencias *tablaSugerencias;
}

- (IBAction)regresar:(id)sender;
- (IBAction)buscarProducto:(id)sender;
- (IBAction)buscarXRfc:(id)sender;
- (IBAction)agregarProducto:(id)sender;
- (IBAction)ocultarTeclado:(id)sender;
- (IBAction)guardarCotizacion:(id)sender;
- (IBAction)mostrarSugerencias:(id)sender;
- (IBAction)cerrarSugerencias:(id)sender;

@property (weak, nonatomic) IBOutlet UITextField *rfcCliente;

@property (weak, nonatomic) IBOutlet UITextField *noCliente;
@property (weak, nonatomic) IBOutlet UITextField *nombreCliente;
@property (weak, nonatomic) IBOutlet UIButton *regresar;
@property (weak, nonatomic) IBOutlet UITextField *producto;
@property (weak, nonatomic) IBOutlet UITextField *nombreProducto;
@property (weak, nonatomic) IBOutlet UITextField *precioProducto;
@property (weak, nonatomic) IBOutlet UITextField *cantidadProducto;
@property (weak, nonatomic) IBOutlet UITableView *tablaProducto;
@property (weak, nonatomic) IBOutlet UILabel *totalProductos;
@property (weak, nonatomic) IBOutlet UIView *viewSugerencias;
@end

