//
//  MainViewController.m
//  Protección Civil
//
//  Created by Julio César on 5/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController() 
{
@private
    UITextField *textFieldDondeEstoy;
    UITextField *textFieldADondeIre;
    CGPoint contentOffset;
}
@end

@implementation MainViewController
@synthesize scrollView;
@synthesize label0;
@synthesize label1;
@synthesize label2;
@synthesize label3;
@synthesize labelPregunta;
@synthesize activityIndicatorView;
@synthesize readyButton;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    [scrollView setContentOffset:CGPointMake(1.0, 0.0)];
    [scrollView setContentOffset:CGPointMake(0.0, 0.0)];
}

-(void)viewWillAppear:(BOOL)animated
{
    
    [scrollView setContentOffset:contentOffset];
    
}

- (void)viewDidUnload
{
    [self setScrollView:nil];
    [self setLabel0:nil];
    [self setLabel1:nil];
    [self setLabel2:nil];
    [self setLabel3:nil];
    [self setLabelPregunta:nil];
    [self setActivityIndicatorView:nil];
    [self setReadyButton:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)optionAction:(id)sender {
    
    UIButton *option = (UIButton *)sender;
    CGFloat x;
    switch (option.tag) {
        case 1001:
            [label0 setText:@"Hola me encuentro bien"];
            x = scrollView.contentOffset.x + scrollView.frame.size.width;
            break;
        case 1002:
            [label0 setText:@"Hola me encuentro en peligro"];
            x = scrollView.contentOffset.x + scrollView.frame.size.width;
            break;
        case 1003:
            [label0 setText:@" "];
            [label1 setText:@" "];
            [label2 setText:@"Notificación de emergencia"];
            [label2 setTextAlignment:UITextAlignmentCenter];
            [label2 setTextColor:[UIColor redColor]];
            [label3 setText:@" "];
            x = scrollView.contentOffset.x + scrollView.frame.size.width * 4;
            break;
        case 1004:
            [label1 setText:@"Estoy en la escuela"];
            x = scrollView.contentOffset.x + scrollView.frame.size.width;
            break;
        case 1005:
            [label1 setText:@"Estoy en el trabajo"];
            x = scrollView.contentOffset.x + scrollView.frame.size.width;
            break;
        case 1006:
            [label1 setText:@"Estoy en la casa"];
            x = scrollView.contentOffset.x + scrollView.frame.size.width;
            break;
        case 1007:
            [label1 setText:@"Estoy fuera"];
            x = scrollView.contentOffset.x + scrollView.frame.size.width;
            break;    
        case 1008:
            [label1 setText:@"Estoy en el edificio"];
            x = scrollView.contentOffset.x + scrollView.frame.size.width;
            break; 
        case 1009:
        {
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"¿ En dónde estas ?"
                                                                  message:@"______________________" 
                                                                 delegate:self 
                                                        cancelButtonTitle:@"Cancelar" 
                                                        otherButtonTitles:@"OK", nil];
            textFieldDondeEstoy = [[UITextField alloc] initWithFrame:CGRectMake(12.0, 45.0, 260.0, 25.0)];
            [textFieldDondeEstoy setBorderStyle:UITextBorderStyleRoundedRect];
            textFieldDondeEstoy.tag = 1009;
            [alertView addSubview:textFieldDondeEstoy];
            [alertView show];
            x = scrollView.contentOffset.x;
        }
            break;
        case 1010:
            [label2 setText:@"Me quedo aquí"];
            x = scrollView.contentOffset.x + scrollView.frame.size.width;
            break; 
        case 1011:
            [label2 setText:@"Me voy a la escuela"];
            x = scrollView.contentOffset.x + scrollView.frame.size.width;
            break; 
        case 1012:
            [label2 setText:@"Me voy al trabajo"];
            x = scrollView.contentOffset.x + scrollView.frame.size.width;
            break;
        case 1013:
            [label2 setText:@"Me voy a casa"];
            x = scrollView.contentOffset.x + scrollView.frame.size.width;
            break;
        case 1014:
            [label2 setText:@"Me voy fuera"];
            x = scrollView.contentOffset.x + scrollView.frame.size.width;
            break;
        case 1015:
            [label2 setText:@"Me voy al edificio"];
            x = scrollView.contentOffset.x + scrollView.frame.size.width;
            break;
        case 1016:
        {
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"¿ A dónde vas ?"
                                                                message:@"______________________" 
                                                               delegate:self 
                                                      cancelButtonTitle:@"Cancelar" 
                                                      otherButtonTitles:@"OK", nil];
            textFieldADondeIre = [[UITextField alloc] initWithFrame:CGRectMake(12.0, 45.0, 260.0, 25.0)];
            [textFieldADondeIre setBorderStyle:UITextBorderStyleRoundedRect];
            textFieldADondeIre.tag = 1009;
            [alertView addSubview:textFieldADondeIre];
            [alertView show];
            x = scrollView.contentOffset.x;
        }
            break;
        case 1017:
            [label3 setText:@"Yo te llamo."];
            x = scrollView.contentOffset.x + scrollView.frame.size.width;
            break;
        case 1018:
            [label3 setText:@"Llámame."];
            x = scrollView.contentOffset.x + scrollView.frame.size.width;
            break;
        default:
            break;
    }
    
    [scrollView setContentOffset:CGPointMake(x, 0) animated:YES];
    contentOffset = CGPointMake(x, 0);
    
}

