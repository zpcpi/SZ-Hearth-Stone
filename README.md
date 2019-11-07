# SZ-Hearth-Stone
尝试山寨一个炉石传说

## 开发计划

### 计划中
- [x] 增加动态端口
- [x] 完善房间逻辑
  - [x] 加入房间
  - [x] 准备状态变化
  - [x] 开始对战
  - [x] 离开房间
  - [x] 新建房间失败放弃新建
  - [x] 连接失败放弃连接
  - [x] 选择预设卡组
- [ ] 对战流程
  - [x] 开始对战
  - [x] 随机先后手
  - [x] 结束按钮更新, 标明当前是谁的回合
  - [x] 根据预设卡组抽取手牌
  - [ ] 选择重新抽取的卡牌
  - [ ] 获取初始卡牌及硬币
  - [ ] 回合开始
    - [x] 法力水晶设置
    - [x] 抽牌
  - [x] 回合结束
  - [ ] 游戏结束
- [ ] 组卡
  - [x] 查看卡牌列表
  - [x] 编辑卡组
  - [x] 保存卡组
  - [x] 读取本地卡组
  - [ ] 正版炉石卡牌映射
  - [ ] 生成复制代码供正版炉石使用
    > 复制代码样例
    > ### 外服传说：鱼人萨
    > AAECAaoIAvDzAvSZAw7FA9sD/gPjBdAHpwiTCeKJA4yUA7WYA8aZA9SlA6+nA8qrAwA=
    > 
    > #此卡组代码来源于炉石盒子，上盒子，上传说！
  - [ ] 卡牌搜索
- [ ] 指令系统框架
    - [ ] 指令阶段功能补全（10/13）
        - [x] 法力消耗预览
        - [x] 法力消耗预览取消
        - [x] 抓取卡牌
        - [x] 卡牌进入功能区
        - [x] 卡牌进入功能区_单目标法术
        - [x] 卡牌进入功能区_随从
        - [x] 卡牌返回手牌区
        - [ ] 卡牌选择目标（缺少条件，目标高亮显示）
        - [ ] 卡牌抉择
        - [x] 卡牌取消指令
        - [x] 随从切换站位
        - [ ] 卡牌确认使用（缺各种情况应对）
        - [x] 卡牌确认使用_随从中途
    - [x] 指令阶段功能数据迁移到p层，方便数据层查看、编辑
- [ ] 战场UI
    - [x] 战场随从
    - [x] 战场英雄
    - [ ] 战场英雄技能
    - [ ] 战场英雄武器
    - [ ] 战场奥秘
    - [ ] 战场任务
    - [x] 法力水晶UI
    - [x] 手牌UI
    - [ ] 卡牌变随从动画
    - [ ] 随从变卡牌动画
    - [ ] 需要优化一下随从召唤的流程，主要处理已经上阵的随从控件
- [ ] 卡牌UI
    - [x] 随从卡
    - [x] 法术卡
    - [x] 武器卡
    - [x] 英雄
    - [x] 英雄技能卡
    - [x] 英雄卡
    - [ ] 卡牌描述文本自动换行, 自动大小, 整体居中
- [ ] 单机模式
- [ ] 好友系统
- [ ] 卡牌机制
    - [ ] 基础机制
        - [ ] 嘲讽
        - [ ] 风怒
        - [ ] 冲锋
        - [ ] 圣盾
        - [ ] 复生
        - [ ] 潜行
        - [ ] 超级风怒
        - [ ] 免疫
        - [ ] 剧毒
        - [ ] 过载
        - [ ] 吸血
        - [ ] 突袭
        - [ ] 回响
        - [ ] 超杀
        - [ ] 双生法术
        - [ ] 磁力
    - [ ] 扩展机制
        - [ ] 战吼
        - [ ] 亡语
        - [ ] 秘密亡语（抉择、发现、鉴定、升级、阴谋）
        - [ ] 沉默
        - [ ] 冻结
        - [ ] 抉择
        - [ ] 抉择两次
        - [ ] 连击
        - [ ] 进化
        - [ ] 招募
        - [ ] 发现
        - [ ] 反制
        - [ ] 抽到时释放
        - [ ] 对战开始时
        - [ ] 激励
        - [ ] 休眠
        - [ ] 祈求
        - [ ] 任务、奖励
        - [ ] 支线任务
        - [ ] 升级
        - [ ] 阴谋
        - [ ] 自动变形（变色龙、武器、德博士、狼人）
    - [ ] 卡牌包
        - [ ] 动物伙伴
        - [ ] 梦境
        - [ ] 零件
        - [ ] 死亡骑士牌
        - [ ] 进化
        - [ ] 神器
        - [ ] 宝藏
        - [ ] 安戈洛卡包
        - [ ] 跟班

- [ ] 结算流程

### 待修复问题
- [ ] 编辑器数据层级功能失效
- [ ] 卡牌取消之后，显示tips功能偶尔不正常
- [ ] removeChild用法似乎不对
- [ ] 卡牌返回手牌时，会闪一下tips
- [ ] 严重问题！控件随从跟战场随从要使用两套编号，目前的方案有bug
- [ ] 现在的状态布尔值取值有问题，容易搞混，需要优化一下
- [x] 卡牌返回手牌时层级错误

### 已完成
- [x] 系统提示
- [x] 优化网络, 避免轮询卡顿
- [x] 优化玩家身份, 增加绝对身份和相对身份逻辑
- [x] 优化界面层级逻辑
- [x] 动画系统框架

## 卡牌功能
1. 机制实现
    > 基础机制：攻击、伤害、buff、光环、召唤、变形、奥秘、任务、复制、消灭、心控、回手牌、回牌库、弃牌、生命、护甲、法术伤害、摧毁武器、误导、治疗转伤害、减费、加费、获得水晶、摧毁水晶、两侧、对面、替换英雄、英雄卡机制、受伤、奇数、偶数、英雄技能升级、无法攻击、魔免、50%miss、爆牌库、横扫、拼点、法伤增幅、无法攻击英雄、克苏恩、青玉、法力消耗转换生命、鉴定、升级、阴谋、融合、狼人、套牌、

    > 触发节点：todo...

    > 特殊机制：
2. 战场机制
    > 流程，todo...

    > 2v2战斗流程

---
## 记牌器
1. 牌库、坟场

2. 手牌信息：回合数、已知的显示信息

3. 场面随从编号
