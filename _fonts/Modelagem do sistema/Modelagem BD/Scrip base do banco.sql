-- MySQL Script generated by MySQL Workbench
-- Dom 18 Mar 2018 21:23:47 -03
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`SGA_aluno`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`SGA_aluno` (
  `idSGA_aluno` INT NOT NULL AUTO_INCREMENT,
  `SGA_aluno_nome` VARCHAR(100) NOT NULL,
  `SGA_aluno_matricula` VARCHAR(45) NOT NULL,
  `SGA_aluno_email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idSGA_aluno`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`SGA_instituicao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`SGA_instituicao` (
  `idSGA_instituicao` INT NOT NULL AUTO_INCREMENT,
  `SGA_instituicao_nomeFantasia` VARCHAR(100) NOT NULL,
  `SGA_instituicao_cnpj` INT(14) NOT NULL,
  `SGA_instituicao_telfixo` INT(10) NULL,
  `SGA_instituicao_celular` INT(11) NULL,
  `SGA_instituicao_email` VARCHAR(100) NULL,
  PRIMARY KEY (`idSGA_instituicao`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`SGA_admin_instituicao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`SGA_admin_instituicao` (
  `idSGA_admin_instituicao` INT NOT NULL AUTO_INCREMENT,
  `SGA_admin_instituicao_nome` VARCHAR(100) NOT NULL,
  `SGA_admin_instituicao_email` VARCHAR(100) NOT NULL,
  `SGA_admin_instituicao_pass` VARCHAR(156) NOT NULL,
  `SGA_instituicao_idSGA_instituicao` INT NOT NULL,
  PRIMARY KEY (`idSGA_admin_instituicao`),
  INDEX `fk_SGA_admin_instituicao_SGA_instituicao_idx` (`SGA_instituicao_idSGA_instituicao` ASC),
  CONSTRAINT `fk_SGA_admin_instituicao_SGA_instituicao`
    FOREIGN KEY (`SGA_instituicao_idSGA_instituicao`)
    REFERENCES `mydb`.`SGA_instituicao` (`idSGA_instituicao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`SGA_instituicao_professor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`SGA_instituicao_professor` (
)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`SGA_propaganda_cursoHome`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`SGA_propaganda_cursoHome` (
  `idSGA_propaganda_cursoHome` INT NOT NULL AUTO_INCREMENT,
  `SGA_propaganda_cursoHom_sobre` VARCHAR(200) NOT NULL,
  `SGA_propaganda_cursoHome_valor` VARCHAR(45) NOT NULL,
  `SGA_propaganda_cursoHome_dateInc` DATE NOT NULL,
  `SGA_propaganda_cursoHome_dateFim` DATE NOT NULL,
  `SGA_propaganda_cursoHome_img` VARCHAR(50) NULL,
  `SGA_admin_instituicao_idSGA_admin_instituicao` INT NOT NULL,
  `SGA_instituicao_idSGA_instituicao` INT NOT NULL,
  PRIMARY KEY (`idSGA_propaganda_cursoHome`),
  INDEX `fk_SGA_propaganda_cursoHome_SGA_admin_instituicao1_idx` (`SGA_admin_instituicao_idSGA_admin_instituicao` ASC),
  INDEX `fk_SGA_propaganda_cursoHome_SGA_instituicao1_idx` (`SGA_instituicao_idSGA_instituicao` ASC),
  CONSTRAINT `fk_SGA_propaganda_cursoHome_SGA_admin_instituicao1`
    FOREIGN KEY (`SGA_admin_instituicao_idSGA_admin_instituicao`)
    REFERENCES `mydb`.`SGA_admin_instituicao` (`idSGA_admin_instituicao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_SGA_propaganda_cursoHome_SGA_instituicao1`
    FOREIGN KEY (`SGA_instituicao_idSGA_instituicao`)
    REFERENCES `mydb`.`SGA_instituicao` (`idSGA_instituicao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`SGA_cursos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`SGA_cursos` (
  `idSGA_cursos` INT NOT NULL AUTO_INCREMENT,
  `SGA_cursos_nome` VARCHAR(100) NOT NULL,
  `SGA_cursos_duracao` VARCHAR(45) NULL,
  `SGA_instituicao_idSGA_instituicao` INT NOT NULL,
  PRIMARY KEY (`idSGA_cursos`),
  INDEX `fk_SGA_cursos_SGA_instituicao1_idx` (`SGA_instituicao_idSGA_instituicao` ASC),
  CONSTRAINT `fk_SGA_cursos_SGA_instituicao1`
    FOREIGN KEY (`SGA_instituicao_idSGA_instituicao`)
    REFERENCES `mydb`.`SGA_instituicao` (`idSGA_instituicao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`SGA_slide_home`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`SGA_slide_home` (
  `idSGA_slide_home` INT NOT NULL AUTO_INCREMENT,
  `SGA_slide_home_titulo` VARCHAR(100) NULL,
  `SGA_slide_home_msg` VARCHAR(100) NULL,
  `SGA_slide_home_img` VARCHAR(100) NOT NULL,
  `SGA_admin_instituicao_idSGA_admin_instituicao` INT NOT NULL,
  PRIMARY KEY (`idSGA_slide_home`, `SGA_admin_instituicao_idSGA_admin_instituicao`),
  INDEX `fk_SGA_slide_home_SGA_admin_instituicao1_idx` (`SGA_admin_instituicao_idSGA_admin_instituicao` ASC),
  CONSTRAINT `fk_SGA_slide_home_SGA_admin_instituicao1`
    FOREIGN KEY (`SGA_admin_instituicao_idSGA_admin_instituicao`)
    REFERENCES `mydb`.`SGA_admin_instituicao` (`idSGA_admin_instituicao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
