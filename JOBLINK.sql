-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `mydb` ;

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
SHOW WARNINGS;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `user` (
  `id_user` INT NOT NULL,
  `f_user` VARCHAR(45) NULL,
  `i_user` VARCHAR(45) NULL,
  `o_user` VARCHAR(45) NULL,
  `gender_user` VARCHAR(1) NULL,
  PRIMARY KEY (`id_user`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `privilege`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `privilege` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `privilege` (
  `id_privilege` INT NOT NULL,
  `name_privilege` VARCHAR(45) NULL,
  PRIMARY KEY (`id_privilege`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `role`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `role` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `role` (
  `id_role` INT NOT NULL,
  `name_role` VARCHAR(45) NULL,
  `privilege_id_privilege` INT NOT NULL,
  PRIMARY KEY (`id_role`, `privilege_id_privilege`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `groups`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `groups` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `groups` (
  `id_groups` INT NOT NULL,
  `name_groups` VARCHAR(45) NULL,
  PRIMARY KEY (`id_groups`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `tasks`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tasks` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `tasks` (
  `id_tasks` INT NOT NULL,
  `name_tasks` VARCHAR(45) NULL,
  `date_start` DATE NULL,
  `date_end` DATE NULL,
  `time_start` TIME NULL,
  `time_end` TIME NULL,
  `responsible_user_task` INT NULL,
  `status_task` VARCHAR(20) NULL,
  PRIMARY KEY (`id_tasks`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `auth`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `auth` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `auth` (
  `id_auth` INT NOT NULL,
  `log_auth` VARCHAR(45) NULL,
  `pass_auth` VARCHAR(45) NULL,
  `user_id_user` INT NOT NULL,
  PRIMARY KEY (`id_auth`, `user_id_user`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `groups_and_tasks`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `groups_and_tasks` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `groups_and_tasks` (
  `id_groups_and_tasks` INT NOT NULL,
  `tasks_id_tasks` INT NOT NULL,
  `groups_id_groups` INT NOT NULL,
  PRIMARY KEY (`id_groups_and_tasks`, `tasks_id_tasks`, `groups_id_groups`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `user_has_role`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user_has_role` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `user_has_role` (
  `role_id_role` INT NOT NULL,
  `user_id_user` INT NOT NULL,
  PRIMARY KEY (`role_id_role`, `user_id_user`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `user_and_groups`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user_and_groups` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `user_and_groups` (
  `user_id_user` INT NOT NULL,
  `groups_id_groups` INT NOT NULL,
  PRIMARY KEY (`user_id_user`, `groups_id_groups`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `user_has_tasks`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user_has_tasks` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `user_has_tasks` (
  `user_id_user` INT NOT NULL,
  `tasks_id_tasks` INT NOT NULL,
  PRIMARY KEY (`user_id_user`, `tasks_id_tasks`))
ENGINE = InnoDB;

SHOW WARNINGS;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
