
-- 数据库初始化脚本

-- 创建数据库
CREATE DATABASE seckill;
-- 使用数据库
USE seckill;
-- 创建数据库
CREATE TABLE seckill(
seckill_id BIGINT NOT NULL AUTO_INCREMENT COMMENT '商品库存ID',
name VARCHAR(120) NOT NULL COMMENT '商品名称',
number INT NOT NULL CO  MMENT '库存数量',
start_time TIMESTAMP NULL COMMENT '秒杀开始时间',
end_time TIMESTAMP NULL COMMENT '秒杀结束时间',
create_time TIMESTAMP NOT NULL DEFAULT current_timestamp COMMENT '创建时间',
  PRIMARY KEY (seckill_id),
  KEY idx_start_time(start_time),
  KEY idx_end_time(end_time),
  KEY idx_create_time(create_time)
)ENGINE = InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET = utf8 COMMENT='秒杀库存表';

-- 初始化数据
INSERT INTO seckill(name,number,start_time,end_time)
VALUES
  ('1000元秒杀iPhone6s',100,'2016-05-24 00:00:00','2016-05-26 00:00:00'),
  ('500元秒杀iPad2',200,'2016-05-24 00:00:00','2016-05-26 00:00:00'),
  ('200元秒杀iPod',100,'2016-05-24 00:00:00','2016-05-26 00:00:00'),
  ('100元秒杀小米2',100,'2016-05-24 00:00:00','2016-05-26 00:00:00'),
  ('100元秒杀红米note',100,'2016-05-24 00:00:00','2016-05-26 00:00:00');

-- 秒杀成功明细表
-- 用户登录认证相关的信息
CREATE TABLE seccess_killed(
  seckill_id BIGINT NOT NULL COMMENT '秒杀商品ID',
  user_phone BIGINT NOT NULL COMMENT '用户手机号',
  status TINYINT NOT NULL DEFAULT -1 COMMENT '状态:-1:无效、0:成功、1:已付款给',
  create_time TIMESTAMP NOT NULL DEFAULT current_timestamp COMMENT '创建时间',
  PRIMARY KEY (seckill_id,user_phone),/*联合主键*/
  KEY idx_create_time(create_time)
)ENGINE = InnoDB DEFAULT CHARSET = utf8 COMMENT='秒杀成功明细表';