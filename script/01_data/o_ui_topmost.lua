--[[1050

]]
local t = {
    'o_ui_topmost',
    {
        {
            ['name']=0x10500001,
            ['showname']='连接界面',
            ['界面名称']='v_connect',
            ['优先级']=150,
            ['界面类型']='二级界面',
        },
        {
            ['name']=0x10500002,
            ['showname']='1v1战场',
            ['界面名称']='v_battle_1v1',
            ['优先级']=200,
            ['界面类型']='一级界面',
        },
        {
            ['name']=0x10500003,
            ['showname']='作弊界面',
            ['界面名称']='v_cheat_system',
            ['优先级']=900,
            ['界面类型']='一级界面',
        },
        {
            ['name']=0x10500004,
            ['showname']='主界面',
            ['界面名称']='v_main_menu',
            ['优先级']=1,
            ['界面类型']='一级界面',
        },
        {
            ['name']=0x10500005,
            ['showname']='房间界面',
            ['界面名称']='v_room',
            ['优先级']=100,
            ['界面类型']='一级界面',
        },
        {
            ['name']=0x10500006,
            ['showname']='提示',
            ['界面名称']='v_tip',
            ['优先级']=1000,
            ['界面类型']='二级界面',
        },
        {
            ['name']=0x10500007,
            ['showname']='提示',
            ['界面名称']='v_common_popup',
            ['优先级']=500,
            ['界面类型']='二级界面',
        },
        {
            ['name']=0x10500008,
            ['showname']='对决结算',
            ['界面名称']='v_battle_result',
            ['优先级']=300,
            ['界面类型']='二级界面',
        },
    }}
    return t