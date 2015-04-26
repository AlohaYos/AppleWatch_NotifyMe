
#import "NotificationController.h"


@interface NotificationController()

@property (weak, nonatomic) IBOutlet WKInterfaceLabel *bodyMessage;
@property (weak, nonatomic) IBOutlet WKInterfaceLabel *titleMessage;

@end


@implementation NotificationController

- (instancetype)init {
    self = [super init];
    if (self){

		NSLog(@"%s",__FUNCTION__);	// このメソッド名をデバッグ出力
}
    return self;
}

- (void)willActivate {
    [super willActivate];

	NSLog(@"%s",__FUNCTION__);	// このメソッド名をデバッグ出力
}

- (void)didDeactivate {
    [super didDeactivate];

	NSLog(@"%s",__FUNCTION__);	// このメソッド名をデバッグ出力
}

- (void)didReceiveLocalNotification:(UILocalNotification *)localNotification withCompletion:(void (^)(WKUserNotificationInterfaceType))completionHandler {
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
	completionHandler(WKUserNotificationInterfaceTypeCustom);
}


@end



