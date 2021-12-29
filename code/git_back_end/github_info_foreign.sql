-- 建立外键,按照表建立的顺序建立外键约束

-- 用户名称必须存在
ALTER TABLE individualuser
ADD CONSTRAINT FK_induser_user
FOREIGN KEY (account_name)
REFERENCES users(account_name)
ON DELETE CASCADE
ON UPDATE CASCADE;


-- 组织和用户名称必须存在
ALTER TABLE indvuser_belong_org
ADD CONSTRAINT FK_inbeorg_org
FOREIGN KEY (Org_account_name)
REFERENCES organization(Org_act_name);

ALTER TABLE indvuser_belong_org
ADD CONSTRAINT  FK_inbeorg_user
FOREIGN KEY  (account_name)
REFERENCES  users(account_name);

-- 组织名字必须存在
ALTER TABLE team
ADD CONSTRAINT  FK_team_org
FOREIGN KEY (organization_name)
REFERENCES organization(Org_act_name);

-- 账号名称、 组织名称、团队名称都必须存在
ALTER TABLE indvuser_belong_team
ADD CONSTRAINT  FK_indbeteam_user
FOREIGN KEY (account_name)
REFERENCES users(account_name);

ALTER TABLE indvuser_belong_team
ADD CONSTRAINT FK_indbeteam_org
FOREIGN KEY (Org_name)
REFERENCES organization(Org_act_name);

SHOW INDEX FROM team;
CREATE INDEX team_name ON team(team_name);

ALTER TABLE indvuser_belong_team
ADD CONSTRAINT FK_indbeteam_team
FOREIGN KEY (team_name)
REFERENCES team(team_name);

-- account_name, event_name
ALTER TABLE user_join_events
ADD CONSTRAINT FK_uje_user
FOREIGN KEY (account_name)
REFERENCES users(account_name);

ALTER TABLE user_join_events
ADD CONSTRAINT FK_uje_event
FOREIGN KEY (event_name)
REFERENCES events(name);

-- account_name, app_name
ALTER TABLE users_install_app
ADD CONSTRAINT FK_uia_user
FOREIGN KEY (account_name)
REFERENCES users(account_name);

ALTER TABLE users_install_app
ADD CONSTRAINT FK_uia_app
FOREIGN KEY (app_name)
REFERENCES app(name);

-- account_name, action_name

ALTER TABLE users_install_action
ADD CONSTRAINT FK_uiac_user
FOREIGN KEY (account_name)
REFERENCES users(account_name);

ALTER TABLE action
    modify name varchar(45) not null;

ALTER TABLE users_install_action
ADD CONSTRAINT FK_uiac_action
FOREIGN KEY (action_name)
REFERENCES action(name);

-- account_name, app_name
ALTER TABLE org_develop_app
ADD CONSTRAINT FK_oda_user
FOREIGN KEY (account_name)
REFERENCES users(account_name);

ALTER TABLE org_develop_app
ADD CONSTRAINT FK_oda_app
FOREIGN KEY (app_name)
REFERENCES app(name);

-- account_name, action_name
ALTER TABLE user_contribute_action
ADD CONSTRAINT FK_uca_user
FOREIGN KEY (account_name)
REFERENCES users(account_name);

ALTER TABLE user_contribute_action
ADD CONSTRAINT FK_uca_action
FOREIGN KEY (action_name)
REFERENCES action(name);

-- user1, user2
CREATE INDEX user_name ON users(account_name);

ALTER TABLE user1_follow_user2
ADD CONSTRAINT FK_ufu_user
FOREIGN KEY (user1)
REFERENCES users(account_name);

ALTER TABLE user1_follow_user2
ADD CONSTRAINT FK_ufu_user2
FOREIGN KEY (user2)
REFERENCES users(account_name);

-- user1, user2
ALTER TABLE user1_star_user2
ADD CONSTRAINT FK_usu_user
FOREIGN KEY (user1)
REFERENCES users(account_name);

ALTER TABLE user1_star_user2
ADD CONSTRAINT FK_usu_user2
FOREIGN KEY (user2)
REFERENCES users(account_name);

-- owner
ALTER TABLE repositories
ADD CONSTRAINT FK_rep_user
FOREIGN KEY (owner)
REFERENCES users(account_name);

-- owner
ALTER TABLE sponsor_repositories
ADD CONSTRAINT FK_srep_user
FOREIGN KEY (owner)
REFERENCES users(account_name);

-- rep_name, owner
ALTER TABLE repositories_match_topic
ADD CONSTRAINT FK_rmt_rep
FOREIGN KEY (Repository_name, Owner)
REFERENCES repositories(Repository_name, Owner);

ALTER TABLE repositories_match_topic
ADD CONSTRAINT FK_rmt_topic
FOREIGN KEY (topic_name)
REFERENCES topic(topic_name);

-- rep_name. owner, collection_name
ALTER TABLE repositories_match_collections
ADD CONSTRAINT FK_rmc_rep
FOREIGN KEY (Repository_name, Owner)
REFERENCES repositories(Repository_name, Owner);

ALTER TABLE repositories_match_collections
ADD CONSTRAINT FK_rmc_collections
FOREIGN KEY (collection_name)
REFERENCES collections(collection_name);

-- rep_name, owner
ALTER TABLE releases
ADD CONSTRAINT FK_releases_rep
FOREIGN KEY (Repository_name, Owner)
REFERENCES repositories(Repository_name, Owner);

-- rep_name, owner
ALTER TABLE packages
ADD CONSTRAINT FK_packages_rep
FOREIGN KEY (Repository_name, Owner)
REFERENCES repositories(Repository_name, Owner);

