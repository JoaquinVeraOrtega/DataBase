-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Portfolio
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Portfolio
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Portfolio` DEFAULT CHARACTER SET utf8 ;
USE `Portfolio` ;

-- -----------------------------------------------------
-- Table `Portfolio`.`Persona`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Portfolio`.`Persona` (
  `idPersona` INT NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `Apellido` VARCHAR(45) NOT NULL,
  `Fecha De Nacimiento` DATE NULL,
  `Acerca de` VARCHAR(200) NULL,
  `Email` VARCHAR(45) NULL,
  PRIMARY KEY (`idPersona`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Portfolio`.`Proyectos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Portfolio`.`Proyectos` (
  `idProyectos` INT NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `Cliente` VARCHAR(45) NOT NULL,
  `Persona_idPersona` INT NOT NULL,
  PRIMARY KEY (`idProyectos`, `Persona_idPersona`),
  INDEX `fk_Proyectos_Persona_idx` (`Persona_idPersona` ASC) VISIBLE,
  CONSTRAINT `fk_Proyectos_Persona`
    FOREIGN KEY (`Persona_idPersona`)
    REFERENCES `Portfolio`.`Persona` (`idPersona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Portfolio`.`Experiencia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Portfolio`.`Experiencia` (
  `idExperiencia` INT NOT NULL,
  `Empresa` VARCHAR(45) NOT NULL,
  `Puesto` VARCHAR(45) NOT NULL,
  `FechaDesde` DATE NOT NULL,
  `FechaHasta` DATE NULL,
  `Persona_idPersona` INT NOT NULL,
  PRIMARY KEY (`idExperiencia`, `Persona_idPersona`),
  INDEX `fk_Experiencia_Persona1_idx` (`Persona_idPersona` ASC) VISIBLE,
  CONSTRAINT `fk_Experiencia_Persona1`
    FOREIGN KEY (`Persona_idPersona`)
    REFERENCES `Portfolio`.`Persona` (`idPersona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Portfolio`.`Educacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Portfolio`.`Educacion` (
  `idEducacion` INT NOT NULL,
  `Institucion` VARCHAR(45) NOT NULL,
  `Titulo` VARCHAR(45) NOT NULL,
  `FechaIngreso` DATE NOT NULL,
  `FechaEgreso` DATE NULL,
  `Persona_idPersona` INT NOT NULL,
  PRIMARY KEY (`idEducacion`, `Persona_idPersona`),
  INDEX `fk_Educacion_Persona1_idx` (`Persona_idPersona` ASC) VISIBLE,
  CONSTRAINT `fk_Educacion_Persona1`
    FOREIGN KEY (`Persona_idPersona`)
    REFERENCES `Portfolio`.`Persona` (`idPersona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Portfolio`.`Tecnologias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Portfolio`.`Tecnologias` (
  `idSkills` INT NOT NULL,
  `Tecnologia/idioma` VARCHAR(45) NOT NULL,
  `Porcentaje` INT NOT NULL,
  `Persona_idPersona` INT NOT NULL,
  PRIMARY KEY (`idSkills`, `Persona_idPersona`),
  INDEX `fk_Tecnologias_Persona1_idx` (`Persona_idPersona` ASC) VISIBLE,
  CONSTRAINT `fk_Tecnologias_Persona1`
    FOREIGN KEY (`Persona_idPersona`)
    REFERENCES `Portfolio`.`Persona` (`idPersona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Portfolio`.`User`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Portfolio`.`User` (
  `idUser` INT NOT NULL,
  `Username` VARCHAR(45) NOT NULL,
  `Password` VARCHAR(45) NOT NULL,
  `Persona_idPersona` INT NOT NULL,
  PRIMARY KEY (`idUser`, `Persona_idPersona`),
  INDEX `fk_User_Persona1_idx` (`Persona_idPersona` ASC) VISIBLE,
  CONSTRAINT `fk_User_Persona1`
    FOREIGN KEY (`Persona_idPersona`)
    REFERENCES `Portfolio`.`Persona` (`idPersona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
