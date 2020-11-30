-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema fabrica_picoles
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema fabrica_picoles
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `fabrica_picoles` ;
USE `fabrica_picoles` ;

-- -----------------------------------------------------
-- Table `fabrica_picoles`.`sabores`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `fabrica_picoles`.`sabores` ;

CREATE TABLE IF NOT EXISTS `fabrica_picoles`.`sabores` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `fabrica_picoles`.`tipos_embalagem`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `fabrica_picoles`.`tipos_embalagem` ;

CREATE TABLE IF NOT EXISTS `fabrica_picoles`.`tipos_embalagem` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `fabrica_picoles`.`tipos_picole`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `fabrica_picoles`.`tipos_picole` ;

CREATE TABLE IF NOT EXISTS `fabrica_picoles`.`tipos_picole` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `fabrica_picoles`.`picoles`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `fabrica_picoles`.`picoles` ;

CREATE TABLE IF NOT EXISTS `fabrica_picoles`.`picoles` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `preco` DECIMAL(8,2) NOT NULL,
  `id_sabor` INT NOT NULL,
  `id_tipo_embalagem` INT NOT NULL,
  `id_tipo_picole` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_picoles_1_idx` (`id_sabor` ASC),
  INDEX `fk_picoles_2_idx` (`id_tipo_embalagem` ASC),
  INDEX `fk_picoles_3_idx` (`id_tipo_picole` ASC),
  CONSTRAINT `fk_picoles_1`
    FOREIGN KEY (`id_sabor`)
    REFERENCES `fabrica_picoles`.`sabores` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_picoles_2`
    FOREIGN KEY (`id_tipo_embalagem`)
    REFERENCES `fabrica_picoles`.`tipos_embalagem` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_picoles_3`
    FOREIGN KEY (`id_tipo_picole`)
    REFERENCES `fabrica_picoles`.`tipos_picole` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `fabrica_picoles`.`ingredientes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `fabrica_picoles`.`ingredientes` ;

CREATE TABLE IF NOT EXISTS `fabrica_picoles`.`ingredientes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `fabrica_picoles`.`ingredientes_picole`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `fabrica_picoles`.`ingredientes_picole` ;

CREATE TABLE IF NOT EXISTS `fabrica_picoles`.`ingredientes_picole` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_ingrediente` INT NOT NULL,
  `id_picole` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_ingredientes_picole_1_idx` (`id_ingrediente` ASC),
  INDEX `fk_ingredientes_picole_2_idx` (`id_picole` ASC),
  CONSTRAINT `fk_ingredientes_picole_1`
    FOREIGN KEY (`id_ingrediente`)
    REFERENCES `fabrica_picoles`.`ingredientes` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ingredientes_picole_2`
    FOREIGN KEY (`id_picole`)
    REFERENCES `fabrica_picoles`.`picoles` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `fabrica_picoles`.`aditivos_nutritivos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `fabrica_picoles`.`aditivos_nutritivos` ;

CREATE TABLE IF NOT EXISTS `fabrica_picoles`.`aditivos_nutritivos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `formula_quimica` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `fabrica_picoles`.`aditivos_nutritivos_picole`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `fabrica_picoles`.`aditivos_nutritivos_picole` ;

CREATE TABLE IF NOT EXISTS `fabrica_picoles`.`aditivos_nutritivos_picole` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_aditivo_nutritivo` INT NOT NULL,
  `id_picole` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_aditivos_nutritivos_picole_1_idx` (`id_aditivo_nutritivo` ASC),
  INDEX `fk_aditivos_nutritivos_picole_2_idx` (`id_picole` ASC),
  CONSTRAINT `fk_aditivos_nutritivos_picole_1`
    FOREIGN KEY (`id_aditivo_nutritivo`)
    REFERENCES `fabrica_picoles`.`aditivos_nutritivos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_aditivos_nutritivos_picole_2`
    FOREIGN KEY (`id_picole`)
    REFERENCES `fabrica_picoles`.`picoles` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `fabrica_picoles`.`conservantes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `fabrica_picoles`.`conservantes` ;

CREATE TABLE IF NOT EXISTS `fabrica_picoles`.`conservantes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `descricao` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `fabrica_picoles`.`conservantes_picoles`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `fabrica_picoles`.`conservantes_picoles` ;

CREATE TABLE IF NOT EXISTS `fabrica_picoles`.`conservantes_picoles` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_conservante` INT NOT NULL,
  `id_picole` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_conservantes_picoles_1_idx` (`id_conservante` ASC),
  INDEX `fk_conservantes_picoles_2_idx` (`id_picole` ASC),
  CONSTRAINT `fk_conservantes_picoles_1`
    FOREIGN KEY (`id_conservante`)
    REFERENCES `fabrica_picoles`.`conservantes` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_conservantes_picoles_2`
    FOREIGN KEY (`id_picole`)
    REFERENCES `fabrica_picoles`.`picoles` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `fabrica_picoles`.`lotes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `fabrica_picoles`.`lotes` ;

CREATE TABLE IF NOT EXISTS `fabrica_picoles`.`lotes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_tipo_picole` INT NOT NULL,
  `quantidade` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_lotes_1_idx` (`id_tipo_picole` ASC),
  CONSTRAINT `fk_lotes_1`
    FOREIGN KEY (`id_tipo_picole`)
    REFERENCES `fabrica_picoles`.`tipos_picole` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `fabrica_picoles`.`revendedores`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `fabrica_picoles`.`revendedores` ;

CREATE TABLE IF NOT EXISTS `fabrica_picoles`.`revendedores` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `cnpj` VARCHAR(45) NOT NULL,
  `razao_social` VARCHAR(100) NOT NULL,
  `contato` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `fabrica_picoles`.`notas_fiscais`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `fabrica_picoles`.`notas_fiscais` ;

CREATE TABLE IF NOT EXISTS `fabrica_picoles`.`notas_fiscais` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `data` DATE NOT NULL,
  `valor` DECIMAL(8,2) NOT NULL,
  `numero_serie` VARCHAR(45) NOT NULL,
  `descricao` VARCHAR(200) NOT NULL,
  `id_revendedor` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_notas_fiscais_1_idx` (`id_revendedor` ASC),
  CONSTRAINT `fk_notas_fiscais_1`
    FOREIGN KEY (`id_revendedor`)
    REFERENCES `fabrica_picoles`.`revendedores` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `fabrica_picoles`.`lotes_nota_fiscal`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `fabrica_picoles`.`lotes_nota_fiscal` ;

CREATE TABLE IF NOT EXISTS `fabrica_picoles`.`lotes_nota_fiscal` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_lote` INT NOT NULL,
  `id_nota_fiscal` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_lotes_nota_fiscal_1_idx` (`id_lote` ASC),
  INDEX `fk_lotes_nota_fiscal_2_idx` (`id_nota_fiscal` ASC),
  CONSTRAINT `fk_lotes_nota_fiscal_1`
    FOREIGN KEY (`id_lote`)
    REFERENCES `fabrica_picoles`.`lotes` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_lotes_nota_fiscal_2`
    FOREIGN KEY (`id_nota_fiscal`)
    REFERENCES `fabrica_picoles`.`notas_fiscais` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
