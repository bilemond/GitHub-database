-- 创建视图
 
 -- USER
 
 -- 创建 follow liumengdi 的名单 视图1
 USE `github_info`;
CREATE  OR REPLACE VIEW `who_followed_me` AS 
select user1 AS who_followed_me from user1_follow_user2
WHERE user2 = "liumengdi";
 
  -- 创建 liumengdi follow 的名单 视图2
 USE `github_info`;
CREATE  OR REPLACE VIEW `i_followed_whom` AS 
select user2 AS I_followed_whom from user1_follow_user2
WHERE user1 = "liumengdi";
 
 USE `github_info`;
CREATE  OR REPLACE VIEW `who_stared_me` AS 
select user1 AS my_stars from user1_star_user2
WHERE user2 = "liumengdi";
 
 USE `github_info`;
CREATE  OR REPLACE VIEW `i_stared_whom` AS 
select user2 AS I_stared_whom from user1_star_user2
WHERE user1 = "liumengdi";
 
 -- 统计所有用户获得的star个数，并降序排序（无时间范围限制）
 USE `github_info`;
CREATE  OR REPLACE VIEW `get_star_number_user` AS 
select user2 AS user, COUNT(user2) AS got_star_number
from user1_star_user2
GROUP BY user2
ORDER BY got_star_number desc;
 
  -- 统计所有用户获得的star个数，并降序排序（在今天内）
 USE `github_info`;
CREATE  OR REPLACE VIEW `get_star_number_user_today` AS 
select today_star.user2 AS user, COUNT(today_star.user2) AS got_star_number
from 
	(SELECT user1, user2
	from user1_star_user2
    WHERE user1_star_user2.date = "2021-10-06"
    )AS today_star
GROUP BY today_star.user2
ORDER BY got_star_number desc;
 
  -- 统计所有用户被follow的人数，并降序排序（无时间范围限制）
 USE `github_info`;
CREATE  OR REPLACE VIEW `get_followed_number_user` AS 
select user2 AS user, COUNT(user2) AS get_followed_number
from user1_follow_user2
GROUP BY user2
ORDER BY get_followed_number desc;
 
  -- 统计所有用户被follow的人数，并降序排序（在今天内）
 USE `github_info`;
CREATE  OR REPLACE VIEW `get_followed_number_user_today` AS 
select today_follow.user2 AS user, COUNT(today_follow.user2) AS got_follow_number
from 
	(SELECT user1, user2
	from user1_follow_user2
    WHERE user1_follow_user2.date = "2021-10-06"
    )AS today_follow
GROUP BY today_follow.user2
ORDER BY got_follow_number desc;
 
 -- 仓库