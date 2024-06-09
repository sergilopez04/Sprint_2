-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`table1`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`table1` (
)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Clients`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Clients` (
  `id_client` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(100) NULL,
  `cognoms` VARCHAR(300) NULL,
  `carrer` VARCHAR(300) NULL,
  `numero` SMALLINT(40) NULL,
  `pis` SMALLINT(20) NULL,
  `porta` SMALLINT(20) NULL,
  `ciutat` VARCHAR(200) NULL,
  `codiPostal` SMALLINT(5) NULL,
  `provincia` VARCHAR(200) NULL,
  `telefon` SMALLINT(10) NULL,
  PRIMARY KEY (`id_client`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Nom`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Nom` (
  `idNom` INT NOT NULL,
  `nom` VARCHAR(45) NULL,
  PRIMARY KEY (`idNom`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Botigues`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Botigues` (
  `id_botiga` INT NOT NULL AUTO_INCREMENT,
  `carrer` VARCHAR(300) NULL,
  `numero` SMALLINT(40) NULL,
  `pis` SMALLINT(20) NULL,
  `porta` SMALLINT(20) NULL,
  `ciutat` VARCHAR(200) NULL,
  `codiPostal` SMALLINT(5) NULL,
  `provincia` VARCHAR(200) NULL,
  PRIMARY KEY (`id_botiga`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`table2Emp`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`table2Emp` (
)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`t`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`t` (
)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Empleats`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Empleats` (
  `id_empleat` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(100) NULL,
  `cognoms` VARCHAR(300) NULL,
  `nif` VARCHAR(9) NULL,
  `telefon` SMALLINT(15) NULL,
  `posicio` VARCHAR(150) NULL,
  `botigues_id` INT NOT NULL,
  PRIMARY KEY (`id_empleat`, `botigues_id`),
  INDEX `fk_Empleats_Botigues_idx` (`botigues_id` ASC) VISIBLE,
  CONSTRAINT `fk_Empleats_Botigues`
    FOREIGN KEY (`botigues_id`)
    REFERENCES `mydb`.`Botigues` (`id_botiga`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Categories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Categories` (
  `id_categories` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(300) NULL,
  PRIMARY KEY (`id_categories`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Productes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Productes` (
  `id_productes` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(300) NULL,
  `descripcio` TEXT(700) NULL,
  `imatge` VARCHAR(300) NULL,
  `preu` DECIMAL(10,2) NULL,
  `Categories_id` INT NOT NULL,
  PRIMARY KEY (`id_productes`, `Categories_id`),
  INDEX `fk_Productes_Categories1_idx` (`Categories_id` ASC) VISIBLE,
  CONSTRAINT `fk_Productes_Categories1`
    FOREIGN KEY (`Categories_id`)
    REFERENCES `mydb`.`Categories` (`id_categories`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Comandes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Comandes` (
  `id_comandes` INT NOT NULL AUTO_INCREMENT,
  `dataHora` DATETIME NULL DEFAULT getdate(),
  `TipusComanda` ENUM("repartiment", "recollida") NULL,
  `preuTotal` DECIMAL(10,2) NULL,
  `Clients_id` INT NOT NULL,
  `Botigues_id` INT NOT NULL,
  `Empleats_id` INT NOT NULL,
  `Repartidors_id` INT NOT NULL,
  PRIMARY KEY (`id_comandes`, `Clients_id`, `Botigues_id`, `Empleats_id`, `Repartidors_id`),
  INDEX `fk_Comandes_Clients1_idx` (`Clients_id` ASC) VISIBLE,
  INDEX `fk_Comandes_Botigues1_idx` (`Botigues_id` ASC) VISIBLE,
  INDEX `fk_Comandes_Empleats1_idx` (`Empleats_id` ASC, `Repartidors_id` ASC) VISIBLE,
  CONSTRAINT `fk_Comandes_Clients1`
    FOREIGN KEY (`Clients_id`)
    REFERENCES `mydb`.`Clients` (`id_client`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Comandes_Botigues1`
    FOREIGN KEY (`Botigues_id`)
    REFERENCES `mydb`.`Botigues` (`id_botiga`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Comandes_Empleats1`
    FOREIGN KEY (`Empleats_id` , `Repartidors_id`)
    REFERENCES `mydb`.`Empleats` (`id_empleat` , `botigues_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Detalls_Comandes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Detalls_Comandes` (
  `id_detall` INT NOT NULL AUTO_INCREMENT,
  `quantitat` VARCHAR(45) NULL,
  `Productes_id` INT NOT NULL,
  `Comandes_id` INT NOT NULL,
  PRIMARY KEY (`id_detall`, `Productes_id`, `Comandes_id`),
  INDEX `fk_Detalls_Comandes_Productes1_idx` (`Productes_id` ASC) VISIBLE,
  INDEX `fk_Detalls_Comandes_Comandes1_idx` (`Comandes_id` ASC) VISIBLE,
  CONSTRAINT `fk_Detalls_Comandes_Productes1`
    FOREIGN KEY (`Productes_id`)
    REFERENCES `mydb`.`Productes` (`id_productes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Detalls_Comandes_Comandes1`
    FOREIGN KEY (`Comandes_id`)
    REFERENCES `mydb`.`Comandes` (`id_comandes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Comandes_has_Categories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Comandes_has_Categories` (
  `Comandes_id_comandes` INT NOT NULL,
  `Categories_id_categories` INT NOT NULL,
  PRIMARY KEY (`Comandes_id_comandes`, `Categories_id_categories`),
  INDEX `fk_Comandes_has_Categories_Categories1_idx` (`Categories_id_categories` ASC) VISIBLE,
  INDEX `fk_Comandes_has_Categories_Comandes1_idx` (`Comandes_id_comandes` ASC) VISIBLE,
  CONSTRAINT `fk_Comandes_has_Categories_Comandes1`
    FOREIGN KEY (`Comandes_id_comandes`)
    REFERENCES `mydb`.`Comandes` (`id_comandes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Comandes_has_Categories_Categories1`
    FOREIGN KEY (`Categories_id_categories`)
    REFERENCES `mydb`.`Categories` (`id_categories`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
