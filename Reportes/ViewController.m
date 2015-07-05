//
//  ViewController.m
//  Reportes
//
//  Created by USER on 21/03/15.
//  Copyright (c) 2015 USER. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize producto,nombreProducto,precioProducto,tablaProducto,cantidadProducto;
@synthesize noCliente, nombreCliente, rfcCliente;
@synthesize totalProductos;
@synthesize viewSugerencias;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    tablaSugerencias = [[TablaSugerencias alloc] initWithFrame:CGRectMake(0, 0, viewSugerencias.frame.size.width, viewSugerencias.frame.size.height)];
    [tablaSugerencias setDelegateTablaSugerencias:self];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    rowProductos = [[NSMutableArray alloc] init];
    [tablaProducto setDataSource:self];
    [tablaProducto setDelegate:self];
    totalProductSelected = 0;
    [self.view setBackgroundColor:[UIColor colorWithRed:(double)226/(double)255 green:(double)237/(double)255 blue:(double)231/(double)255 alpha:1]];
    
    [self.viewSugerencias.layer setCornerRadius:6.0];
    [self.viewSugerencias.layer setBorderWidth:1];
    [self.viewSugerencias.layer setShadowOffset:CGSizeMake(1, 2)];
    [self.viewSugerencias addSubview:tablaSugerencias];
    [self.viewSugerencias setHidden:YES];
    // Do any additional setup after loading the view, typically from a nib.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [rowProductos count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    RowProducto *celda = [[RowProducto alloc] initWithFrame:CGRectMake(0, 0, tablaProducto.frame.size.width, 44)];
    [celda inicializarElementos];
    celda.titulo.text = [cellProducto nombre];
    celda.descripcion.text = [cellProducto nombreCorto];
    celda.cantidad.text = [NSString stringWithFormat:@"%.0f", [cellProducto cantidad]];
    celda.total.text = [NSString stringWithFormat:@"%.2f", [cellProducto total]];
    return (UITableViewCell*)celda;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UIAlertView *alerta = [[UIAlertView alloc] initWithTitle:@"Boton" message:nil delegate:nil cancelButtonTitle:@"Aceptar" otherButtonTitles:nil, nil];
    [alerta show];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)regresar:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)mostrarProducto:(NSMutableDictionary*)contProducto{
    
    if ([[contProducto objectForKey:@"tieneError"] isEqualToString:@"false"]) {
        cellProducto = [[Producto alloc] init];
        [cellProducto setCodigoProveedor:[contProducto objectForKey:@"codigoProveedor"]];
        [cellProducto setNombre:[contProducto objectForKey:@"nombre"]];
        [cellProducto setNombreCorto:[contProducto objectForKey:@"nombreCorto"]];
        [cellProducto setPrecio:[[contProducto objectForKey:@"precio"] doubleValue]];
        
        nombreProducto.text = [contProducto objectForKey:@"nombre"];
        precioProducto.text = [contProducto objectForKey:@"precio"];
    }else{
        UIAlertView *msgError = [[UIAlertView alloc] initWithTitle:@"Mensaje" message:[contProducto objectForKey:@"mensaje"] delegate:nil cancelButtonTitle:@"Aceptar" otherButtonTitles:nil, nil];
        [msgError show];
    }
    
}

- (void)mostrarCliente:(NSMutableDictionary*)contCliente{
    if ([[contCliente objectForKey:@"tieneError"] isEqualToString:@"false"]) {
        noCliente.text = [contCliente objectForKey:@"intCliente"];
        nombreCliente.text = [NSString stringWithFormat:@"%@ %@ %@",[contCliente objectForKey:@"nombre"]
                                                                   ,[contCliente objectForKey:@"aPaterno"]
                                                                   ,[contCliente objectForKey:@"aMaterno"]];
        rfcCliente.text = [contCliente objectForKey:@"RFC"];
    }else{
        UIAlertView *msgError = [[UIAlertView alloc] initWithTitle:@"Mensaje" message:[contCliente objectForKey:@"mensaje"] delegate:nil cancelButtonTitle:@"Aceptar" otherButtonTitles:nil, nil];
        [msgError show];
    }
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    [rowProductos removeObjectAtIndex:[indexPath row]];
    [tablaProducto beginUpdates];
    [tablaProducto deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationMiddle];
    [tablaProducto endUpdates];
}

