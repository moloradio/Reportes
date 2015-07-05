//
//  ViewControllerVerCotizacion.m
//  Reportes
//
//  Created by USER on 11/04/15.
//  Copyright (c) 2015 USER. All rights reserved.
//

#import "ViewControllerVerCotizacion.h"

@interface ViewControllerVerCotizacion ()

@end

@implementation ViewControllerVerCotizacion
@synthesize nomCliente, tablaCotizaciones;
@synthesize numCotizacion, nombreCliente;

- (void)viewDidLoad {
    [super viewDidLoad];
    cotizaciones = [[Cotizaciones alloc] init];
    nomCliente.text = nombreCliente;
    arrayProductos = [cotizaciones getProductos:numCotizacion];
    NSLog(@"hola estas en ver productos %@ - %@", numCotizacion, nomCliente.text);
    [tablaCotizaciones setDataSource:self];
    [tablaCotizaciones setDelegate:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [arrayProductos count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    RowProducto *rowProducto = [[RowProducto alloc] init];
    Producto *producto = (Producto*)[arrayProductos objectAtIndex:[indexPath row]];
    [rowProducto inicializarElementos];
    rowProducto.titulo.text = [producto nombre];
    rowProducto.descripcion.text = [producto nombreCorto];
    rowProducto.cantidad.text = [NSString stringWithFormat:@"%.2f", [producto cantidad]];
    rowProducto.total.text = [NSString stringWithFormat:@"%.2f", [producto total]];
    return (UITableViewCell*)rowProducto;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)regresar:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
