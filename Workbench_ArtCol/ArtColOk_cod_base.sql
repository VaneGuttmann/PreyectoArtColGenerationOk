-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema ArtCol_ok
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema ArtCol_ok
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ArtCol_ok` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema artcol_ok
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema artcol_ok
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `artcol_ok` DEFAULT CHARACTER SET utf8mb3 ;
USE `ArtCol_ok` ;

-- -----------------------------------------------------
-- Table `ArtCol_ok`.`Usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ArtCol_ok`.`Usuario` (
  `idUsuarios` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NOT NULL,
  `Email` VARCHAR(45) NOT NULL,
  `Contraseña` VARCHAR(45) NOT NULL,
  `Rol` VARCHAR(45) NOT NULL,
  `Fecha_creacion` DATETIME(1) NOT NULL,
  `Ultima_modificacion` DATETIME(1) NOT NULL,
  PRIMARY KEY (`idUsuarios`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ArtCol_ok`.`Lista_reproduccion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ArtCol_ok`.`Lista_reproduccion` (
  `idLista_reproduccion` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NOT NULL,
  `id_peliculas` INT NOT NULL,
  `Usuario_idUsuarios` INT NOT NULL,
  PRIMARY KEY (`idLista_reproduccion`, `Usuario_idUsuarios`),
  INDEX `fk_Lista_reproduccion_Usuario_idx` (`Usuario_idUsuarios` ASC) VISIBLE,
  CONSTRAINT `fk_Lista_reproduccion_Usuario`
    FOREIGN KEY (`Usuario_idUsuarios`)
    REFERENCES `ArtCol_ok`.`Usuario` (`idUsuarios`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ArtCol_ok`.`Categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ArtCol_ok`.`Categoria` (
  `idCategoria` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NOT NULL,
  `id_pelicula` INT NOT NULL,
  PRIMARY KEY (`idCategoria`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ArtCol_ok`.`Pelicula`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ArtCol_ok`.`Pelicula` (
  `idPelicula` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NOT NULL,
  `Descripcion` VARCHAR(200) NOT NULL,
  `Año` INT NOT NULL,
  `Duracion` TIME NOT NULL,
  `Reparto` VARCHAR(45) NOT NULL,
  `Director` VARCHAR(45) NOT NULL,
  `id_lista` INT NOT NULL,
  `Lista_reproduccion_idLista_reproduccion` INT NOT NULL,
  `Lista_reproduccion_Usuario_idUsuarios` INT NOT NULL,
  `Categoria_idCategoria` INT NOT NULL,
  PRIMARY KEY (`idPelicula`, `Lista_reproduccion_idLista_reproduccion`, `Lista_reproduccion_Usuario_idUsuarios`, `Categoria_idCategoria`),
  INDEX `fk_Pelicula_Lista_reproduccion1_idx` (`Lista_reproduccion_idLista_reproduccion` ASC, `Lista_reproduccion_Usuario_idUsuarios` ASC) VISIBLE,
  INDEX `fk_Pelicula_Categoria1_idx` (`Categoria_idCategoria` ASC) VISIBLE,
  CONSTRAINT `fk_Pelicula_Lista_reproduccion1`
    FOREIGN KEY (`Lista_reproduccion_idLista_reproduccion` , `Lista_reproduccion_Usuario_idUsuarios`)
    REFERENCES `ArtCol_ok`.`Lista_reproduccion` (`idLista_reproduccion` , `Usuario_idUsuarios`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pelicula_Categoria1`
    FOREIGN KEY (`Categoria_idCategoria`)
    REFERENCES `ArtCol_ok`.`Categoria` (`idCategoria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `artcol_ok` ;

-- -----------------------------------------------------
-- Table `artcol_ok`.`categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `artcol_ok`.`categoria` (
  `idCategoria` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NOT NULL,
  `id_pelicula` INT NOT NULL,
  PRIMARY KEY (`idCategoria`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `artcol_ok`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `artcol_ok`.`usuario` (
  `idUsuarios` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NOT NULL,
  `Email` VARCHAR(45) NOT NULL,
  `Contraseña` VARCHAR(45) NOT NULL,
  `Rol` VARCHAR(45) NOT NULL,
  `Fecha_creacion` DATETIME(1) NOT NULL,
  `Ultima_modificacion` DATETIME(1) NOT NULL,
  PRIMARY KEY (`idUsuarios`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `artcol_ok`.`lista_reproduccion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `artcol_ok`.`lista_reproduccion` (
  `idLista_reproduccion` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NOT NULL,
  `id_peliculas` INT NOT NULL,
  `id_usuario` INT NOT NULL,
  `Usuario_idUsuarios` INT NOT NULL,
  PRIMARY KEY (`idLista_reproduccion`, `Usuario_idUsuarios`),
  INDEX `fk_Lista_reproduccion_Usuario_idx` (`Usuario_idUsuarios` ASC) VISIBLE,
  CONSTRAINT `fk_Lista_reproduccion_Usuario`
    FOREIGN KEY (`Usuario_idUsuarios`)
    REFERENCES `artcol_ok`.`usuario` (`idUsuarios`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `artcol_ok`.`pelicula`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `artcol_ok`.`pelicula` (
  `idPelicula` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NOT NULL,
  `Descripcion` VARCHAR(200) NOT NULL,
  `Año` INT NOT NULL,
  `Duracion` TIME NOT NULL,
  `Reparto` VARCHAR(45) NOT NULL,
  `Director` VARCHAR(45) NOT NULL,
  `id_lista` INT NOT NULL,
  `Lista_reproduccion_idLista_reproduccion` INT NOT NULL,
  `Lista_reproduccion_Usuario_idUsuarios` INT NOT NULL,
  `Categoria_idCategoria` INT NOT NULL,
  PRIMARY KEY (`idPelicula`, `Lista_reproduccion_idLista_reproduccion`, `Lista_reproduccion_Usuario_idUsuarios`, `Categoria_idCategoria`),
  INDEX `fk_Pelicula_Lista_reproduccion1_idx` (`Lista_reproduccion_idLista_reproduccion` ASC, `Lista_reproduccion_Usuario_idUsuarios` ASC) VISIBLE,
  INDEX `fk_Pelicula_Categoria1_idx` (`Categoria_idCategoria` ASC) VISIBLE,
  CONSTRAINT `fk_Pelicula_Categoria1`
    FOREIGN KEY (`Categoria_idCategoria`)
    REFERENCES `artcol_ok`.`categoria` (`idCategoria`),
  CONSTRAINT `fk_Pelicula_Lista_reproduccion1`
    FOREIGN KEY (`Lista_reproduccion_idLista_reproduccion` , `Lista_reproduccion_Usuario_idUsuarios`)
    REFERENCES `artcol_ok`.`lista_reproduccion` (`idLista_reproduccion` , `Usuario_idUsuarios`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
