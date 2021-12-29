 -- 创建触发器
 
 -- users_install_app
 
 DROP TRIGGER IF EXISTS `github_info`.`users_install_app_AFTER_INSERT`;

DELIMITER $$
USE `github_info`$$
CREATE DEFINER = CURRENT_USER TRIGGER `github_info`.`users_install_app_AFTER_INSERT` 
AFTER INSERT ON `users_install_app` FOR EACH ROW
BEGIN
	update app set install_num = install_num + 1
    where name = new.app_name;
END$$
DELIMITER ;


 -- users_star_action
 
 DROP TRIGGER IF EXISTS `github_info`.`users_star_action_AFTER_INSERT`;

DELIMITER $$
USE `github_info`$$
CREATE DEFINER = CURRENT_USER TRIGGER `github_info`.`users_star_action_AFTER_INSERT` AFTER INSERT ON `users_star_action` FOR EACH ROW
BEGIN
	update action set Stars_number = Stars_number + 1
    where name = new.action_name;
END$$
DELIMITER ;

DROP TRIGGER IF EXISTS `github_info`.`users_star_action_AFTER_DELETE`;

DELIMITER $$
USE `github_info`$$
CREATE DEFINER = CURRENT_USER TRIGGER `github_info`.`users_star_action_AFTER_DELETE` AFTER DELETE ON `users_star_action` FOR EACH ROW
BEGIN
	update action set Stars_number = Stars_number - 1
    where name = old.action_name;
END$$
DELIMITER ;


-- user_fork_repositories

DROP TRIGGER IF EXISTS `github_info`.`user_fork_repositories_AFTER_INSERT`;

DELIMITER $$
USE `github_info`$$
CREATE DEFINER = CURRENT_USER TRIGGER `github_info`.`user_fork_repositories_AFTER_INSERT` AFTER INSERT ON `user_fork_repositories` FOR EACH ROW
BEGIN
	update repositories set fork_number = fork_number + 1
    where Owner = new.account_name;

END$$
DELIMITER ;

DROP TRIGGER IF EXISTS `github_info`.`user_fork_repositories_AFTER_DELETE`;

DELIMITER $$
USE `github_info`$$
CREATE DEFINER = CURRENT_USER TRIGGER `github_info`.`user_fork_repositories_AFTER_DELETE` AFTER DELETE ON `user_fork_repositories` FOR EACH ROW
BEGIN
	update repositories set fork_number = fork_number - 1
    where Owner = old.account_name;
END$$
DELIMITER ;


-- user_star_repositories

DROP TRIGGER IF EXISTS `github_info`.`user_star_repositories_AFTER_INSERT`;

DELIMITER $$
USE `github_info`$$
CREATE DEFINER = CURRENT_USER TRIGGER `github_info`.`user_star_repositories_AFTER_INSERT` AFTER INSERT ON `user_star_repositories` FOR EACH ROW
BEGIN
	update repositories set star_number = star_number + 1
    where Owner = new.account_name;

END$$
DELIMITER ;

DROP TRIGGER IF EXISTS `github_info`.`user_star_repositories_AFTER_DELETE`;

DELIMITER $$
USE `github_info`$$
CREATE DEFINER = CURRENT_USER TRIGGER `github_info`.`user_star_repositories_AFTER_DELETE` AFTER DELETE ON `user_star_repositories` FOR EACH ROW
BEGIN
	update repositories set star_number = star_number - 1
    where Owner = old.account_name;
END$$
DELIMITER ;

-- user_watch_repositories
DROP TRIGGER IF EXISTS `github_info`.`user_watch_repositories_AFTER_INSERT`;

DELIMITER $$
USE `github_info`$$
CREATE DEFINER = CURRENT_USER TRIGGER `github_info`.`user_watch_repositories_AFTER_INSERT` AFTER INSERT ON `user_watch_repositories` FOR EACH ROW
BEGIN
	update repositories set watch_number = watch_number + 1
    where Owner = new.account_name;
END$$
DELIMITER ;
DROP TRIGGER IF EXISTS `github_info`.`user_watch_repositories_AFTER_DELETE`;

DELIMITER $$
USE `github_info`$$
CREATE DEFINER = CURRENT_USER TRIGGER `github_info`.`user_watch_repositories_AFTER_DELETE` AFTER DELETE ON `user_watch_repositories` FOR EACH ROW
BEGIN
	update repositories set watch_number = watch_number - 1
    where Owner = old.account_name;
END$$
DELIMITER ;

-- user_view_repositories
 DROP TRIGGER IF EXISTS `github_info`.`user_view_repositories_AFTER_INSERT`;

DELIMITER $$
USE `github_info`$$
CREATE DEFINER = CURRENT_USER TRIGGER `github_info`.`user_view_repositories_AFTER_INSERT` AFTER INSERT ON `user_view_repositories` FOR EACH ROW
BEGIN
	update repositories set view_number = view_number + 1
	where Owner = new.account_name;
END$$
DELIMITER ;
DROP TRIGGER IF EXISTS `github_info`.`user_view_repositories_AFTER_DELETE`;

DELIMITER $$
USE `github_info`$$
CREATE DEFINER = CURRENT_USER TRIGGER `github_info`.`user_view_repositories_AFTER_DELETE` AFTER DELETE ON `user_view_repositories` FOR EACH ROW
BEGIN
	update repositories set view_number = view_number - 1
    where Owner = old.account_name;
END$$
DELIMITER ;





DROP TRIGGER IF EXISTS `github_info`.`individualuser_BEFORE_INSERT`;

DELIMITER $$
USE `github_info`$$
CREATE DEFINER = CURRENT_USER TRIGGER `github_info`.`individualuser_BEFORE_INSERT` 
BEFORE INSERT ON `individualuser` FOR EACH ROW
BEGIN
IF EXISTS(select 1 from github_info.users A ,inserted B where A.GUID=B.GUID) 
THEN
	UPDATE github_info.users 
    set account_name=B.account_name, email=B.public_email, address=B.Location,
		type='individual' ,password=B.password;
else
	insert into github_info.users 
    select account_name,public_email,Location,'individual',password 
    from inserted;
END IF;
END$$
DELIMITER ;


