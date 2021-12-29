--  drop table users;
--  drop table individualuser;
--  drop table organization;
--  drop table indvuser_belong_org;
--  drop table team;
--  drop table indvuser_belong_team;
--  drop table team_belong_org;
--  drop table events;
--  drop table user_join_events;
--  drop table app;
--  drop table action;
--  drop table users_install_app;
--  drop table users_install_action;
--  drop table org_develop_app;
--  drop table user_contribute_action;
--  drop table users_star_action;
--  
--  drop table repositories;
--  drop table sponsor_repositories;
--  
--  drop table topic;
--  drop table repositories_match_topic;
--  drop table collections;
--  drop table repositories_match_collections;
--  drop table releases;
--  drop table packages;
--  drop table code;
--  drop table issues;
--  drop table pull_requests;
--  
--  drop table popular_repositories;
--  drop table popular_users;
--  drop table user_fork_repositories;
--  drop table user_develop_repositories;
--  drop table user_respond_issue_repositories;
--  drop table user_fileschangedin_repositories;
--  drop table users_star_topic;
--  drop table users_star_collections;
--  drop table user_sponsor_repositories;
--  drop table user_view_repositories;
--  drop table user_watch_repositories;
--  drop table user_star_repositories;
--  drop table user1_follow_user2;
--  drop table user1_star_user2;
--  
--  drop table trending;



 
  --  建立users表,其中分为两个类，分别是Individual user和 organization
 CREATE TABLE `github_info`.`users` (
  `account_name` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NULL DEFAULT NULL,
  `address` VARCHAR(45) NULL DEFAULT NULL,
  `type` VARCHAR(45) NOT NULL CHECK(`type` = "individualuser" or `type` = "organization" ) ,
  `password` VARCHAR(145) NOT NULL CHECK( CHAR_LENGTH(`password`) >= 5 ) COMMENT '密码位数不应少于5位',
  PRIMARY KEY (`account_name`));
  
 --  建立Individual user表
 CREATE TABLE `github_info`.`individualuser` (
  `account_name` VARCHAR(45) NOT NULL,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  `public_email` VARCHAR(45) NULL DEFAULT NULL,
  `bio` VARCHAR(145) NULL DEFAULT NULL,
  `URL` VARCHAR(145) NULL DEFAULT NULL,
  `Twitter_username` VARCHAR(45) NULL DEFAULT NULL,
  `Company` VARCHAR(145) NULL DEFAULT NULL,
  `Location` VARCHAR(145) NULL DEFAULT NULL,
  `password` VARCHAR(145) NOT NULL CHECK( CHAR_LENGTH(`password`) >= 5 ) COMMENT '密码位数不应少于5位',
  PRIMARY KEY (`account_name`));

--  建立organization表
 CREATE TABLE `github_info`.`organization` (
  `Org_act_name` VARCHAR(45) NOT NULL,
  `Contact_email` VARCHAR(45) NULL DEFAULT NULL,
  `Profile` VARCHAR(45) NULL DEFAULT NULL,
  `Websit` VARCHAR(45) NULL DEFAULT NULL CHECK(`Websit` like "http%" ) ,
  `Address` VARCHAR(45) NULL DEFAULT NULL,
  `Isverified` TINYINT COMMENT '1为Isverified，0为Isnotverified',
  `password` VARCHAR(145) NOT NULL CHECK( CHAR_LENGTH(`password`) >= 5 ) COMMENT '密码位数不应少于5位',
  PRIMARY KEY (`Org_act_name`));
  
  -- INSERT INTO `github_info`.`organization` (`Org_act_name`, `Contact_email`, `Profile`, `Websit`) VALUES ('appsmith', '14333', 'Build', 'http://www');

  

