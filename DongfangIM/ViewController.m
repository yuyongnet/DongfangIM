//
//  ViewController.m
//  DongfangIM
//
//  Created by apple on 16/5/27.
//  Copyright © 2016年 com.pushtest. All rights reserved.
//

#import "ViewController.h"
#import "YourTestChatListViewController.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView * tableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = DEF_COLOR(238, 238, 238);
    self.title = @"我的账户";
    [self.view addSubview:self.tableView];
    
   
}

#pragma mark-懒加载    如果不用xib创建表懒加载时可以用下面的方法
-(UITableView *)tableView
{
    if (_tableView == nil) {
        //1.创建表试图
        self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, KScreenHeight-64) style:UITableViewStylePlain];
        //2.设置代理
        self.tableView.backgroundColor = [UIColor clearColor];
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        self.tableView.delegate = self;
        self.tableView.dataSource=self;
    }
    return _tableView;
}
#pragma mark -tableView 的代理

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell=[tableView dequeueReusableCellWithIdentifier:@"dongfangCell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"dongfangCell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.backgroundColor=[UIColor clearColor];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
    }
    if (indexPath.row == 0)
    {
        cell.textLabel.text =  @"test2";
    }
    else if (indexPath.row == 1)
    {
         cell.textLabel.text =  @"test3";
    }
    else if (indexPath.row == 2)
    {
        cell.textLabel.text =  @"会话列表";
    }
    else
    {
        cell.textLabel.text = @"待开发";
    }
    return cell;
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%ld",(long)indexPath.row);
    switch (indexPath.row) {
        case 0:
        {
            //新建一个聊天会话View Controller对象
            RCConversationViewController *chat = [[RCConversationViewController alloc]init];
            //设置会话的类型，如单聊、讨论组、群聊、聊天室、客服、公众服务会话等
            chat.conversationType = ConversationType_PRIVATE;
            //设置会话的目标会话ID。（单聊、客服、公众服务会话为对方的ID，讨论组、群聊、聊天室为会话的ID）
            chat.targetId = @"test2";
            //设置聊天会话界面要显示的标题
            chat.title = @"与test2的聊天";
            //显示聊天会话界面
            [self.navigationController pushViewController:chat animated:YES];
        }
            break;
        case 1:
        {
            //新建一个聊天会话View Controller对象
            RCConversationViewController *chat = [[RCConversationViewController alloc]init];
            //设置会话的类型，如单聊、讨论组、群聊、聊天室、客服、公众服务会话等
            chat.conversationType = ConversationType_PRIVATE;
            //设置会话的目标会话ID。（单聊、客服、公众服务会话为对方的ID，讨论组、群聊、聊天室为会话的ID）
            chat.targetId = @"test3";
            //设置聊天会话界面要显示的标题
            chat.title = @"与test3的聊天";
            //显示聊天会话界面
            [self.navigationController pushViewController:chat animated:YES];
        }
            break;
        case 2:
        {
            YourTestChatListViewController *chatList = [[YourTestChatListViewController alloc] init];
            [self.navigationController pushViewController:chatList animated:YES];
        }
            break;
        default:
            break;
    }
}


@end
