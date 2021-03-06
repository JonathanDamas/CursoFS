-- MySQL Script generated by MySQL Workbench
-- Mon May 21 15:05:32 2018
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema Cadastro
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Cadastro
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Cadastro` DEFAULT CHARACTER SET utf8 ;
USE `Cadastro` ;

-- -----------------------------------------------------
-- Table `Cadastro`.`pessoas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Cadastro`.`pessoas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NULL,
  `nascimento` DATE NULL,
  `cargo` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Cadastro`.`projetos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Cadastro`.`projetos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NULL,
  `dono_id` INT NOT NULL,
  `gerente_id` INT NOT NULL,
  PRIMARY KEY (`id`, `dono_id`, `gerente_id`),
  INDEX `fk_projetos_pessoas_idx` (`dono_id` ASC),
  INDEX `fk_projetos_pessoas1_idx` (`gerente_id` ASC),
  CONSTRAINT `fk_dono`
    FOREIGN KEY (`dono_id`)
    REFERENCES `Cadastro`.`pessoas` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_gerente`
    FOREIGN KEY (`gerente_id`)
    REFERENCES `Cadastro`.`pessoas` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
