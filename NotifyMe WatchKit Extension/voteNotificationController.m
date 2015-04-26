
#import "voteNotificationController.h"

@interface voteNotificationController ()
@property (weak, nonatomic) IBOutlet WKInterfaceLabel *bodyMessage;
@property (weak, nonatomic) IBOutlet WKInterfaceLabel *titleMessage;
@end

@implementation voteNotificationController

- (instancetype)init {
    self = [super init];
    if (self){
        // Initialize variables here.
        // Configure interface objects here.
        
    }
    return self;
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}


- (void)didReceiveLocalNotification:(UILocalNotification *)localNotification withCompletion:(void (^)(WKUserNotificationInterfaceType))completionHandler {
    // This method is called when a local notification needs to be presented.
    // Implement it if you use a dynamic notification interface.
    // Populate your dynamic notification interface as quickly as possible.
    //
    // After populating your dynamic notification interface call the completion block.
    completionHandler(WKUserNotificationInterfaceTypeCustom);
}


- (void)didReceiveRemoteNotification:(NSDictionary *)remoteNotification withCompletion:(void (^)(WKUserNotificationInterfaceType))completionHandler {
	
	// 通知データから情報を取り出す
	NSDictionary* apsDict = [remoteNotification objectForKey:@"aps"];
	NSDictionary* alertDict = [apsDict objectForKey:@"alert"];
	NSString*	bodyString = [alertDict objectForKey:@"body"];
	NSString*	titleString = [alertDict objectForKey:@"title"];
	
	// 動的ロングルック画面のラベルに表示
	[_bodyMessage setText:bodyString];
	[_titleMessage setText:titleString];
	
	// 完了ハンドラを呼ぶ
	completionHandler(WKUserNotificationInterfaceTypeDefault);
//	completionHandler(WKUserNotificationInterfaceTypeCustom);
}


@end



