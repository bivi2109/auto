SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

CREATE SCHEMA IF NOT EXISTS `auto` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ;

USE `auto`;

CREATE  TABLE IF NOT EXISTS `auto`.`ads` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT ,
  `brand_id` INT(10) UNSIGNED NOT NULL ,
  `make_id` INT(10) UNSIGNED NOT NULL ,
  `description` TEXT NOT NULL ,
  `rating` INT(11) NOT NULL DEFAULT 0 ,
  `created` DATETIME NOT NULL ,
  `updated` DATETIME NOT NULL ,
  `header` VARCHAR(255) NOT NULL ,
  `price` INT(10) UNSIGNED NOT NULL ,
  `mileage` INT(10) UNSIGNED NOT NULL ,
  `city_id` INT(10) UNSIGNED NOT NULL ,
  `owner_id` INT(10) UNSIGNED NOT NULL ,
  `transmission_id` INT(10) UNSIGNED NOT NULL ,
  `body_style_id` INT(10) UNSIGNED NOT NULL ,
  `color_id` INT(10) UNSIGNED NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_ads_brand_id_vehicle_brands` (`brand_id` ASC) ,
  INDEX `fk_ads_make_id_vehicle_make` (`make_id` ASC) ,
  INDEX `fk_ads_owner_id_users` (`owner_id` ASC) ,
  INDEX `fk_ads_transmission_id_vehicle_transmission` (`transmission_id` ASC) ,
  INDEX `fk_ads_body_style_id_body_style` (`body_style_id` ASC) ,
  INDEX `fk_ads_color_id_color` (`color_id` ASC) ,
  INDEX `fk_ads_city_id_cities` (`city_id` ASC) ,
  CONSTRAINT `fk_ads_brand_id_vehicle_brands`
    FOREIGN KEY (`brand_id` )
    REFERENCES `auto`.`vehicle_brands` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ads_make_id_vehicle_make`
    FOREIGN KEY (`make_id` )
    REFERENCES `auto`.`vehicle_make` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ads_owner_id_users`
    FOREIGN KEY (`owner_id` )
    REFERENCES `auto`.`users` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ads_transmission_id_vehicle_transmission`
    FOREIGN KEY (`transmission_id` )
    REFERENCES `auto`.`vehicle_transmission` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ads_body_style_id_body_style`
    FOREIGN KEY (`body_style_id` )
    REFERENCES `auto`.`body_styles` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ads_color_id_color`
    FOREIGN KEY (`color_id` )
    REFERENCES `auto`.`colors` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ads_city_id_cities`
    FOREIGN KEY (`city_id` )
    REFERENCES `auto`.`cities` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;

CREATE  TABLE IF NOT EXISTS `auto`.`vehicle_brands` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT ,
  `title` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `un_vehicle_brands_title` (`title` ASC) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;

CREATE  TABLE IF NOT EXISTS `auto`.`vehicle_make` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT ,
  `brand_id` INT(10) UNSIGNED NOT NULL ,
  `title` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `un_vehicle_make_brand_id_title` (`brand_id` ASC, `title` ASC) ,
  INDEX `fk_vehicle_make_brand_id_vehicle_brand` (`brand_id` ASC) ,
  CONSTRAINT `fk_vehicle_make_brand_id_vehicle_brand`
    FOREIGN KEY (`brand_id` )
    REFERENCES `auto`.`vehicle_brands` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;

CREATE  TABLE IF NOT EXISTS `auto`.`users` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(45) NOT NULL ,
  `display_name` VARCHAR(45) NOT NULL ,
  `email` VARCHAR(255) NOT NULL ,
  `password` CHAR(60) NOT NULL ,
  `created` DATETIME NOT NULL ,
  `updated` DATETIME NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;

CREATE  TABLE IF NOT EXISTS `auto`.`vehicle_transmission` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT ,
  `title` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;

CREATE  TABLE IF NOT EXISTS `auto`.`body_styles` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT ,
  `title` VARCHAR(45) NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;

CREATE  TABLE IF NOT EXISTS `auto`.`colors` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT ,
  `title` VARCHAR(45) NOT NULL ,
  `hash` CHAR(6) NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;

CREATE  TABLE IF NOT EXISTS `auto`.`comments` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT ,
  `content` TEXT NOT NULL ,
  `ads_id` INT(10) UNSIGNED NOT NULL ,
  `created` DATETIME NOT NULL ,
  `updated` DATETIME NOT NULL ,
  `user_id` INT(10) UNSIGNED NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_comments_ads_id_ads` (`ads_id` ASC) ,
  INDEX `fk_comments_user_id_users` (`user_id` ASC) ,
  CONSTRAINT `fk_comments_ads_id_ads`
    FOREIGN KEY (`ads_id` )
    REFERENCES `auto`.`ads` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_comments_user_id_users`
    FOREIGN KEY (`user_id` )
    REFERENCES `auto`.`users` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;

CREATE  TABLE IF NOT EXISTS `auto`.`cities` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT ,
  `title` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
