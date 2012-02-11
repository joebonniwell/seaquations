//
//  SeaquationsGoVertexViewController.m
//  seaquations
//
//  Created by goVertex on 10/17/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "SeaquationsGoVertexViewController.h"

@implementation SeaquationsGoVertexViewController

- (void)dealloc
{
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle


- (void)loadView
{
    UIView *tempView;
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
        tempView = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 768.0f, 1024.0f)];
    else
        tempView = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 320.0f, 480.0f)];
    [tempView setBackgroundColor:[UIColor colorWithRed:0.95 green:0.95 blue:0.95 alpha:1.0f]];
    [self setView:tempView];
    [tempView release];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Toolbar
    UIToolbar *tempToolbar;
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
        tempToolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 768.0f, 44.0f)];
    else
        tempToolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 320.0f, 44.0f)];
    [tempToolbar setTintColor:[UIColor blueColor]];
    [[self view] addSubview:tempToolbar];
    // goVertex Label
    UILabel *tempGoVertexLabel;
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        tempGoVertexLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 200.0f, 44.0f)];
        [tempGoVertexLabel setFont:[UIFont boldSystemFontOfSize:28.0f]];
    }
    else
    {
        tempGoVertexLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 100.0f, 44.0f)];
        [tempGoVertexLabel setFont:[UIFont boldSystemFontOfSize:18.0f]];
    }
    [tempGoVertexLabel setText:@"goVertex"];
    [tempGoVertexLabel setTextColor:[UIColor whiteColor]];
    [tempGoVertexLabel setBackgroundColor:[UIColor clearColor]];
    // goVertex Label Bar Button
    UIBarButtonItem *tempGoVertexLabelBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:tempGoVertexLabel];
    // Spacer
    UIBarButtonItem *tempFlexSpaceItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    // Done Button
    UIBarButtonItem *tempDoneButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:[self delegate] action:@selector(dismissGoVertexViewController)];
    // Toolbar Items
    NSArray *tempToolbarItemsArray = [NSArray arrayWithObjects:tempDoneButton, tempFlexSpaceItem, tempGoVertexLabelBarButtonItem, tempFlexSpaceItem, nil];
    [tempToolbar setItems:tempToolbarItemsArray];
    // Clean up
    [tempToolbar release];
    [tempGoVertexLabel release];
    [tempGoVertexLabelBarButtonItem release];
    [tempFlexSpaceItem release];
    [tempDoneButton release];
    // Top Background ImageView
    UIImageView *tempTopBackgroundImageView;
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
        tempTopBackgroundImageView = [[UIImageView alloc] initWithFrame:CGRectMake(84.0f, 134.0f, 600.0f, 640.0f)];
    else
        tempTopBackgroundImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10.0f, 60.0f, 300.0f, 400.0f)];
    [tempTopBackgroundImageView setBackgroundColor:[UIColor whiteColor]];
    [[self view] addSubview:tempTopBackgroundImageView];
    [tempTopBackgroundImageView release];
    // LetterBody Label
    UILabel *tempLetterBodyLabel;
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        tempLetterBodyLabel = [[UILabel alloc] initWithFrame:CGRectMake(104.0f, 154.0f, 560.0f, 180.0f)];
        [tempLetterBodyLabel setFont:[UIFont systemFontOfSize:18.0f]];
    }
    else
    {
        tempLetterBodyLabel = [[UILabel alloc] initWithFrame:CGRectMake(20.0f, 80.0f, 280.0f, 120.0f)];
        [tempLetterBodyLabel setFont:[UIFont systemFontOfSize:12.0f]];
    }
    [tempLetterBodyLabel setContentMode:UIViewContentModeTop];
    [tempLetterBodyLabel setNumberOfLines:0];
    [tempLetterBodyLabel setLineBreakMode:UILineBreakModeWordWrap];
    [tempLetterBodyLabel setText:@"Hi,\n\nThank you for purchasing Seaquations, we hope you are really enjoying it. If you have any questions or comments, please contact us via email below. We are working hard on some great new apps as well as updates, to get the latest news, sign up for our newsletter."];
    [[self view] addSubview:tempLetterBodyLabel];
    [tempLetterBodyLabel release];
    // Signature Label
    UILabel *tempSignatureLabel;
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        tempSignatureLabel = [[UILabel alloc] initWithFrame:CGRectMake(104.0f, 344.0f, 560.0f, 180.0f)];
        [tempSignatureLabel setFont:[UIFont systemFontOfSize:18.0f]];
    }
    else
    {
        tempSignatureLabel = [[UILabel alloc] initWithFrame:CGRectMake(20.0f, 210.0f, 280.0f, 24.0f)];
        [tempSignatureLabel setFont:[UIFont systemFontOfSize:12.0f]];
    }
    [tempSignatureLabel setText:@"The goVertex Team"];
    [tempSignatureLabel setTextAlignment:UITextAlignmentRight];
    [[self view] addSubview:tempSignatureLabel];
    [tempSignatureLabel release];
    // Logo
    UIImageView *tempLogoImageView;
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        tempLogoImageView = [[UIImageView alloc] initWithFrame:CGRectMake(504.0f, 380.0f, 160.0f, 96.0f)];  
        [tempLogoImageView setImage:[UIImage imageNamed:@"goVertexLogoHD.png"]];
    }
    else
    {
        tempLogoImageView = [[UIImageView alloc] initWithFrame:CGRectMake(210.0f, 240.0f, 80.0f, 48.0f)];  
        [tempLogoImageView setImage:[UIImage imageNamed:@"goVertexLogo.png"]];
    }
    [[self view] addSubview:tempLogoImageView];
    [tempLogoImageView release];
    // Mail button / label
    if ([MFMailComposeViewController canSendMail] == YES)
    {
        UIButton *tempEmailUsButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
        {
            [tempEmailUsButton setFrame:CGRectMake(234.0f, 520.0f, 300.0f, 100.0f)];
            [[tempEmailUsButton titleLabel] setFont:[UIFont systemFontOfSize:24.0f]];
        }
        else
        {
            [tempEmailUsButton setFrame:CGRectMake(40.0f, 300.0f, 240.0f, 60.0f)];
            [[tempEmailUsButton titleLabel] setFont:[UIFont systemFontOfSize:18.0f]];
        }
        [tempEmailUsButton setTitle:@"Email Us" forState:UIControlStateNormal];
        [tempEmailUsButton addTarget:self action:@selector(emailUsButtonTapped) forControlEvents:UIControlEventTouchUpInside];
        [[self view] addSubview:tempEmailUsButton];
    }
    else
    {
        // Show the email address label...
        UILabel *tempEmailAddressLabel;
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
        {
            tempEmailAddressLabel = [[UILabel alloc] initWithFrame:CGRectMake(234.0f, 520.0f, 300.0f, 100.0f)];
            [tempEmailAddressLabel setFont:[UIFont systemFontOfSize:24.0f]];
        }
        else
        {
            tempEmailAddressLabel = [[UILabel alloc] initWithFrame:CGRectMake(40.0f, 300.0f, 240.0f, 60.0f)];
            [tempEmailAddressLabel setFont:[UIFont systemFontOfSize:18.0f]];
        }
        [tempEmailAddressLabel setText:@"support@govertex.com"];
        [tempEmailAddressLabel setTextAlignment:UITextAlignmentCenter];
        [[self view] addSubview:tempEmailAddressLabel];
        [tempEmailAddressLabel release];
    }
    // Newsletter sign up button
    UIButton *tempEmailSignUpButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        [tempEmailSignUpButton setFrame:CGRectMake(234.0f, 640.0f, 300.0f, 100.0f)];
        [[tempEmailSignUpButton titleLabel] setFont:[UIFont systemFontOfSize:24.0f]];
    }
    else
    {
        [tempEmailSignUpButton setFrame:CGRectMake(40.0f, 380.0f, 240.0f, 60.0f)];
        [[tempEmailSignUpButton titleLabel] setFont:[UIFont systemFontOfSize:18.0f]];
    }
    [tempEmailSignUpButton setTitle:@"Newsletter Sign Up" forState:UIControlStateNormal];
    [tempEmailSignUpButton addTarget:self action:@selector(newsletterSignUpButtonTapped) forControlEvents:UIControlEventTouchUpInside];
    [[self view] addSubview:tempEmailSignUpButton];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)emailUsButtonTapped
{
    MFMailComposeViewController *mailComposeViewController = [[MFMailComposeViewController alloc] init];
    [mailComposeViewController setMailComposeDelegate:self];
    NSArray *toEmailAddressArray = [NSArray arrayWithObject:@"support@govertex.com"];
    [mailComposeViewController setToRecipients:toEmailAddressArray];
    [mailComposeViewController setSubject:@"Seaquations"];
    [mailComposeViewController setMessageBody:@"Hi goVertex Team,\n\n" isHTML:NO];
    [self presentModalViewController:mailComposeViewController animated:YES];
    [mailComposeViewController release];
}

- (void)newsletterSignUpButtonTapped
{
    SubscribeAlertView *newsletterSubscribeAlertView = [[SubscribeAlertView alloc] initWithTitle:@"Sign Up" message:@"Sign up to the goVertex newsletter for the latest on our current and upcoming apps." apiKey:@"ae42071c56839ed19e40fa090dd8f64b-us2" listId:@"4495f706d5" cancelButtonTitle:@"Cancel" subscribeButtonTitle:@"Sign Up"];
    [newsletterSubscribeAlertView show];
    [newsletterSubscribeAlertView release];
}

#pragma mark -
#pragma mark MFMailComposeViewControllerDelegate Methods

- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    [self dismissModalViewControllerAnimated:YES];
}

@synthesize delegate;
@end