--  建立indvuser_org表，表示每个organization包含若干个Individual_user
CREATE TABLE `github_info`.`indvuser_belong_org` (
  `account_name` VARCHAR(45) NOT NULL,
  `Org_account_name` VARCHAR(45) NOT NULL,
  `role` VARCHAR(45) NOT NULL CHECK( `role` = "owner" OR `role` = "Member" ) COMMENT '表示每个成员在org里面的角色，分为owner和Member',
  PRIMARY KEY (`account_name`, `Org_account_name`));
 
 
 CREATE TABLE `github_info`.`team` (
  `organization_name` VARCHAR(45) NOT NULL,
  `team_name` VARCHAR(45) NOT NULL,
  `visibility` VARCHAR(45) NOT NULL CHECK( `visibility` = "visible" OR `visibility` = "secret" ) COMMENT '表示可视性，其中visible表示organization内所有人都可以看到这个team；secret表示team内的人才可以看到这个team',
  `description` VARCHAR(45) NULL,
  PRIMARY KEY (`organization_name`,`team_name`));
 
 CREATE TABLE `github_info`.`indvuser_belong_team` (
  `account_name` VARCHAR(45) NOT NULL,
  `Org_name` VARCHAR(45) NOT NULL,
  `team_name` VARCHAR(45) NOT NULL,
  `role` VARCHAR(45) NULL CHECK( `role` = "Maintainer" OR `role` = "Member" ) COMMENT '表示每个成员在team里面的角色，分为Maintainer 和Member',
  PRIMARY KEY (`account_name`, `Org_name`, `team_name`));

 
 CREATE TABLE `github_info`.`events` (
  `name` VARCHAR(45) NOT NULL,
  `date_beginning` DATE NOT NULL,
  `date_ending` DATE NOT NULL,
  `description` VARCHAR(45) NULL,
  PRIMARY KEY (`name`,`date_beginning`))
COMMENT = 'Connect with the GitHub community at conferences, meetups, and hackathons around the world.';

CREATE TABLE `github_info`.`user_join_events` (
  `account_name` VARCHAR(45) NOT NULL,
  `event_name` VARCHAR(45) NOT NULL,
  `date_beginning` DATE NOT NULL,
  PRIMARY KEY (`account_name`,`event_name`,`date_beginning` ))
COMMENT = 'Individual user join in events';


-- install app and action

 CREATE TABLE `github_info`.`app` (
  `name` VARCHAR(45) NOT NULL,
  `Introduction` VARCHAR(45) NULL,
  `languages` VARCHAR(45) NULL,
  `price` INT NOT NULL,
  `install_num` INT NOT NULL,
  PRIMARY KEY (`name`))
COMMENT = 'Extend GitHub';

CREATE TABLE `github_info`.`action` (
  `name` INT NOT NULL,
  `Stars_number` INT NULL,
  `version` VARCHAR(45) NULL,
  `money` INT NOT NULL,
  PRIMARY KEY (`name`));
  
  CREATE TABLE `github_info`.`users_install_app` (
  `account_name` VARCHAR(45) NOT NULL,
  `app_name` VARCHAR(45) NOT NULL,
  `date` DATE NOT NULL,
  PRIMARY KEY (`account_name`, `app_name`,`date`));
  
  CREATE TABLE `github_info`.`users_install_action` (
  `account_name` VARCHAR(45) NOT NULL,
  `action_name` VARCHAR(45) NOT NULL,
  `date` DATE NOT NULL,
  PRIMARY KEY (`account_name`, `action_name`,`date`));


  CREATE TABLE `github_info`.`org_develop_app` (
  `account_name` VARCHAR(45) NOT NULL,
  `app_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`account_name`, `app_name`));

  CREATE TABLE `github_info`.`user_contribute_action` (
  `account_name` VARCHAR(45) NOT NULL,
  `action_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`account_name`, `action_name`));

 CREATE TABLE `github_info`.`user1_follow_user2` (
  `user1` VARCHAR(45) NOT NULL,
  `user2` VARCHAR(45) NOT NULL,
  `date` DATE NULL,
  PRIMARY KEY (`user1`, `user2`));

CREATE TABLE `github_info`.`user1_star_user2` (
  `user1` VARCHAR(45) NOT NULL,
  `user2` VARCHAR(45) NOT NULL,
  `date` DATE NULL,
  PRIMARY KEY (`user1`, `user2`));
 


--  Repositories

CREATE TABLE `github_info`.`repositories` (
  `Repository_name` VARCHAR(45) NOT NULL,
  `Owner` VARCHAR(45) NOT NULL,
  `Description` VARCHAR(45) NULL,
  `Public_or_private` TINYINT COMMENT '1为 Public，0为 private',
  `Updated_on` DATE NULL,
  `star_number` INT NOT NULL,
  `watch_number` INT NOT NULL,
  `fork_number` INT NOT NULL,
  `sponor_or_not` TINYINT COMMENT '1为 sponor，0为 not sponor',
  PRIMARY KEY (`Repository_name`, `Owner`));

 CREATE TABLE `github_info`.`sponsor_repositories` (
  `Repository_name` VARCHAR(45) NOT NULL,
  `Owner` VARCHAR(45) NOT NULL,
  `Description` VARCHAR(45) NULL,
  `Public_or_private` TINYINT COMMENT '1为 Public，0为 private',
  `goal` INT NOT NULL COMMENT 'sponsor的目标，比如每月50英镑',
  `Updated_on` DATE NULL,
  `star_number` INT NOT NULL,
  `watch_number` INT NOT NULL,
  `fork_number` INT NOT NULL,
  PRIMARY KEY (`Repository_name`, `Owner`));
  
  CREATE TABLE `github_info`.`topic` (
  `topic_name` VARCHAR(45) NOT NULL,
  `description` VARCHAR(145) NOT NULL,
  `repositories_num` INT NULL,
  PRIMARY KEY (`topic_name`))
