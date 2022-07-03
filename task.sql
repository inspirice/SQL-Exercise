create database worktask;

use worktask;

create table task(
	`task_id` int(11) not null auto_increment,
    `title` varchar(255) not null,
    `start_date` date default null,
    `due_date` date default null,
    `status` tinyint not null,
    `priority` tinyint not null,
    `description` text default null,
    `created_at` timestamp default current_timestamp,
    primary key(`task_id`)
)engine=InnoDB default charset=latin1;

create table checklists(
	`todo_id` int(11) not null auto_increment,
    `task_id` int(11) not null,
    `todo` varchar(255) default null,
    `is_complete` boolean default false,
    primary key(`todo_id`,`task_id`),
    key `task_id` (`task_id`),
    constraint `checklists_1` foreign key (`task_id`) references `task` (`task_id`)
)engine=InnoDB default charset=latin1;

insert into `task`(`task_id`,`title`,`start_date`,`due_date`,`status`,`priority`,`description`,`created_at`) values 
	(1,'title1','2022-04-10','2022-04-11','1','1',null,null),
	(2,'title2','2022-04-11','022-04-12','2','1',null,null),
	(3,'title3','2022-04-12','2022-04-15','2','1',null,null),
	(4,'title4','2022-04-12','2022-04-15','2','2',null,null),
	(5,'title5','2022-04-12','2022-04-15','3','3',null,null);

insert into `checklists`(`todo_id`,`task_id`,`todo`,`is_complete`) values 
	(1,1,'do action1',1),
	(2,1,'do action2',1),
	(3,2,'do action1',1),
	(4,2,'do action2',0),
	(5,2,'do action2',0),
	(6,2,'do action2',0),
	(7,3,'do action1',0),
	(8,3,'do action2',0);

select task.task_id, title, start_date, due_date, status, priority, description, created_at from task inner join checklists
on task.task_id = checklists.task_id
where is_complete = false;

select task.task_id, title, start_date, due_date, status, priority, description, created_at from task inner join checklists
on task.task_id = checklists.task_id
where due_date < '2022-04-15';

update checklists set is_complete = true where task_id = 2 and todo = 'do action2';

delete from checklists where task_id = 3 and todo = 'do action2';