- (IBAction)readyAction:(id)sender {
    [scrollView setContentOffset:CGPointMake(0.0, 0.0) animated:YES];
    contentOffset = CGPointMake(0.0, 0.0);
    [label0 setText:@" "];
    [label1 setText:@" "];
    [label2 setText:@" "];
    [label2 setTextAlignment:UITextAlignmentLeft];
    [label2 setTextColor:[UIColor blackColor]];
    [label3 setText:@" "];
    [activityIndicatorView setHidden:NO];
    [readyButton setHidden:YES];
}

- (void)scrollViewDidScroll:(UIScrollView *)_scrollView
{
    if ([_scrollView contentOffset].x >= scrollView.frame.size.width * 0 && 
        [_scrollView contentOffset].x < scrollView.frame.size.width * 1) {
        [labelPregunta setText:@"¿ Cómo te encuentras ?"];
    }
    if ([_scrollView contentOffset].x >= scrollView.frame.size.width * 1 && 
        [_scrollView contentOffset].x < scrollView.frame.size.width * 2) {
        [labelPregunta setText:@"¿ En dónde estás ?"];
    }
    if ([_scrollView contentOffset].x >= scrollView.frame.size.width * 2 && 
        [_scrollView contentOffset].x < scrollView.frame.size.width * 3) {
        [labelPregunta setText:@"¿ A dónde vas ?"];
    }
    if ([_scrollView contentOffset].x >= scrollView.frame.size.width * 3 && 
        [_scrollView contentOffset].x < scrollView.frame.size.width * 4) {
        [labelPregunta setText:@"¿ Qué sigue ?"];
    }
    if ([_scrollView contentOffset].x >= scrollView.frame.size.width * 4) {

        [labelPregunta setText:@"Enviando notificación."];
        NSLog(@"Enviar Notificactón");
        [labelPregunta setText:@"Notificación enviada"];
        [activityIndicatorView setHidden:YES];
        [readyButton setHidden:NO];
        
    }
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    switch (buttonIndex) {
        case 0://Cancel
            break;
        case 1://OK
            [label1 setText:[textFieldDondeEstoy text]];
            [label2 setText:[textFieldADondeIre text]];
            [scrollView setContentOffset:CGPointMake( scrollView.contentOffset.x + scrollView.frame.size.width, 0.0) animated:YES];
            contentOffset = CGPointMake( scrollView.contentOffset.x + scrollView.frame.size.width, 0.0);
            break;
        default:
            break;
    }
}


@end