COMMENT = '每个topic会收纳一些Repositories';
 
 CREATE TABLE `github_info`.`repositories_match_topic` (
  `Repository_name` VARCHAR(45) NOT NULL,
  `Owner` VARCHAR(45) NOT NULL,
  `topic_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Repository_name`, `owner`, `topic_name`));
  
  CREATE TABLE `github_info`.`collections` (
  `collection_name` VARCHAR(45) NOT NULL,
  `description` VARCHAR(145) NOT NULL,
  `repositories_num` INT NULL,
  PRIMARY KEY (`collection_name`))
COMMENT = '每个topic会收纳一些Repositories';
 

 
 CREATE TABLE `github_info`.`repositories_match_collections` (
  `Repository_name` VARCHAR(45) NOT NULL,
  `Owner` VARCHAR(45) NOT NULL,
  `collection_name` VARCHAR(45) NOT NULL,
PRIMARY KEY (`Repository_name`, `owner`, `collection_name`));
  
  CREATE TABLE `github_info`.`releases` (
  `Repository_name` VARCHAR(45) NOT NULL,
  `Owner` VARCHAR(45) NOT NULL,
  `Tag` VARCHAR(45) NOT NULL,
  `release_date` DATE NOT NULL,
  `Publisher` VARCHAR(45) NULL,
  `download_URL` VARCHAR(145) NULL CHECK(`download_URL` LIKE "http://%" or `download_URL` LIKE "https://%"),
  PRIMARY KEY (`Repository_name`, `Owner`, `Tag`));
 
 CREATE TABLE `github_info`.`packages` (
  `Repository_name` VARCHAR(45) NOT NULL,
  `Owner` VARCHAR(45) NOT NULL,
  `Packages_name` VARCHAR(45) NOT NULL,
  `type` VARCHAR(45) NOT NULL CHECK (`type` = "Docker" or `type` = "Apache Mave" or `type` = "NuGet" or `type` = "RubyGems" or `type` = "npm" or `type` = "Containers" ),
  `release_date` DATE NULL,
  PRIMARY KEY (`Repository_name`, `Owner`,  `Packages_name`, `type`));

CREATE TABLE `github_info`.`code` (
  `Repository_name` VARCHAR(45) NOT NULL,
  `Owner` VARCHAR(45) NOT NULL,
  `commit_num` INT NULL DEFAULT 0,
  `branch_num` INT NULL DEFAULT 0,
  `tags_num` INT NULL DEFAULT 0,
  `last_update` DATE NULL,
  PRIMARY KEY (`Repository_name`, `Owner`));

CREATE TABLE `github_info`.`issues` (
  `Repository_name` VARCHAR(45) NOT NULL,
  `Owner` VARCHAR(45) NOT NULL,
  `number` INT NOT NULL,
  `account_name` VARCHAR(45) NOT NULL COMMENT '在这里加上了用户名字，由仓库名和issue序号作为主键可以唯一确定是谁发出的issue',
  `comment` VARCHAR(45) NULL,
  `date` DATE NULL,
  `open or close` TINYINT NULL COMMENT 'open is 1 and closed is 0',
  PRIMARY KEY (`Repository_name`, `Owner`, `number`));
  
  CREATE TABLE `github_info`.`pull_requests` (
  `Repository_name` VARCHAR(45) NOT NULL,
  `Owner` VARCHAR(45) NOT NULL,
  `number` INT NOT NULL,
  `comment` VARCHAR(45) NULL,
  `date` DATE NOT NULL,
  `open_or_close` TINYINT NOT NULL,
  PRIMARY KEY (`Repository_name`, `Owner`, `number`));  
  

-- 一些操作

CREATE TABLE `github_info`.`user_sponsor_repositories` (
  `account_name` VARCHAR(45) NOT NULL,
  `repository_name` VARCHAR(45) NOT NULL,
  `sponsor-repositories-owner` VARCHAR(45) NOT NULL,
  `money` INT NOT NULL COMMENT 'Choose a custom amount.',
  `frequency` VARCHAR(45) NOT NULL CHECK (`frequency` = "Monthly" or `frequency` = "One-time") COMMENT 'Monthly and One-time',
  PRIMARY KEY (`account_name`, `repository_name`, `sponsor-repositories-owner` ));

