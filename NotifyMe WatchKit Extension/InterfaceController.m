
#import "InterfaceController.h"


@interface InterfaceController()
@property (weak, nonatomic) IBOutlet WKInterfaceLabel *responseMessage;
@end


@implementation InterfaceController

- (void)awakeWithContext:(id)context {
	[super awakeWithContext:context];
}

- (void)willActivate {
	[super willActivate];
}

- (void)didDeactivate {
	[super didDeactivate];
}

- (void)handleActionWithIdentifier:(NSString *)identifier forRemoteNotification:(UILocalNotification *)localNotification {
	
	// 料理の希望について処理する
	if([identifier isEqualToString:@"vote.izakayaButtonAction"]) {
		[_responseMessage setText:@"居酒屋を選びました"];
	}
	if([identifier isEqualToString:@"vote.chineseButtonAction"]) {
		[_responseMessage setText:@"中華料理を選びました"];
	}
	if([identifier isEqualToString:@"vote.stakeButtonAction"]) {
		[_responseMessage setText:@"焼き肉を選びました"];
	}
	if([identifier isEqualToString:@"vote.proxyButtonAction"]) {
		[_responseMessage setText:@"幹事に任せました"];
	}

	// 最初の画面で選ばれたボタンで分岐する
	if([identifier isEqualToString:@"firstButtonAction"]) {
		[_responseMessage setText:@"最初のボタンが押されました"];
	}
	if([identifier isEqualToString:@"secondButtonAction"]) {
		[_responseMessage setText:@"２番目のボタンが押されました"];
	}
}

- (void)handleActionWithIdentifier:(NSString *)identifier forLocalNotification:(UILocalNotification *)localNotification {
	
	
	NSLog(@"Local:actionIdentifier:%@", identifier);
}

@end



