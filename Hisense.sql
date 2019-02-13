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
  fid VARCHAR(32),                      #所属产品大类
  pic_src VARCHAR(128)                  #图片路径
);

/**电视**/
CREATE TABLE hs_tv_list(
  lid INT PRIMARY KEY AUTO_INCREMENT,   #商品序号
  fid INT,                    #所属型号家族编号
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
  lid INT,                  #电视编号
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
  aid INT PRIMARY KEY AUTO_INCREMENT,   #收货地址id
  uid INT,                    #用户编号
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
  uid INT,            #用户编号
  lid INT,            #商品编号
  count INT,          #购买数量
  is_checked BOOLEAN  #是否已勾选，确定购买
);

/**用户订单**/
CREATE TABLE hs_order(
  aid INT PRIMARY KEY AUTO_INCREMENT,
  uid INT,
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
  fid INT,                   #商品所属型号

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
  (null,'居家爆款',8,'pic_i.png');

  /****首页商品***
CREATE TABLE hs_index_product(
  pid INT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(64),        #标题
  detail VARCHAR(64),       #标题
  pic VARCHAR(128),         #图片
  price DECIMAL(10,2),      #价格
  href VARCHAR(128),        #链接地址
  fid INT,                   #商品所属型号

  seq_recommended TINYINT,
  seq_new_arrival TINYINT,
  seq_top_sale TINYINT
);*/
insert into hs_index_product values
  (NULL,'88英寸激光/4K超画质/杜比全景声/3+32GB/健康护眼','海信88英寸激光电视震撼上市！畅享4K杜比全景声家庭影院！更有116%高色域覆盖，MEMC运动画面补偿技术，VIDAA人工智能系统，让您的客厅从此与众不同！','IMG',29999.00,'product_details.html?lid=1',2,1,1,1),
  (NULL,'80英寸/AI智能/哈曼卡顿音箱/4K激光电视','赢1000元、500元年货津贴！限时抢购','IMG',21999.00,'product_details.html?lid=1',2,2,2,2),
  (NULL,'80英寸激光/4K超画质/杜比全景声/3+32GB/健康护眼','海信80英寸激光电视震撼上市！！！价格首次突破2万底线，3米家庭视距即可畅享4K杜比全景声家庭影院！更有116%高色域覆盖，MEMC运动画面补偿技术，VIDAA人工智能系统，让您的客厅从此与众不同！','IMG',19999.00,'product_details.html?lid=1',2,3,3,3),
  (NULL,'100英寸激光电视/4K超清/智能系统/海量视频/新品上市','请先咨询客服 未来科技，即刻享用！IMAX 3D体验','IMG',64999.00,'product_details.html?lid=1',2,4,4,4),
  (NULL,'88英寸激光电视/4K超清画质/智能系统/海量视频/4GB+64GB','请先咨询客服 未来科技，即刻享用！IMAX 3D体验','IMG',49999.00,'product_details.html?lid=1',2,5,5,5),
  (NULL,'100英寸激光电视/3D效果/Vidaa2.0智能系统/5.1声道音响','请先咨询客服 未来科技，即刻享用！IMAX 3D体验','IMG',62999.00,'product_details.html?lid=1',2,6,6,6),
  (NULL,'80英寸激光电视/4K超清画质/智能系统/海量视频/4GB+32GB','未来科技，即刻享用！IMAX 3D体验','IMG',30999.00,'product_details.html?lid=1',2,7,7,7),
  (NULL,'100英寸激光电视/4K超清画质/智能系统/海量视频/4GB+64GB','请先咨询客服 未来科技，即刻享用！IMAX 3D体验','IMG',74999.00,'product_details.html?lid=1',2,8,8,8),

  (NULL,'65英寸/4K超清/3+64超大配置/自动体育模式/CD纹外置低音/VIDAA AI人工智能','活动价5999！赢1000元、500元年货津贴！限时抢购','IMG',6399.00,'product_details.html?lid=1',1,1,1,1),
  (NULL,'55英寸/4K电视/金属超薄/人工智能/32GB内存','咨询客服更有惊喜 30天保价 + 送货入户保障 + 官方正品 突破行业瓶颈，见证世界海信！','IMG',3599.00,'product_details.html?lid=1',1,2,2,2),
  (NULL,'50英寸/4K电视/金属超薄/人工智能/32GB内存','晒图评价咨询客服有惊喜~了解更多精品','IMG',2799.00,'product_details.html?lid=1',1,3,3,3),
  (NULL,'55英寸4K/纤薄外观/人工智能/8GB内存/海量资源','活动价2299！赢1000元、500元津贴！限时抢购','IMG',2399.00,'product_details.html?lid=1',1,4,4,4),
  (NULL,'50英寸4K/纤薄外观/人工智能/8GB内存/海量资源','活动价1999！赢1000元、500元津贴！限时抢购','IMG',2099.00,'product_details.html?lid=1',1,5,5,5),
  (NULL,'32英寸/高清智能/WIFI网络/平板液晶电','赢1000元、500元年货津贴！限时抢购','IMG',949.00,'product_details.html?lid=1',1,6,6,6),
  (NULL,'43英寸/高清智能/WiFi网络/海量影视及学习资源','活动价1499！赢1000元、500元年货津贴！限时抢购','IMG',1599.00,'product_details.html?lid=1',1,7,7,7),
  (NULL,'65英寸4K/纤薄外观/人工智能/8GB内存/海量资源','活动价3699！赢1000元、500元年货津贴！限时抢购','IMG',3999.00,'product_details.html?lid=1',1,8,8,8),
  
  (NULL,' 海信食神冰箱/456升/法式多门/变频一级/风冷无霜/自由嵌入式设计/玲珑釉','海信食神冰箱 倾情奉献~了解更多精品&gt;&gt;30天保价+送货入户保障+官方正品 海信冰箱，智能更健康！','IMG',7999.00,'product_details.html?lid=1',3,1,1,1),
  (NULL,'法式多门/风冷无霜/322升/双变频/一级能效/冰箱','活动价2699！抢1000元年货津贴！限时抢购','IMG',2999.00,'product_details.html?lid=1',3,2,2,2),
  (NULL,'容声十字对开门/456升/双变频/一级能效/冰箱','活动价3699！抢1000元年货津贴！限时抢购','IMG',4599.00,'product_details.html?lid=1',3,3,3,3),
  (NULL,'容声 对开门/风冷无霜/529升/矢量变频/二级能效/冰箱','活动价2999！抢1000元年货津贴！限时抢购','IMG',3099.00,'product_details.html?lid=1',3,4,4,4),
  (NULL,'容声对开门/风冷无霜/646升/一级能效/冰箱','活动价3499！抢1000元年货津贴！限时抢购','IMG',3999.00,'product_details.html?lid=1',3,5,5,5),
  (NULL,'三门/定频/220升/二级能效/冰箱','活动价1359！抢1000元年货津贴！限时抢购','IMG',1399.00,'product_details.html?lid=1',3,6,6,6),
  (NULL,'对开门/453升/二级能效/节能无霜/静音养鲜/新品上市/冰箱','活动价2499！抢1000元年货津贴！限时抢购','IMG',2599.00,'product_details.html?lid=1',3,7,7,7),
  (NULL,'三门/风冷无霜/251升/二级能效/冰箱','晒单咨询客服有惊喜+赠公牛插排+送180天延保~ 了解更多精品&gt;&gt;送货入户保障+官方正品海信冰箱，智能更健康！','IMG',1899.00,'product_details.html?lid=1',3,8,8,8),
  
  (NULL,'小1.5匹/一级能效/变频智控','活动价2699元！抢1000元年货津贴！限时抢购','IMG',2599.00,'product_details.html?lid=1',4,1,1,1),
  (NULL,'大1匹/直流变频/急速冷暖','活动价2099元！抢1000元年货津贴！限时抢购','IMG',2299.00,'product_details.html?lid=1',4,2,2,2),
  (NULL,'1.5匹/急速冷暖/静音空调','活动价1999元！抢1000元年货津贴！限时抢购','IMG',2099.00,'product_details.html?lid=1',4,3,3,3),
  (NULL,'3匹/二级能效/变频/智能操控','活动价5999元！抢1000元年货津贴！限时抢购','IMG',6999.00,'product_details.html?lid=1',4,4,4,4),
  (NULL,'1.5匹/变频/急速冷暖','活动价2449元！抢1000元年货津贴！限时抢购','IMG',2749.00,'product_details.html?lid=1',4,5,5,5),
  (NULL,'1.5匹/静音/疾速冷暖/定速','活动价1899元！抢1000元年货津贴！限时抢购','IMG',1999.00,'product_details.html?lid=1',4,6,6,6),
  (NULL,'2匹/二级能效/定速/急速冷暖','活动价3699元！抢1000元年货津贴！限时抢购','IMG',3999.00,'product_details.html?lid=1',4,7,7,7),
  (NULL,'3匹/一级能效/智能APP控制','活动价5699元！抢1000元年货津贴！限时抢购','IMG',6999.00,'product_details.html?lid=1',4,8,8,8),
  
  (NULL,'10公斤/金色/触控/变频/滚筒洗衣机','活动价1899！抢1000元年货津贴！限时抢购','IMG',2299.00,'product_details.html?lid=1',7,1,1,1),
  (NULL,'波轮/9公斤/定频/下排水/洗衣机','晒单询客服有惊喜＋送180天延保~了解更多精品&gt;&gt;30天保价+送货入户保障+官方正品 海信洗衣机，智慧洗涤！','IMG',1199.00,'product_details.html?lid=1',7,2,2,2),
  (NULL,'波轮/3公斤/定频/下排水/小型迷你儿童升级款洗衣机','活动价899！抢1000元年货津贴！限时抢购','IMG',999.00,'product_details.html?lid=1',7,3,3,3),
  (NULL,' 滚筒/9公斤/变频/上排水/洗衣机','晒单询客服有惊喜＋送180天延保~了解更多精品&gt;&gt;30天保价+送货入户保障+官方正品 海信洗衣机，智慧洗涤！','IMG',1799.00,'product_details.html?lid=1',7,4,4,4),
  
  (NULL,' 单温/冷藏冷冻/100升/顶开门/二级能效/冷柜','活动价649！抢1000元年货津贴！限时抢购','IMG',688.00,'product_details.html?lid=1',5,1,1,1),
  (NULL,'单温/冷藏冷冻/143升/顶开门/二级能效/冷柜','晒单询客服有惊喜+送180天延保！ 30天保价+送货入户保障+官方正品海信冷柜，锁住新鲜','IMG',848.00,'product_details.html?lid=1',5,2,2,2),
  (NULL,'容声单温/冷藏冷冻/309升/顶开门/一级能效/冷柜','晒单询客服有惊喜+赠公牛插排+送180天延保！ 30天保价+送货入户保障+官方正品 容声30年，专业成就品质！','IMG',1459.00,'product_details.html?lid=1',5,3,3,3),
  (NULL,'容声双温/冷藏冷冻/273升/蝴蝶门/二级能效/冷柜','晒单询客服有惊喜+赠公牛插排+送180天延保！ 30天保价+送货入户保障+官方正品 容声30年，专业成就品质！','IMG',1399.00,'product_details.html?lid=1',5,4,4,4),

  (NULL,'小海豚3/4500mAh学霸级续航','活动价899元！抢1000元年货津贴！限时抢购','IMG',1799.00,'product_details.html?lid=1',6,1,1,1),
  (NULL,'A6双屏手机 /64G/护眼畅读','正反面双全面屏 护眼无蓝光阅读','IMG',1799.00,'product_details.html?lid=1',6,2,2,2),
  (NULL,'A6双屏手机 /128G/护眼畅读','A6双屏手机 /128G/护眼畅读','IMG',1799.00,'product_details.html?lid=1',6,3,3,3),
  (NULL,'金刚4 PRO/全面屏/128G/智能','安全+长续航+全新水滴屏','IMG',1799.00,'product_details.html?lid=1',6,4,4,4);
 