CREATE TABLE `github_info`.`user_view_repositories` (
  `owner` VARCHAR(45) NOT NULL,
  `repository_name` VARCHAR(45) NOT NULL,
  `account_name` VARCHAR(45) NOT NULL,
  `date` DATE NOT NULL,
  PRIMARY KEY (`account_name`, `repository_name`, `owner`));

CREATE TABLE `github_info`.`user_fork_repositories` (
  `owner` VARCHAR(45) NOT NULL,
  `repository_name` VARCHAR(45) NOT NULL,
  `account_name` VARCHAR(45) NOT NULL,
  `date` DATE NOT NULL,
  PRIMARY KEY (`account_name`, `repository_name`, `owner`));
  
CREATE TABLE `github_info`.`user_star_repositories` (
  `owner` VARCHAR(45) NOT NULL,
  `repository_name` VARCHAR(45) NOT NULL,
  `account_name` VARCHAR(45) NOT NULL,
  `date` DATE NOT NULL,
  PRIMARY KEY (`account_name`, `repository_name`, `owner`));

CREATE TABLE `github_info`.`user_watch_repositories` (
  `owner` VARCHAR(45) NOT NULL,
  `repository_name` VARCHAR(45) NOT NULL,
  `account_name` VARCHAR(45) NOT NULL,
  `date` DATE NOT NULL,
  PRIMARY KEY (`account_name`, `repository_name`, `owner`));
 
 CREATE TABLE `github_info`.`user_develop_repositories` (
  `owner` VARCHAR(45) NOT NULL,
  `repository_name` VARCHAR(45) NOT NULL,
  `account_name` VARCHAR(45) NOT NULL,
  `role` VARCHAR(45) NOT NULL CHECK(`role` = "owner" or `role` = "member" )COMMENT 'include owner and member',
  PRIMARY KEY (`account_name`, `repository_name`, `owner`));
 

 
 
  CREATE TABLE `github_info`.`user_respond_issue_repositories` (
  `owner` VARCHAR(45) NOT NULL,
  `repository_name` VARCHAR(45) NOT NULL,
  `account_name` VARCHAR(45) NOT NULL,
  `number` INT COMMENT 'the numbers of issues',
  `date` DATE NOT NULL,
  `response` VARCHAR(45) ,
  PRIMARY KEY (`account_name`, `repository_name`, `owner`, `number`));
 
  CREATE TABLE `github_info`.`user_fileschangedin_repositories` (
  `owner` VARCHAR(45) NOT NULL,
  `repository_name` VARCHAR(45) NOT NULL,  
  `account_name` VARCHAR(45) NOT NULL,
  `number` INT NOT NULL,
  `files` VARCHAR(45) NOT NULL,
  `changed_line_content` VARCHAR(145),
  `changed_line_num` VARCHAR(45),
  PRIMARY KEY (`account_name`, `repository_name`, `owner`, `number`));
 

  CREATE TABLE `github_info`.`users_star_topic` (
  `account_name` VARCHAR(45) NOT NULL,
  `topic_name` VARCHAR(45) NOT NULL,
  `date` DATE NOT NULL,
  PRIMARY KEY (`account_name`, `topic_name`));
  
  CREATE TABLE `github_info`.`users_star_collections` (
  `account_name` VARCHAR(45) NOT NULL,
  `collections_name` VARCHAR(45) NOT NULL,
  `date` DATE NOT NULL,
  PRIMARY KEY (`account_name`, `collections_name`));
 
   CREATE TABLE `github_info`.`users_star_action` (
  `account_name` VARCHAR(45) NOT NULL,
  `action_name` VARCHAR(45) NOT NULL,
  `date` DATE NOT NULL,
  PRIMARY KEY (`account_name`, `action_name`));
  


 CREATE TABLE `github_info`.`popular_repositories` (
  `owner` VARCHAR(45) NOT NULL,
  `repository_name` VARCHAR(45) NOT NULL,
  `language` VARCHAR(45) NOT NULL,
  `date_range` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`owner`, `repository_name`, `date_range`));
 
  CREATE TABLE `github_info`.`popular_users` (
  `account_name` VARCHAR(45) NOT NULL,
  `date_range` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`account_name`,  `date_range`));
 
 -- show create table users;
 
 
 