-- rep_name, owner
ALTER TABLE code
ADD CONSTRAINT FK_code_rep
FOREIGN KEY (Repository_name, Owner)
REFERENCES repositories(Repository_name, Owner);

-- rep_name, owner
ALTER TABLE issues
ADD CONSTRAINT FK_issues_rep
FOREIGN KEY (Repository_name, Owner)
REFERENCES repositories(Repository_name, Owner);

-- rep_name, owner
ALTER TABLE pull_requests
ADD CONSTRAINT FK_pullrequest_rep
FOREIGN KEY (Repository_name, Owner)
REFERENCES repositories(Repository_name, Owner);

-- account_name, rep_name, spon_owner
ALTER TABLE user_sponsor_repositories
ADD CONSTRAINT FK_usr_user
FOREIGN KEY (account_name)
REFERENCES users(account_name);

ALTER TABLE user_sponsor_repositories
ADD CONSTRAINT FK_usr_rep
FOREIGN KEY (repository_name)
REFERENCES repositories(Repository_name);

-- account_name, owner, rep_name
ALTER TABLE user_view_repositories
ADD CONSTRAINT FK_uvr_rep
FOREIGN KEY (repository_name, owner)
REFERENCES repositories(Repository_name, owner);

ALTER TABLE user_view_repositories
ADD CONSTRAINT FK_uvr_user
FOREIGN KEY (account_name)
REFERENCES users(account_name);

-- account_name, owner, rep_name
ALTER TABLE user_fork_repositories
ADD CONSTRAINT FK_ufr_rep
FOREIGN KEY (repository_name, owner)
REFERENCES repositories(Repository_name, owner);

ALTER TABLE user_fork_repositories
ADD CONSTRAINT FK_ufr_user
FOREIGN KEY (account_name)
REFERENCES users(account_name);

-- account_name, owner, rep_name
ALTER TABLE user_star_repositories
ADD CONSTRAINT FK_ustr_rep
FOREIGN KEY (repository_name, owner)
REFERENCES repositories(Repository_name, owner);

ALTER TABLE user_star_repositories
ADD CONSTRAINT FK_ustr_user
FOREIGN KEY (account_name)
REFERENCES users(account_name);

-- account_name, owner, rep_name
ALTER TABLE user_watch_repositories
ADD CONSTRAINT FK_uwr_rep
FOREIGN KEY (repository_name, owner)
REFERENCES repositories(Repository_name, owner);

ALTER TABLE user_watch_repositories
ADD CONSTRAINT FK_uwr_user
FOREIGN KEY (account_name)
REFERENCES users(account_name);

-- account_name, owner, rep_name
ALTER TABLE user_develop_repositories
ADD CONSTRAINT FK_udr_rep
FOREIGN KEY (repository_name, owner)
REFERENCES repositories(Repository_name, owner);

ALTER TABLE user_develop_repositories
ADD CONSTRAINT FK_udr_user
FOREIGN KEY (account_name)
REFERENCES users(account_name);

-- account_name, owner, rep_name
ALTER TABLE user_respond_issue_repositories
ADD CONSTRAINT FK_urir_rep
FOREIGN KEY (repository_name, owner)
REFERENCES repositories(Repository_name, owner);

ALTER TABLE user_respond_issue_repositories
ADD CONSTRAINT FK_urir_user
FOREIGN KEY (account_name)
REFERENCES users(account_name);

-- account_name, owner, rep_name
ALTER TABLE user_fileschangedin_repositories
ADD CONSTRAINT FK_ufcir_rep
FOREIGN KEY (repository_name, owner)
REFERENCES repositories(Repository_name, owner);

ALTER TABLE user_fileschangedin_repositories
ADD CONSTRAINT FK_ufcir_user
FOREIGN KEY (account_name)
REFERENCES users(account_name);

-- topic_name, account_name
ALTER TABLE users_star_topic
ADD CONSTRAINT FK_ust_user
FOREIGN KEY (account_name)
REFERENCES users(account_name);

ALTER TABLE users_star_topic
ADD CONSTRAINT FK_ust_topic
FOREIGN KEY (topic_name)
REFERENCES topic(topic_name);

-- collection_name, account_name
ALTER TABLE users_star_collections
ADD CONSTRAINT FK_usc_user
FOREIGN KEY (account_name)
REFERENCES users(account_name);

ALTER TABLE users_star_collections
ADD CONSTRAINT FK_usc_collections
FOREIGN KEY (collections_name)
REFERENCES collections(collection_name);

-- action_name, account_name
ALTER TABLE users_star_action
ADD CONSTRAINT FK_usa_user
FOREIGN KEY (account_name)
REFERENCES users(account_name);

ALTER TABLE users_star_action
ADD CONSTRAINT FK_usa_collections
FOREIGN KEY (action_name)
REFERENCES action(name);


CREATE TABLE popular_repositories (
    owner VARCHAR(45) NOT NULL,
    repository_name VARCHAR(45) NOT NULL,
    language VARCHAR(45) NOT NULL,
    data_range VARCHAR(45) NOT NULL,
    PRIMARY KEY (owner, repository_name, data_range)
);

ALTER TABLE popular_repositories
ADD CONSTRAINT FK_poprep_rep
FOREIGN KEY (repository_name, owner)
REFERENCES repositories(Repository_name, owner);

CREATE TABLE popular_users (
    account_name VARCHAR(45) NOT NULL ,
    data_range VARCHAR(45) NOT NULL,
    PRIMARY KEY (account_name, data_range)
);

ALTER TABLE popular_users
ADD CONSTRAINT FK_popusers_users
FOREIGN KEY (account_name)
REFERENCES users(account_name);
