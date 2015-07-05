//
//  ViewControllerListCotizaciones.m
//  Reportes
//
//  Created by USER on 11/04/15.
//  Copyright (c) 2015 USER. All rights reserved.
//

#import "ViewControllerListCotizaciones.h"

@interface ViewControllerListCotizaciones ()

@end

@implementation ViewControllerListCotizaciones
@synthesize bttnRegresar, tablaCotizaciones;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    Cotizaciones *cotizaciones = [[Cotizaciones alloc] init];
    
    [tablaCotizaciones setDataSource:self];
    [tablaCotizaciones setDelegate:self];
    
    arregloCotizaciones = [cotizaciones getCotizaciones];
    
    [bttnRegresar addTarget:self action:@selector(regresar:) forControlEvents:UIControlEventTouchDown];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [arregloCotizaciones count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    RowCotizacion *rowCotizacion = [[RowCotizacion alloc] init];
    [rowCotizacion inicializarElementos];
    Cotizacion *cotizacion = (Cotizacion*)[arregloCotizaciones objectAtIndex:[indexPath row]];
    
    rowCotizacion.titulo.text = [NSString stringWithFormat:@"%i %@",cotizacion.intCotizacion,cotizacion.nomCliente];
    rowCotizacion.estatus.text = [cotizacion estatus];
    return (UITableViewCell*)rowCotizacion;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ViewControllerVerCotizacion *vc = [storyboard instantiateViewControllerWithIdentifier:@"contCotizacion"];
    Cotizacion *cotizacion = (Cotizacion*)[arregloCotizaciones objectAtIndex:[indexPath row]];
    vc.nombreCliente = cotizacion.nomCliente;
    vc.numCotizacion = [NSString stringWithFormat:@"%i", cotizacion.intCotizacion];
    vc.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:vc animated:YES completion:nil];
}

- (IBAction)regresar:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
