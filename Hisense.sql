SET NAMES UTF8;
DROP DATABASE IF EXISTS hs;
CREATE DATABASE hs CHARSET=UTF8;
USE hs;


/**海信商品类别家族**/
CREATE TABLE hs_product_family(
  fid INT PRIMARY KEY AUTO_INCREMENT,
  fname VARCHAR(32)
);

/**海信商品小分类表**/
CREATE TABLE hs_product_type(
  tid INT PRIMARY KEY AUTO_INCREMENT,   #产品序号
  tname VARCHAR(32),                    #类型名称
  family_id VARCHAR(32),                #所属产品大类
  pic_src VARCHAR(128)                  #图片路径
);

/**电视**/
CREATE TABLE hs_tv(
  tid INT PRIMARY KEY AUTO_INCREMENT,
  family_id INT,              #所属型号家族编号
  type_id INT,		            #产品小类型编号
  title VARCHAR(128),         #主标题
  subtitle VARCHAR(128),      #副标题
  price DECIMAL(10,2),        #价格
  promise VARCHAR(64),        #服务承诺 **********需要帮助*********************
                              ##spec VARCHAR(64),           #规格/颜色

  total_power VARCHAR(16),    #整机功率    普通信息
  series VARCHAR(16),         #系列
  tname VARCHAR(32),          #商品型号
  size VARCHAR(16),           #尺寸

  

  core_type VARCHAR(64),      #机芯型号     硬件
  cpu VARCHAR(64),            #CPU
  gpu VARCHAR(64),            #GPU
  rom VARCHAR(16),            #存储（ROM)
  ram VARCHAR(16),            #内存（RAM) 

  network VARCHAR(16),        #网络:有      网络连接

  bluetooth VARCHAR(16),      #蓝牙
  connection_type VARCHAR(16),#连接方式
  
  backlight VARCHAR(16),      #背光源         屏幕
  resolution_ratio VARCHAR(16),#分辨率

  brightness VARCHAR(16),     #亮度         画质参数
  colour_gamut VARCHAR(16),   #色域(BT709) 
  MEMC VARCHAR(16),           #MEMC 
  HDR VARCHAR(16),            #HDR 
  brightness_style VARCHAR(16),#背光方式
  

  packing_list VARCHAR(128),   #包装清单       配件
  remote_control_type VARCHAR(16),#遥控器型号

  os VARCHAR(32),             #操作系统         系统
  interface VARCHAR(16),      #操作界面

  video_loop VARCHAR(16),     #视频循坏播放     软件功能
  som_remote_control VARCHAR(16),   #体感遥控 somatosensory
  som_game VARCHAR(16),       #体感游戏
  camera VARCHAR(16),         #摄像头
  gamepad VARCHAR(16),        #游戏手柄
  timed_shutdown VARCHAR(16), #定时关机
  voice_control VARCHAR(16),  #语音控制

  shelf_time BIGINT,          #上架时间
  sold_count INT,             #已售出的数量
  is_onsale BOOLEAN           #是否促销中
);

/**电视图片**/
CREATE TABLE hs_tv_pic(
  pid INT PRIMARY KEY AUTO_INCREMENT,
  tv_id INT,                  #电视编号
  sm VARCHAR(128),            #小图片路径
  md VARCHAR(128),            #中图片路径
  lg VARCHAR(128)             #大图片路径
);

/**用户信息**/
CREATE TABLE hs_user(
  uid INT PRIMARY KEY AUTO_INCREMENT,
  uname VARCHAR(32),
  upwd VARCHAR(32),
  email VARCHAR(64),
  phone VARCHAR(16),

  avatar VARCHAR(128),        #头像图片路径
  user_name VARCHAR(32),      #用户名，如王小明
  gender INT                  #性别  0-女  1-男
);

/**收货地址信息**/
CREATE TABLE hs_receiver_address(
  aid INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT,                #用户编号
  receiver VARCHAR(16),       #接收人姓名
  province VARCHAR(16),       #省
  city VARCHAR(16),           #市
  county VARCHAR(16),         #县
  address VARCHAR(128),       #详细地址
  cellphone VARCHAR(16),      #手机
  fixedphone VARCHAR(16),     #固定电话
  postcode CHAR(6),           #邮编
  tag VARCHAR(16),            #标签名

  is_default BOOLEAN          #是否为当前用户的默认收货地址
);

/**购物车条目**/
CREATE TABLE hs_shoppingcart_item(
  iid INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT,      #用户编号
  product_id INT,   #商品编号
  count INT,        #购买数量
  is_checked BOOLEAN #是否已勾选，确定购买
);

