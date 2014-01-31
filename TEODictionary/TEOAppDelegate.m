//
//  TEOAppDelegate.m
//  TEODictionary
//
//  Created by Mateo Vidal on 30/01/14.
//  Copyright (c) 2014 Mateo Vidal. All rights reserved.
//

#import "TEOAppDelegate.h"
#import "WordsTableViewController.h"
#import "DefinitionViewController.h"

@implementation TEOAppDelegate

@synthesize window = _window;

- (BOOL)application:(UIApplication *)application
didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    // Creamos un splitview que será nuestro controlador principal
    UISplitViewController *splitVC = [[UISplitViewController alloc] init];
    
    // Creaos el modelo y el WordsTableViewController
    TEOWordsModel *model = [[TEOWordsModel alloc] init];
    WordsTableViewController *tableVC = [[WordsTableViewController alloc] initWithModel:model];
    
    // Creamos el DefinitionViewController, pasándole como modelo la primera palabra que empieza por a
    DefinitionViewController *definitionVC = [[DefinitionViewController alloc] initWithModel:[model wordAtIndex:0
                                                                                                inLetterAtIndex:0]];
    // Informamos a WordsTableViewController que definitionVC es su delegado para que pueda avisarle cuando
    // el usuario toque sobre una palabra
    tableVC.delegate = definitionVC;
    
    // Para que ambos controladores definitionVC y tableVC tengan una barra con su título dentro
    // del SPlitView, los vamos a meter dentro de un navigation.
    UINavigationController *tableNav = [[UINavigationController alloc] initWithRootViewController:tableVC];
    UINavigationController *definitionNav = [[UINavigationController alloc] initWithRootViewController:definitionVC];
    
    // Avisamos al splitview que definitionVC es su delegado, para que le avise cuando cambie la orientación
    // del dispositivo
    splitVC.delegate = definitionVC;
    
    // Metemos los dos navigations dentro del splitview
    splitVC.viewControllers = [NSArray arrayWithObjects:tableNav, definitionNav, nil];
    
    // Avisamos a window que el splitiew es el controlador principal.
    self.window.rootViewController = splitVC;
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
    
    
    
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}

@end
