# SSM_HTML5_Springboot_Hotel_Room_Management
SSM_HTML5酒店预订宾馆客房入住管理系统可升级SpringBoot毕业源码案例设计
## 前台技术框架： Bootstrap(一个HTML5响应式框架）
## 程序开发环境：myEclipse/Eclipse/Idea都可以 + mysql数据库
## 后台架构框架: SSM(SpringMVC + Spring + Mybatis)
（1）登陆：用户可以通过用户名和密码进行登陆系统。

（2）修改密码：用户可以通过对在个人资料模块进行修改密码。

（3）酒店查询：用户可以通过系统浏览该酒店的房间信息，也可以根据酒店性质、价格以及各房间类型等特定条件来搜索适合自己的心仪的房间。

（4）在线预定：用户在锁定心仪房间之后，可以在线进行房间申请，设置个人资料，填写姓名、性别、身份证号、联系方式、要求等个人资料，并上传个人。酒店管理员就可以从后台看到你的申请了。

（5）我的预定：用户可以清楚的看到自己的预定记录；

（6）用户管理：酒店管理员可以根据用户编号或者用户姓名查找用户；添加新的用户（用户）；可以编辑用户信息，修改用户的真实姓名、登录名、用户编号、密码、身份以及权限；可以删除已经无效的用户。

（7）房间管理：酒店管理员可以新建酒店类别；对酒店性质进行添加种类，根据选择的酒店类别，可以进行在线编辑和重置；同时，也可以删除无用的酒店类别。

（8）房间信息管理：酒店管理员可以在线编辑发布房间信息，编辑房间号,房间类型,房间图片,价格(每天),楼层,占用状态,房间描述等；根据酒店性质、酒店信息状态以及酒店名称查询酒店信息；

（9）房间预定审核：酒店管理员可以实时对自己酒店的内部信息进行实时的更新，客户预定，可以审核，以及如果客户退房，酒店管理员也可以实时更新自己房间的状态。
## 实体ER属性：
用户: 用户名,登录密码,姓名,性别,用户照片,出生日期,身份证号,联系电话,邮箱,家庭地址,注册时间

房间类型: 类型id,房间类型,价格(每天)

房间: 房间号,房间类型,房间图片,价格(每天),楼层,占用状态,房间描述

房间预订: 订单id,预订房间,房间类型,预订人,入住日期,预订天数,总价,订单备注,订单状态,预订时间

留言: 留言id,留言标题,留言内容,留言人,留言时间,管理回复,回复时间

新闻公告: 公告id,标题,公告内容,点击率,发布时间