/**用户订单**/
CREATE TABLE hs_order(
  aid INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT,
  address_id INT,
  status INT,             #订单状态  1-等待付款  2-等待发货  3-运输中  4-已签收  5-已取消
  order_time BIGINT,      #下单时间
  pay_time BIGINT,        #付款时间
  deliver_time BIGINT,    #发货时间
  received_time BIGINT    #签收时间
)AUTO_INCREMENT=10000000;

/**用户订单**/
CREATE TABLE hs_order_detail(
  did INT PRIMARY KEY AUTO_INCREMENT,
  order_id INT,           #订单编号
  product_id INT,         #产品编号
  count INT               #购买数量
);

/****首页轮播广告商品****/
CREATE TABLE hs_index_carousel(
  cid INT PRIMARY KEY AUTO_INCREMENT,
  img VARCHAR(128),
  title VARCHAR(64)
);

/****首页商品****/
CREATE TABLE hs_index_product(
  pid INT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(64),        #标题
  detail VARCHAR(64),       #标题
  pic VARCHAR(128),         #图片
  price DECIMAL(10,2),      #价格
  href VARCHAR(128),        #链接地址
  family_id INT             #商品所属型号

  seq_recommended TINYINT,
  seq_new_arrival TINYINT,
  seq_top_sale TINYINT
);

insert into hs_product_family values
  (null,'电视'),(null,'激光'),(null,'冰箱'),(null,'空调'),
  (null,'冷柜'),(null,'手机'),(null,'空净'),(null,'洗衣机');

insert into hs_product_type values
  (null,'75英寸',1,'pic_i.png'),
  (null,'65英寸',1,'pic_i.png'),
  (null,'50英寸',1,'pic_i.png'),
  (null,'55英寸',1,'pic_i.png'),
  (null,'43英寸',1,'pic_i.png'),
  (null,'39英寸',1,'pic_i.png'),
  (null,'32英寸',1,'pic_i.png'),

  (null,'100英寸',2,'pic_i.png'),
  (null,'88英寸',2,'pic_i.png'),
  (null,'80英寸',2,'pic_i.png'),
 
  (null,'对开门',3,'pic_i.png'),
  (null,'十字对开门',3,'pic_i.png'),
  (null,'法式多门',3,'pic_i.png'),
  (null,'三门',3,'pic_i.png'),
  (null,'双门/单门',3,'pic_i.png'),
  (null,'爆款推荐',3,'pic_i.png'),
  (null,'601L以上',3,'pic_i.png'),
  (null,'501~600L',3,'pic_i.png'),
  (null,'401~500L',3,'pic_i.png'),
  (null,'301~400L',3,'pic_i.png'),
  (null,'201~300L',3,'pic_i.png'),
  
  (null,'大1匹',4,'pic_i.png'),
  (null,'小1.5匹',4,'pic_i.png'),
  (null,'1.5匹',4,'pic_i.png'),
  (null,'2匹',4,'pic_i.png'),
  (null,'3匹',4,'pic_i.png'),
  (null,'8-17M^2',4,'pic_i.png'),
  (null,'14-22M^2',4,'pic_i.png'),
  (null,'16-24M^2',4,'pic_i.png'),
  (null,'21-30M^2',4,'pic_i.png'),
  (null,'30-45M^2',4,'pic_i.png'),
  
  (null,'单温柜',5,'pic_i.png'),
  (null,'双温柜',5,'pic_i.png'),
  (null,'冰吧',5,'pic_i.png'),

  (null,'双屏手机',6,'pic_i.png'),
  (null,'学习手机',6,'pic_i.png'),
  (null,'手机配件',6,'pic_i.png'),
  (null,'全面屏手机',6,'pic_i.png'),

  (null,'空气净化器',7,'pic_i.png'),
  (null,'新风机',7,'pic_i.png'),
  (null,'除湿机',7,'pic_i.png'),

  (null,'10公斤以上',8,'pic_i.png'),
  (null,'9公斤',8,'pic_i.png'),
  (null,'8公斤',8,'pic_i.png'),
  (null,'6-7公斤',8,'pic_i.png'),
  (null,'迷你洗衣机',8,'pic_i.png'),
  (null,'滚筒洗衣机',8,'pic_i.png'),
  (null,'波轮洗衣机',8,'pic_i.png'),
  (null,'洗烘一体机',8,'pic_i.png'),
  (null,'变频洗衣机',8,'pic_i.png'),
  (null,'变频洗衣机',8,'pic_i.png'),
  (null,'居家爆款',8,'pic_i.png');