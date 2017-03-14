# 注册
POST /api/users/sign_up

参数
username
password

返回
失败情况下：
errno            1: 用户名已存在
成功情况下
id               用户ID
token            认证token，用于后续API的http header: Authorization

例子
```
curl 'http://localhost:3000/api/users/sign_up.json' -d 'username=uzxmx&password=123456'
```

# 登录
POST /api/users/sign_in

参数
username
password

返回
失败情况下：
errno            1: 用户名或密码错误
成功情况下
id               用户ID
token            认证token，用于后续API的http header: Authorization

例子
```
curl 'http://localhost:3000/api/users/sign_in.json' -d 'username=uzxmx&password=123456'
```

# 获取景点列表
GET /api/products.json

参数
page                分页参数
per                 每页显示多少条

返回
id                  景点id
name                景点名称
brief_description   景点描述
address             景点地址
price               景点价格
thumb_photo_url     景点缩略图

例子
```
curl http://localhost:3000/api/products.json?page=1
```

# 获取景点
GET /api/products/ID.json

参数
无

返回
id                  景点id
name                景点名称
brief_description   景点描述
address             景点地址
price               景点价格
thumb_photo_url     景点缩略图
photos              景点图片列表
open_time           景点开放时间
details             详情
journey             行程
play_method         玩法

例子
```
curl http://localhost:3000/api/products/1.json
```

# 获取旅行社列表
GET /api/travel_agents.json

参数
无

返回
id                         旅行社ID
name                       旅行社名称

例子
```
curl 'http://localhost:3000/api/travel_agents.json'
```

# 设置旅行社
POST /api/users/1/set_travel_agent.json
需要带上Authorization:token的认证头

参数
travel_agent_id                 旅行社ID

返回
无

例子
```
curl 'http://localhost:3000/api/users/1/set_travel_agent.json' -d 'travel_agent_id=1' -H 'Authorization:9:751217c470d3c2190cea8d24d001ec2e'
``` 

# 获取游客列表
GET /api/visitors.json
需要带上Authorization:token的认证头

参数
无

返回
id                         游客ID
name                       游客名称
telephone                  游客联系方式

例子
```
curl 'http://localhost:3000/api/visitors.json' -H 'Authorization:9:751217c470d3c2190cea8d24d001ec2e'
```

# 创建游客
POST /api/visitors.json
需要带上Authorization:token的认证头

参数
name                       游客名称
telephone                  游客联系方式

返回
id                         游客ID
name                       游客名称
telephone                  游客联系方式

例子
```
curl 'http://localhost:3000/api/visitors.json' -d 'name=测试&telephone=15901779495' -H 'Authorization:9:751217c470d3c2190cea8d24d001ec2e'
```

# 更改游客信息
PUT /api/visitors/ID.json
需要带上Authorization:token的认证头

参数
name                       游客名称
telephone                  游客联系方式

返回
无

例子
```
curl 'http://localhost:3000/api/visitors/1.json' -d 'telephone=13333333333' -X PUT -H 'Authorization:9:751217c470d3c2190cea8d24d001ec2e'
```

# 删除游客
DELETE /api/visitors/ID.json
需要带上Authorization:token的认证头

参数
无

返回
无

例子
```
curl 'http://localhost:3000/api/visitors/2.json' -X DELETE -H 'Authorization:9:751217c470d3c2190cea8d24d001ec2e'
```

# 创建订单
POST /api/orders.json
需要带上Authorization:token的认证头

参数
JSON格式
product_id                  产品ID
start_date                  出发日期
start_place                 出发地
visitor_ids                 游客ID列表

返回


例子
```
curl 'http://localhost:3000/api/orders.json' -d '{"product_id": 1, "start_date": "2017-03-18", "start_place": "上海市", "visitor_ids": [5, 6]}' -H 'Authorization:9:751217c470d3c2190cea8d24d001ec2e' -H 'Content-Type: application/json; charset=utf-8'
```

# 获取订单列表
GET /api/orders.json
需要带上Authorization:token的认证头

例子
```
curl 'http://localhost:3000/api/orders.json?page=1&per=20' -H 'Authorization:9:751217c470d3c2190cea8d24d001ec2e'
```

参数
page                       分页参数
per                        每页显示多少条

# 获取正在进行的订单列表
GET /api/orders/ongoing.json
需要带上Authorization:token的认证头

参数
page                       分页参数
per                        每页显示多少条

例子
```
curl 'http://localhost:3000/api/orders/ongoing.json?page=1&per=20' -H 'Authorization:9:751217c470d3c2190cea8d24d001ec2e'
```

# 获取订单详情
GET /api/orders/ID.json
需要带上Authorization:token的认证头

例子
```
curl 'http://localhost:3000/api/orders/11.json' -H 'Authorization:9:751217c470d3c2190cea8d24d001ec2e'
```
