//
//  ViewControllerLogin.h
//  Reportes
//
//  Created by USER on 21/03/15.
//  Copyright (c) 2015 USER. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"
#import "WSLogin.h"

@interface ViewControllerLogin : UIViewController<EventosLogin>
{
    NSString *usuario;
    NSString *password;
}

@property (weak, nonatomic) IBOutlet UITextField *logUser;
@property (weak, nonatomic) IBOutlet UITextField *logPass;
@property (weak, nonatomic) IBOutlet UITextView *text;
@property (weak, nonatomic) IBOutlet UIView *viewLogin;
@property (weak, nonatomic) IBOutlet UILabel *titlePromovago;
@property (weak, nonatomic) IBOutlet UILabel *titleUsuario;
@property (weak, nonatomic) IBOutlet UILabel *titlePassword;

@property (nonatomic, assign) BOOL bAcceso;

- (IBAction)click:(id)sender;

@end
