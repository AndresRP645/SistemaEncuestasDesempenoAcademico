CREATE DATABASE CorrelacionEstadistica;
USE CorrelacionEstadistica;

CREATE TABLE `alumnos` (
  `id` int(10) UNSIGNED NOT NULL,
  `No_Cuenta` int(10) UNSIGNED DEFAULT NULL,
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Nombre_Completo` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `desempeñoDocente` (
  `id_res` int(10) UNSIGNED NOT NULL,
  `id_alumno` int(10) UNSIGNED DEFAULT NULL,
  `Pregunta_1` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Pregunta_2` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Pregunta_3` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Pregunta_4` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Pregunta_5` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Pregunta_6` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Pregunta_7` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Pregunta_8` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Pregunta_9` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `desempeñoEstudiantil` (
  `id_res` int(10) UNSIGNED NOT NULL,
  `id_alumno` int(10) UNSIGNED DEFAULT NULL,
  `Pregunta_10` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Pregunta_11` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Pregunta_12` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Pregunta_13` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Pregunta_14` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Pregunta_15` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Pregunta_16` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Pregunta_17` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Pregunta_18` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Pregunta_19` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `identidadInstitucional` (
  `id_res` int(10) UNSIGNED NOT NULL,
  `id_alumno` int(10) UNSIGNED DEFAULT NULL,
  `Pregunta_20` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Pregunta_21` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


ALTER TABLE `alumnos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `No_Cuenta` (`No_Cuenta`);


ALTER TABLE `desempeñoDocente`
  ADD PRIMARY KEY (`id_res`),
  ADD KEY `id_alumno` (`id_alumno`);


ALTER TABLE `desempeñoEstudiantil`
  ADD PRIMARY KEY (`id_res`),
  ADD KEY `id_alumno` (`id_alumno`);


ALTER TABLE `identidadInstitucional`
  ADD PRIMARY KEY (`id_res`),
  ADD KEY `id_alumno` (`id_alumno`);


ALTER TABLE `alumnos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=536;

ALTER TABLE `desempeñoDocente`
  MODIFY `id_res` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=519;

ALTER TABLE `desempeñoEstudiantil`
  MODIFY `id_res` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=517;

ALTER TABLE `identidadInstitucional`
  MODIFY `id_res` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=517;

ALTER TABLE `desempeñoDocente`
  ADD CONSTRAINT `desempeñoDocente_ibfk_1` FOREIGN KEY (`id_alumno`) REFERENCES `alumnos` (`id`);

ALTER TABLE `desempeñoEstudiantil`
  ADD CONSTRAINT `desempeñoEstudiantil_ibfk_1` FOREIGN KEY (`id_alumno`) REFERENCES `alumnos` (`id`);

ALTER TABLE `identidadInstitucional`
  ADD CONSTRAINT `identidadInstitucional_ibfk_1` FOREIGN KEY (`id_alumno`) REFERENCES `alumnos` (`id`);
COMMIT;