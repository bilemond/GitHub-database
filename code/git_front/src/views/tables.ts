
interface table_object {
    name: string,
    index: string
}

const oper_x:string[] = [
    'action', 'app', 'code', 'collections', 'events', 'individualuser','indvuser_belong_team',
    'indvuser_belong_org', 'issues','org_develop_app',
    'organization', 'packages', 'pull_request', 'releases', "repositories",
    'repositories_match_collections', 'repositories_match_topic', 'sponsor_repositories',
    'team','team_belong_org', 'topic', 'trending', 'user1_follow_user2',
    'user1_star_user2', 'user_contribute_action', 'user_develop_repositories',
    'user_fileschangedin_repositories', 'user_fork_repositories', 'user_join_events',
    'user_respond_issue_repositories', 'user_sponsor_repositories', 'user_star_repositories',
    'user_view_repositories', 'user_watch_repositories', 'users', 'users_install_action',
    'user_install_app','users_star_action', 'users_star_collections', 'users_star_topic'
];
const oper_y:string[] = [
    '1-1','1-2','1-3','1-4','1-5','1-6','1-7','1-8','1-9','1-10','1-11','1-12','1-13',
    '1-14','1-15','1-16','1-17','1-18','1-19','1-20','1-21','1-22','1-23',
    '1-24','1-25','1-26','1-27','1-28','1-29','1-30','1-31','1-32',
    '1-33','1-34','1-35','1-36','1-37','1-38','1-39','1-40'
];

const tables:table_object[] = [];

oper_x.forEach((one, ind) => {
    const item:table_object = {
        name: one,
        index: oper_y[ind]
    }
    tables.push(item);

})
export default tables
