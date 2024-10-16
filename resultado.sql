-- ---
-- Globals
-- ---

-- SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
-- SET FOREIGN_KEY_CHECKS=0;

-- ---
-- Table 'sensor'
-- 
-- ---

DROP TABLE IF EXISTS `sensor`;
		
CREATE TABLE `sensor` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `tipo_sensor` VARCHAR NULL DEFAULT NULL,
  `id_campo` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'leituraSensor'
-- 
-- ---

DROP TABLE IF EXISTS `leituraSensor`;
		
CREATE TABLE `leituraSensor` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `id_sensor` INTEGER NULL DEFAULT NULL,
  `data_hora` DATETIME NULL DEFAULT NULL,
  `valor` INTEGER NULL DEFAULT NULL,
  `unidade` VARCHAR NULL DEFAULT NULL COMMENT 'unidades de pH, mg/kg',
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'campo'
-- 
-- ---

DROP TABLE IF EXISTS `campo`;
		
CREATE TABLE `campo` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `nome_campo` VARCHAR NULL DEFAULT NULL,
  `tamanho_area` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'ajuste'
-- 
-- ---

DROP TABLE IF EXISTS `ajuste`;
		
CREATE TABLE `ajuste` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `id_campo` INTEGER NULL DEFAULT NULL,
  `data_hora` DATETIME NULL DEFAULT NULL COMMENT 'Data e Hora do ajuste',
  `tipo_ajuste` VARCHAR NULL DEFAULT NULL COMMENT 'ex: irrigação, fertilização',
  `quantidade_aplicada` INTEGER NULL DEFAULT NULL,
  `unidade` VARCHAR NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'dadoHistorico'
-- 
-- ---

DROP TABLE IF EXISTS `dadoHistorico`;
		
CREATE TABLE `dadoHistorico` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `id_cultura` INTEGER NULL DEFAULT NULL,
  `dado` VARCHAR NULL DEFAULT NULL COMMENT 'ex: rendimento médio',
  `valor` DECIMAL NULL DEFAULT NULL,
  `ano` YEAR NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'cultura'
-- 
-- ---

DROP TABLE IF EXISTS `cultura`;
		
CREATE TABLE `cultura` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `tipo_cultura` VARCHAR NULL DEFAULT NULL,
  `data_plantio` DATE NULL DEFAULT NULL,
  `data_colheita` DATE NULL DEFAULT NULL,
  `id_campo` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Foreign Keys 
-- ---

ALTER TABLE `sensor` ADD FOREIGN KEY (id_campo) REFERENCES `campo` (`id`);
ALTER TABLE `leituraSensor` ADD FOREIGN KEY (id_sensor) REFERENCES `sensor` (`id`);
ALTER TABLE `ajuste` ADD FOREIGN KEY (id_campo) REFERENCES `campo` (`id`);
ALTER TABLE `dadoHistorico` ADD FOREIGN KEY (id_cultura) REFERENCES `cultura` (`id`);
ALTER TABLE `cultura` ADD FOREIGN KEY (id_campo) REFERENCES `campo` (`id`);

-- ---
-- Table Properties
-- ---

-- ALTER TABLE `sensor` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `leituraSensor` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `campo` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `ajuste` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `dadoHistorico` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `cultura` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ---
-- Test Data
-- ---

-- INSERT INTO `sensor` (`id`,`tipo_sensor`,`id_campo`) VALUES
-- ('','','');
-- INSERT INTO `leituraSensor` (`id`,`id_sensor`,`data_hora`,`valor`,`unidade`) VALUES
-- ('','','','','');
-- INSERT INTO `campo` (`id`,`nome_campo`,`tamanho_area`) VALUES
-- ('','','');
-- INSERT INTO `ajuste` (`id`,`id_campo`,`data_hora`,`tipo_ajuste`,`quantidade_aplicada`,`unidade`) VALUES
-- ('','','','','','');
-- INSERT INTO `dadoHistorico` (`id`,`id_cultura`,`dado`,`valor`,`ano`) VALUES
-- ('','','','','');
-- INSERT INTO `cultura` (`id`,`tipo_cultura`,`data_plantio`,`data_colheita`,`id_campo`) VALUES
-- ('','','','','');