- (IBAction)buscarProducto:(id)sender {
    
    productos = [[WSCargarProductos alloc] init];
    [productos setDelegate_producto:self];
    [productos cargarProductos:producto.text];
    
}

- (IBAction)buscarXRfc:(id)sender {
    
    wsClientes = [[WSClientes alloc] init];
    [wsClientes setDelegate_clientes:self];
    [wsClientes buscarProductoXRFC:rfcCliente.text];
    
}

- (IBAction)agregarProducto:(id)sender {
    if (cellProducto) {
        [self addProducto:sender];
    }else{
        UIAlertView *alerta = [[UIAlertView alloc] initWithTitle:@"Mensaje" message:@"No ha seleccionado producto" delegate:nil cancelButtonTitle:@"Aceptar" otherButtonTitles:nil, nil];
        [alerta show];
    }
}

- (void)addProducto:(id)sender{
    NSIndexPath *path = [NSIndexPath indexPathForRow:[rowProductos count] inSection:0];
    
    [cellProducto setCantidad:[[cantidadProducto text] doubleValue]];
    [cellProducto setTotal:([precioProducto.text doubleValue] * [cantidadProducto.text doubleValue])];
    
    totalProductSelected += [cellProducto total];
    
    [rowProductos insertObject:cellProducto atIndex:[rowProductos count]];
    
    [tablaProducto beginUpdates];
    [tablaProducto insertRowsAtIndexPaths:[NSArray arrayWithObject:path] withRowAnimation:UITableViewRowAnimationMiddle];
    [tablaProducto endUpdates];
    
    totalProductos.text = [NSString stringWithFormat:@"%.2f",totalProductSelected];
}

- (IBAction)ocultarTeclado:(id)sender {
    [sender resignFirstResponder];
    /*UIAlertView *alerta = [[UIAlertView alloc] initWithTitle:@"" message:@"Mensaje" delegate:nil cancelButtonTitle:@"Aceptar" otherButtonTitles:nil, nil];
    [alerta show];*/
}

- (IBAction)guardarCotizacion:(id)sender {
    
    Cliente *cliente = [[Cliente alloc] init];
    [cliente setIntCliente:[noCliente.text intValue]];
    [cliente setNombre:nombreCliente.text];
    [cliente setRfc:rfcCliente.text];
    
    Cotizaciones *cotiza = [[Cotizaciones alloc] init];
    [cotiza guardarCotizacion:cliente prod:rowProductos];
    
}

- (IBAction)mostrarSugerencias:(id)sender {
    //modelProducto = [[Productos alloc] init];
    NSString *cadena = self.producto.text;
    if (cadena.length > 1) {
        [tablaSugerencias mostrarSugerencias:cadena];
        [self.viewSugerencias setHidden:NO];
    }else{
        [self.viewSugerencias setHidden:YES];
    }
}

- (IBAction)cerrarSugerencias:(id)sender {
    [self.viewSugerencias setHidden:YES];
}

- (void)mostrarDetalles:(NSString*)productSelected{
    
    /*UIAlertView *alerta = [[UIAlertView alloc] initWithTitle:@"" message:productSelected delegate:nil cancelButtonTitle:@"Aceptar" otherButtonTitles:nil, nil];
    [alerta show];*/
    
    productos = [[WSCargarProductos alloc] init];
    [productos setDelegate_producto:self];
    [productos cargarProductos:productSelected];
    producto.text = productSelected;
    [self.viewSugerencias setHidden:YES];
    
}

@end