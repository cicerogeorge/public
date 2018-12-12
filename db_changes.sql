ALTER TABLE `companies_users` ADD COLUMN `priority` int(11) DEFAULT NULL AFTER `enable_booking`;
ALTER TABLE `companies_users` MODIFY COLUMN `role` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL AFTER `user_id`;
ALTER TABLE `timetables` MODIFY COLUMN `starttime` TIME DEFAULT NULL AFTER `startdate`;
ALTER TABLE `timetables` MODIFY COLUMN `endtime` TIME DEFAULT NULL AFTER `enddate`;
ALTER TABLE `companies_groups` ADD COLUMN `show_services` int(11) UNSIGNED NOT NULL DEFAULT 1 AFTER `priority`;
ALTER TABLE `companies` ADD COLUMN `waiting_list` int(11) UNSIGNED NOT NULL DEFAULT 1 AFTER `sms_count`;
ALTER TABLE `companies_groups` MODIFY COLUMN `about` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL AFTER `name`;

CREATE TABLE `notifications_templates` (
id int(11) NOT NULL AUTO_INCREMENT,
company_id int(11) DEFAULT NULL,
type_message varchar(750) DEFAULT NULL,
message varchar(765) DEFAULT NULL,
created_at datetime DEFAULT NULL,
updated_at datetime DEFAULT NULL,
deleted_at datetime DEFAULT NULL,
PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

CREATE TABLE `system_logs` (
id int(11) NOT NULL AUTO_INCREMENT,
user_id int(11) DEFAULT NULL,
class varchar(300) DEFAULT NULL,
class_id int(11) DEFAULT NULL,
operation varchar(150) DEFAULT NULL,
field varchar(600) DEFAULT NULL,
old_value blob,
new_value blob,
viewed tinyint(1) DEFAULT NULL,
created_at datetime DEFAULT NULL,
updated_at datetime DEFAULT NULL,
deleted_at datetime DEFAULT NULL,
PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

ALTER TABLE `clients` ADD COLUMN `allow_promotions` int(1) UNSIGNED NULL DEFAULT 0 AFTER `login_code`;
ALTER TABLE `companies_services` ADD COLUMN `priority` int(11) UNSIGNED NOT NULL DEFAULT 0 AFTER `pck_id`;

CREATE TABLE `timetables_vacations` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`companies_user_id` int(11) NOT NULL,
`vacation_date` datetime NOT NULL,
`vacation_type` int(1) unsigned NOT NULL,
`approved` int(1) unsigned NOT NULL DEFAULT 0,
`has_appointments` int(1) unsigned NOT NULL DEFAULT 0,
`inherit_cu_id` int(1) unsigned NOT NULL DEFAULT 0,
`created_at` datetime NOT NULL,
`updated_at` datetime DEFAULT NULL,
`deleted_at` datetime DEFAULT NULL,
PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

CREATE TABLE `announcements` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`text` text NOT NULL,
`show_until` timestamp NULL DEFAULT NULL,
`active` tinyint(4) DEFAULT 1,
`created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
`updated_at` timestamp NULL DEFAULT NULL,
`deleted_at` timestamp NULL DEFAULT NULL,
PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

ALTER TABLE `clients` ADD COLUMN `allow_confirmation_sms` int(1) UNSIGNED NULL DEFAULT 1 AFTER `blacklist`;
ALTER TABLE `clients` ADD COLUMN `allow_reminder_sms` int(1) UNSIGNED NULL DEFAULT 1 AFTER `allow_confirmation_sms`;
ALTER TABLE `companies` ADD COLUMN `sms_confirmation_assistant` int(1) UNSIGNED DEFAULT 0 AFTER `sms_active`;
ALTER TABLE `announcements` ADD COLUMN `internal` int(1) DEFAULT 1 AFTER `active`;
ALTER TABLE `timetables` ADD COLUMN `waiting_list` int(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '0 // normal 1 // waiting list' AFTER `online`;

CREATE TABLE `companies_events` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `companies_user_id` int(11) NOT NULL,
  `spots` int(11) NOT NULL,
  `date` date DEFAULT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `price` double(17,2) DEFAULT NULL,
  `its_full` int(1) unsigned NOT NULL DEFAULT 0,
  `occupation` int(11) unsigned NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

CREATE TABLE `companies_events_timetables` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `companies_event_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `time` time NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;
