create table tbl_auth
(
    phone       varchar(100)         not null
        primary key,
    code        varchar(10)          not null,
    is_checked  tinyint(1) default 0 not null,
    request_cnt int(2)     default 0 not null
);

create table tbl_kindergarten_info
(
    kindergarten_info_seq bigint auto_increment
        primary key,
    name                  varchar(20)  not null,
    director              varchar(10)  not null,
    address               varchar(100) not null
);

create table tbl_notice
(
    notice_seq   bigint auto_increment
        primary key,
    title        varchar(255)                           null,
    content      text                                   not null,
    class_seq    bigint                                 not null,
    created_at   timestamp  default current_timestamp() not null,
    updated_at   timestamp  default current_timestamp() not null on update current_timestamp(),
    announcement tinyint(1) default 0                   not null
);

create index FK_tbl_class_TO_tbl_notice_1
    on tbl_notice (class_seq);

create table tbl_notice_photo
(
    notice_photo_seq bigint auto_increment
        primary key,
    notice_seq       bigint       not null,
    photo            varchar(255) null,
    idx              int(2)       null,
    constraint FK_tbl_notice_TO_tbl_notice_photo_1
        foreign key (notice_seq) references tbl_notice (notice_seq)
);

create table tbl_user
(
    user_seq     bigint auto_increment
        primary key,
    id           varchar(30)                           not null,
    password     varchar(256)                          not null,
    name         varchar(30)                           not null,
    teacher      int       default 1                   not null,
    phone_number varchar(100)                          not null,
    created_at   timestamp default current_timestamp() not null,
    updated_at   timestamp default current_timestamp() not null on update current_timestamp(),
    role         int(1)                                null
);

create table tbl_kindergarten
(
    kindergarten_seq bigint auto_increment
        primary key,
    user_seq         bigint                                not null,
    name             varchar(100)                          null,
    address          varchar(100)                          null,
    created_at       timestamp default current_timestamp() not null,
    updated_at       timestamp default current_timestamp() not null on update current_timestamp(),
    constraint FK_tbl_user_TO_tbl_kindergarten_1
        foreign key (user_seq) references tbl_user (user_seq)
);

create table tbl_class
(
    class_seq        bigint auto_increment
        primary key,
    kindergarten_seq bigint                                not null,
    name             varchar(30)                           not null,
    count            int(2)                                not null,
    age              varchar(20)                           null,
    created_at       timestamp default current_timestamp() not null,
    updated_at       timestamp default current_timestamp() not null on update current_timestamp(),
    constraint FK_tbl_kindergarten_TO_tbl_class_1
        foreign key (kindergarten_seq) references tbl_kindergarten (kindergarten_seq)
);

create table tbl_class_album
(
    album_seq  bigint auto_increment
        primary key,
    class_seq  bigint                                not null,
    name       varchar(30)                           null,
    created_at timestamp default current_timestamp() not null,
    updated_at timestamp default current_timestamp() not null on update current_timestamp(),
    constraint FK_tbl_class_TO_tbl_class_album_1
        foreign key (class_seq) references tbl_class (class_seq)
            on delete cascade
);

create table tbl_album_photo
(
    album_photo_seq bigint auto_increment
        primary key,
    album_seq       bigint       not null,
    photo           varchar(255) not null,
    constraint FK_tbl_class_album_TO_tbl_album_photo_1
        foreign key (album_seq) references tbl_class_album (album_seq)
);

create table tbl_class_teacher
(
    class_teacher_seq bigint auto_increment
        primary key,
    user_seq          bigint not null,
    class_seq         bigint not null,
    constraint FK_tbl_class_TO_tbl_class_teacher_1
        foreign key (class_seq) references tbl_class (class_seq)
            on delete cascade,
    constraint FK_tbl_user_TO_tbl_class_teacher_1
        foreign key (user_seq) references tbl_user (user_seq)
            on delete cascade
);

create table tbl_food
(
    food_seq         bigint auto_increment
        primary key,
    kindergarten_seq bigint                                not null,
    date             datetime                              not null,
    rice             varchar(30)                           null,
    soup             varchar(30)                           null,
    dish1            varchar(30)                           null,
    dish2            varchar(30)                           null,
    dish3            varchar(30)                           null,
    morning_snack1   varchar(30)                           null,
    morning_snack2   varchar(30)                           null,
    afternoon_snack1 varchar(30)                           null,
    afternoon_snack2 varchar(30)                           null,
    created_at       timestamp default current_timestamp() not null,
    updated_at       timestamp default current_timestamp() not null on update current_timestamp(),
    constraint FK_tbl_kindergarten_TO_tbl_food_1
        foreign key (kindergarten_seq) references tbl_kindergarten (kindergarten_seq)
);

