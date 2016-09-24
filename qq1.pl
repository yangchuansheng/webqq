#!/usr/bin/env perl
use Mojo::Webqq;
my ($qq,$host,$port,$post_api);

$qq = 1633660757;    #修改为你自己的实际QQ号码
$host = "0.0.0.0"; #发送消息接口监听地址，修改为自己希望监听的地址
$port = 5000;      #发送消息接口监听端口，修改为自己希望监听的端口
#$post_api = 'http://xxxx';  #接收到的消息上报接口，如果不需要接收消息上报，可以删除此行

my $client = Mojo::Webqq->new(qq=>$qq);
$client->login();
$client->load("ShowMsg");
$client->on(model_update_fail=>sub{
    $client = shift;
    $client->relogin();
});



#$client->load("PushPlug");
$client->add_job("定时提醒","21:47",sub{my $friend = $client->search_friend(qq=>804539882);$client->send_message($friend,"@每日一文
http://meiriyiwen.com");});
$client->add_job("定时提醒","21:47",sub{my $group = $client->search_group(gnumber=>484043598);$client->send_group_message($group,"@全体成员 | #每日一文
http://meiriyiwen.com");});
#$client->add_job("定时提醒","21:47",sub{my $group = $client->search_group(gnumber=>161153897);$client->send_group_message($group,"@全体成员 | #每日一文
#meiriyiwen.com");});
#$client->add_job("定时提醒","21:47",sub{my $group = $client->search_group(gnumber=>114921848);$client->send_group_message($group,"@全体成员 | #每日一文
#meiriyiwen.com");});
#$client->add_job("定时提醒","21:47",sub{my $group = $client->search_group(gname=>"Free - 资源分享");$client->send_group_message($group,"@全体成员 | #每日一文
#meiriyiwen.com");});
#$client->add_job("定时提醒","21:47",sub{my $group = $client->search_group(gnumber=>140237507);$client->send_group_message($group,"@全体成员 | #每日一文
#meiriyiwen.com");});
#$client->add_job("定时提醒","21:47",sub{my $group = $client->search_group(gnumber=>174563176);$client->send_group_message($group,"@全体成员 | #每日一文
#http://meiriyiwen.com");});
$client->add_job("定时提醒","21:47",sub{my $group = $client->search_group(gnumber=>212260218);$client->send_group_message($group,"@全体成员 | #每日一文
http://meiriyiwen.com");});
$client->add_job("定时提醒","21:47",sub{my $group = $client->search_group(gnumber=>365431365);$client->send_group_message($group,"@全体成员 | #每日一文
http://meiriyiwen.com");});
$client->load("Qiandao");
#$client->load("IRCshell");
#$client->load("Openqq",data=>{listen=>{host=>$host,port=>$port}, post_api=>$post_api});
$client->load("KnowledgeBase",data=>{
    #allow_group => ["南通大学城淮安老乡群"],  #可选，允许插件的群，可以是群名称或群号码
    #ban_group   => ["江苏多肉植物交流群"], #可选，禁用该插件的群，可以是群名称或群号码
    file => './KnowledgeBase.dat', #数据库保存路径
    learn_command  => 'study',     #自定义学习指令关键字
    delete_command =>'del',      #自定义删除指令关键字
    learn_operator => [804539882], #允许学习权限的操作人qq号
    delete_operator => [804539882], #允许删除权限的操作人qq号
});
$client->load("ProgramCode");
$client->load("FuckDaShen");
$client->on(before_send_message=>sub{
    my($client,$msg) = @_;
    my $content = $msg->content;
    $content .=  "(来自 小猪乱撞助理)";
    $msg->content($content);
});
$client->load("SmartReply",data=>{
    #allow_group     => ["PERL学习交流"],  #可选，允许插件的群，可以是群名称或群号码
    #ban_group       => ["私人群",123456], #可选，禁用该插件的群，可以是群名称或群号码
    notice_reply    => ["对不起，请不要这么频繁的艾特我","对不起，您的艾特次数太多"], #可选，提醒时用语
    notice_limit    => 8 ,  #可选，达到该次数提醒对话次数太多，提醒语来自默认或 notice_reply
    warn_limit      => 38,  #可选,达到该次数，会被警告
    ban_limit       => 12,  #可选,达到该次数会被列入黑名大不再进行回复
    period          => 600, #可选，限制周期，单位 秒
    is_need_at       => 1,  #默认是1 是否需要艾特才触发回复
});
$client->load("StockInfo");
$client->load("GasPrice");
$client->load("Riddle");
$client->load("MobileInfo");
$client->load("Translation");
$client->load("GroupManage",data=>{
    new_group_member => '欢迎新成员 @%s 入群[鼓掌][鼓掌][鼓掌]', #新成员入群欢迎语，%s会被替换成群成员名称
    lose_group_member => '很遗憾 %s 离开了本群[流泪][流泪][流泪]', #成员离群提醒
    speak_limit => {#发送消息频率限制
        period          => 10, #统计周期，单位是秒
        warn_limit      => 10, #统计周期内达到该次数，发送警告信息
        warn_message    => '@%s 警告, 您发言过于频繁，可能会被禁言或踢出本群', #警告内容
        shutup_limit    => 20, #统计周期内达到该次数，成员会被禁言
        shutup_time     => 600, #禁言时长
        #kick_limit      => 55,   #统计周期内达到该次数，成员会被踢出本群
    },
    pic_limit => {#发图频率限制
        period          => 600,
        warn_limit      => 6,
        warn_message   => '@%s 警告, 您发图过多，可能会被禁言或踢出本群',
        shutup_limit    => 8,
        kick_limit      => 38,
    },
    keyword_limit => {
        period=> 600,
        keyword=>[qw(fuck 傻逼 你妹 滚)],
        warn_limit=>3,
        shutup_limit=>5,
        #kick_limit=>undef,
    },
});
$client->run();
