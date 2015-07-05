//
//  ViewControllerLogin.m
//  Reportes
//
//  Created by USER on 21/03/15.
//  Copyright (c) 2015 USER. All rights reserved.
//

#import "ViewControllerLogin.h"

@interface ViewControllerLogin ()

@end

@implementation ViewControllerLogin
@synthesize logPass, logUser,text;
@synthesize bAcceso;
@synthesize viewLogin;
@synthesize titlePassword, titlePromovago, titleUsuario;

- (void)viewDidLoad {
    [super viewDidLoad];
    bAcceso = YES;
    [self.view setBackgroundColor:[UIColor colorWithRed:(double)226/(double)255 green:(double)237/(double)255 blue:(double)231/(double)255 alpha:1]];
    [self.viewLogin setBackgroundColor:[UIColor colorWithRed:(double)107/(double)255 green:(double)88/(double)255 blue:(double)92/(double)255 alpha:1]];
    self.viewLogin.layer.cornerRadius = 6.0;
    
    [self.titlePassword setTextColor:[UIColor colorWithRed:(double)218/(double)255 green:(double)232/(double)255 blue:(double)224/(double)255 alpha:1]];
    [self.titlePromovago setTextColor:[UIColor colorWithRed:(double)218/(double)255 green:(double)232/(double)255 blue:(double)224/(double)255 alpha:1]];
    [self.titleUsuario setTextColor:[UIColor colorWithRed:(double)218/(double)255 green:(double)232/(double)255 blue:(double)224/(double)255 alpha:1]];
}

- (void)autentificarUser{
    usuario = logUser.text;
    password = logPass.text;
    WSLogin *log = [[WSLogin alloc] init];
    [log setDelegate_login:self];
    [log login:logUser.text pass:logPass.text vista:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    //segue = [[UIStoryboardSegue alloc] init];

    [self performSegueWithIdentifier:@"opciones" sender:nil];
    //[self autentificarUser];
}

- (IBAction)click:(id)sender {
    [self autentificarUser];
}

- (void)autentificarUsuario:(BOOL)acceso{
    NSLog(@"Autentificando Usuario");
    if (!acceso) {
        UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        UIViewController *vc = [storyBoard instantiateViewControllerWithIdentifier:@"listOpciones"];
        vc.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
        [self presentViewController:vc animated:YES completion:NULL];
    }else{
        UIAlertView *alerta = [[UIAlertView alloc] initWithTitle:@"Mensaje" message:@"Acceso Denegado" delegate:nil cancelButtonTitle:@"Aceptar" otherButtonTitles:nil, nil];
        [alerta show];
    }
}


@end