create table tbl_kid
(
    kid_seq   bigint auto_increment
        primary key,
    class_seq bigint           null,
    name      varchar(30)      not null,
    photo     varchar(255)     null,
    birth     datetime         not null,
    user_seq  bigint default 0 null,
    gender    varchar(1)       null,
    constraint FK_tbl_class_TO_tbl_kid_1
        foreign key (class_seq) references tbl_class (class_seq)
            on delete set null,
    constraint FK_tbl_user_TO_tbl_kid_1
        foreign key (user_seq) references tbl_user (user_seq)
            on delete set null
);

create table tbl_attendance
(
    attendance_seq    bigint auto_increment
        primary key,
    kid_seq           bigint                                not null,
    forth_time        time                                  null,
    back_time         time                                  null,
    back_way          varchar(30)                           null,
    parent_name       varchar(30)                           null,
    phone_number      varchar(100)                          null,
    temp_parent_name  varchar(30)                           null,
    temp_phone_number varchar(100)                          null,
    sign              text                                  null,
    forth_time_check  time                                  null,
    back_time_check   time                                  null,
    created_at        timestamp default current_timestamp() not null,
    updated_at        timestamp default current_timestamp() not null on update current_timestamp(),
    constraint FK_tbl_kid_TO_tbl_attendance_1
        foreign key (kid_seq) references tbl_kid (kid_seq)
);

create table tbl_medicine
(
    medicine_seq  bigint auto_increment
        primary key,
    kid_seq       bigint                                not null,
    symptom       varchar(100)                          null,
    pill          varchar(30)                           null,
    capacity      varchar(30)                           null,
    count         varchar(30)                           null,
    time          varchar(30)                           null,
    keep          varchar(30)                           null,
    content       varchar(255)                          null,
    request_date  timestamp default current_timestamp() not null,
    request_name  varchar(30)                           not null,
    request_sign  varchar(255)                          not null,
    response_name varchar(30)                           null,
    response_sign varchar(255)                          null,
    response_date timestamp                             null,
    constraint FK_tbl_kid_TO_tbl_medicine_1
        foreign key (kid_seq) references tbl_kid (kid_seq)
);

create table tbl_notice_kid
(
    notice_kid_seq bigint auto_increment
        primary key,
    kid_seq        bigint not null,
    notice_seq     bigint not null,
    constraint FK_tbl_kid_TO_tbl_notice_kid_1
        foreign key (kid_seq) references tbl_kid (kid_seq),
    constraint FK_tbl_notice_TO_tbl_notice_kid_1
        foreign key (notice_seq) references tbl_notice (notice_seq)
);

create table tbl_schedule_type
(
    schedule_type_seq bigint auto_increment
        primary key,
    kindergarten_seq  bigint               not null,
    name              varchar(30)          not null,
    is_valid          tinyint(1) default 1 not null,
    constraint FK_tbl_kindergarten_TO_tbl_schedule_type_1
        foreign key (kindergarten_seq) references tbl_kindergarten (kindergarten_seq)
);

create table tbl_schedule
(
    schedule_seq      bigint auto_increment
        primary key,
    kindergarten_seq  bigint      not null,
    schedule_type_seq bigint      not null,
    content           varchar(50) not null,
    date              datetime    not null,
    class_seq         bigint      null,
    constraint FK_tbl_class_TO_tbl_schedule_1
        foreign key (class_seq) references tbl_class (class_seq)
            on delete set null,
    constraint FK_tbl_kindergarten_TO_tbl_schedule_1
        foreign key (kindergarten_seq) references tbl_kindergarten (kindergarten_seq),
    constraint FK_tbl_schedule_type_TO_tbl_schedule_1
        foreign key (schedule_type_seq) references tbl_schedule_type (schedule_type_seq),
    constraint FKhclmgwyt0w6o8dh8ee3w3juwf
        foreign key (schedule_type_seq) references tbl_schedule_type (schedule_type_seq)
);


