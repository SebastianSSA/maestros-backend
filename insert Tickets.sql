use db_tickets_apirest;

INSERT INTO seg_usuario (id, username, password, enabled, nombre, apellido, email) VALUES (1, 'sebas','$2a$10$CYW8sTnRy6foRBX9ty2r.u8lkJOnaeZVPApBw5En.6Oj6WKHTkc1u',1,'Sebastian','Saavedra','ssavedra@gmail.com');
INSERT INTO seg_usuario (id, username, password, enabled, nombre, apellido, email) VALUES (2, 'admin','$2a$10$AP748R095nmBpl985rMhV.LlTGmBQKL1c4i2SohxXnj.opXrd4JiC',1,'Super','Admin','admin@admin.com');

INSERT INTO seg_rol (id, nombre) VALUES (1,'ROLE_USER');
INSERT INTO seg_rol (id, nombre) VALUES (2,'ROLE_ADMIN');

INSERT INTO seg_usuario_seg_rol (seg_usuario_id, seg_rol_id) VALUES (1,1);
INSERT INTO seg_usuario_seg_rol (seg_usuario_id, seg_rol_id) VALUES (2,1);
INSERT INTO seg_usuario_seg_rol (seg_usuario_id, seg_rol_id) VALUES (2,2);

INSERT INTO cfg_tabla_auxiliar(cod_tabla_auxiliar,nombre,observacion,id_usuario_crea,fecha_crea) VALUES ('ESTGRL','ESTADO GENERAL','',1,NOW());
INSERT INTO cfg_tabla_auxiliar(cod_tabla_auxiliar,nombre,observacion,id_usuario_crea,fecha_crea) VALUES ('ESTCIV','ESTADO CIVIL','',1,NOW());
INSERT INTO cfg_tabla_auxiliar(cod_tabla_auxiliar,nombre,observacion,id_usuario_crea,fecha_crea) VALUES ('TIPCON','TIPO CONTRATO','',1,NOW());
INSERT INTO cfg_tabla_auxiliar(cod_tabla_auxiliar,nombre,observacion,id_usuario_crea,fecha_crea) VALUES ('TIPDID','TIPO DOCUMENTO DE IDENTIDAD','',1,NOW());
INSERT INTO cfg_tabla_auxiliar(cod_tabla_auxiliar,nombre,observacion,id_usuario_crea,fecha_crea) VALUES ('TIPSEX','TIPO SEXO','',1,NOW());

INSERT INTO cfg_tabla_auxiliar_detalle(id,cod_tabla_auxiliar,nombre,abreviatura,valor,observacion,id_usuario_crea,fecha_crea) VALUES (0,'ESTGRL','INACTIVO','','','',1,NOW());
INSERT INTO cfg_tabla_auxiliar_detalle(id,cod_tabla_auxiliar,nombre,abreviatura,valor,observacion,id_usuario_crea,fecha_crea) VALUES (1,'ESTGRL','ACTIVO','','','',1,NOW());

INSERT INTO cfg_tabla_auxiliar_detalle(id,cod_tabla_auxiliar,nombre,abreviatura,valor,observacion,id_usuario_crea,fecha_crea) VALUES (1,'ESTCIV','SOLTERO','','','',1,NOW());
INSERT INTO cfg_tabla_auxiliar_detalle(id,cod_tabla_auxiliar,nombre,abreviatura,valor,observacion,id_usuario_crea,fecha_crea) VALUES (2,'ESTCIV','CASADO','','','',1,NOW());
INSERT INTO cfg_tabla_auxiliar_detalle(id,cod_tabla_auxiliar,nombre,abreviatura,valor,observacion,id_usuario_crea,fecha_crea) VALUES (3,'ESTCIV','VIUDO','','','',1,NOW());
INSERT INTO cfg_tabla_auxiliar_detalle(id,cod_tabla_auxiliar,nombre,abreviatura,valor,observacion,id_usuario_crea,fecha_crea) VALUES (4,'ESTCIV','CONVIVIENTE','','','',1,NOW());

INSERT INTO cfg_tabla_auxiliar_detalle(id,cod_tabla_auxiliar,nombre,abreviatura,valor,observacion,id_usuario_crea,fecha_crea) VALUES (1,'TIPCON','TIEMPO PARCIAL','','','',1,NOW());
INSERT INTO cfg_tabla_auxiliar_detalle(id,cod_tabla_auxiliar,nombre,abreviatura,valor,observacion,id_usuario_crea,fecha_crea) VALUES (2,'TIPCON','TIEMPO COMPLETO','','','',1,NOW());
INSERT INTO cfg_tabla_auxiliar_detalle(id,cod_tabla_auxiliar,nombre,abreviatura,valor,observacion,id_usuario_crea,fecha_crea) VALUES (3,'TIPCON','DESTAJO','','','',1,NOW());

INSERT INTO cfg_tabla_auxiliar_detalle(id,cod_tabla_auxiliar,nombre,abreviatura,valor,observacion,id_usuario_crea,fecha_crea) VALUES (1,'TIPDID','DNI','DNI','','',1,NOW());
INSERT INTO cfg_tabla_auxiliar_detalle(id,cod_tabla_auxiliar,nombre,abreviatura,valor,observacion,id_usuario_crea,fecha_crea) VALUES (2,'TIPDID','RUC','RUC','','',1,NOW());
INSERT INTO cfg_tabla_auxiliar_detalle(id,cod_tabla_auxiliar,nombre,abreviatura,valor,observacion,id_usuario_crea,fecha_crea) VALUES (3,'TIPDID','CARNET EXT','CE','','',1,NOW());

INSERT INTO cfg_tabla_auxiliar_detalle(id,cod_tabla_auxiliar,nombre,abreviatura,valor,observacion,id_usuario_crea,fecha_crea) VALUES (1,'TIPSEX','MASCULINO','M','','',1,NOW());
INSERT INTO cfg_tabla_auxiliar_detalle(id,cod_tabla_auxiliar,nombre,abreviatura,valor,observacion,id_usuario_crea,fecha_crea) VALUES (2,'TIPSEX','FEMENINO','S','','',1,NOW());

INSERT INTO mae_empresa(id,ruc,razon_social,nombre_comercial,abreviatura,direccion_fiscal,telefono_1,telefono_2, correo,url_web,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (1,'20101759688','MyM REPUESTOS Y SERVICIOS S.A.','MYM REPUESTOS Y SERVICIOS S.A.','MYM','AV. NICOLAS ARRIOLA NRO. 1723 - LA VICTORIA','6131500','','VENTAS@MYM.COM.PE','WWW.MYM.COM.PE','ESTGRL',1,1, NOW());

INSERT INTO mae_local(id,empresa_id,nombre,abreviatura,nro_pisos,direccion,telefono_1,telefono_2,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (1,1,'ARRIOLA 14','N. ARR. 14',2,'AV. NICOLAS ARRIOLA 1473 - LA VICTORIA - LIMA','6131526','','','ESTGRL',1,1, NOW());
INSERT INTO mae_local(id,empresa_id,nombre,abreviatura,nro_pisos,direccion,telefono_1,telefono_2,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (2,1,'ARRIOLA 15','N. ARR. 15',2,'AV. NICOLAS ARRIOLA 1551 - LA VICTORIA - LIMA','6131522','','','ESTGRL',1,1, NOW());
INSERT INTO mae_local(id,empresa_id,nombre,abreviatura,nro_pisos,direccion,telefono_1,telefono_2,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (3,1,'ARRIOLA 17','N. ARR. 17',4,'AV. NICOLAS ARRIOLA 1723 - LA VICTORIA - LIMA','6131500','','','ESTGRL',1,1, NOW());
INSERT INTO mae_local(id,empresa_id,nombre,abreviatura,nro_pisos,direccion,telefono_1,telefono_2,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (4,1,'TAPICEROS','TAPICEROS',1,'CAL. TAPICEROS 280 - ATE - LIMA','975347905','','','ESTGRL',1,1, NOW());
INSERT INTO mae_local(id,empresa_id,nombre,abreviatura,nro_pisos,direccion,telefono_1,telefono_2,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (5,1,'SANTA ANITA','STA. ANITA',2,'STA. ANITA','','','','ESTGRL',1,1, NOW());
INSERT INTO mae_local(id,empresa_id,nombre,abreviatura,nro_pisos,direccion,telefono_1,telefono_2,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (6,1,'LOS OLIVOS','OLIVOS',1,'AV. ALFREDO MENDIOLA 4159 / 4163 - LOS OLIVOS','6131530','','','ESTGRL',1,1, NOW());
INSERT INTO mae_local(id,empresa_id,nombre,abreviatura,nro_pisos,direccion,telefono_1,telefono_2,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (7,1,'ATE','ATE',2,'AV. NICOLAS AYLLON 3238 - ATE VITARTE','6131527','','','ESTGRL',1,1, NOW());

INSERT INTO mae_cargo(id,descripcion,abreviatura,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (1, 'ADMINISTRADOR SISTEMAS', 'SIS', '','ESTGRL',1,1, NOW());
INSERT INTO mae_cargo(id,descripcion,abreviatura,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (2, 'CHOFER', 'CHOFER', '','ESTGRL',1,1, NOW());
INSERT INTO mae_cargo(id,descripcion,abreviatura,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (3, 'ALMACENERO', 'ALMACENERO', '','ESTGRL',1,1, NOW());
INSERT INTO mae_cargo(id,descripcion,abreviatura,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (4, 'AUXILIAR DE LIMPIEZA', 'AUX LIMP', '','ESTGRL',1,1, NOW());
INSERT INTO mae_cargo(id,descripcion,abreviatura,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (5, 'MOTORIZADO', 'MOTORIZADO', '','ESTGRL',1,1, NOW());
INSERT INTO mae_cargo(id,descripcion,abreviatura,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (6, 'AUXILIAR DE MANTENIMIENTO', 'AUX MNTO', '','ESTGRL',1,1, NOW());
INSERT INTO mae_cargo(id,descripcion,abreviatura,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (7, 'AGENTE DE SEGURIDAD', 'AGENTE SEG', '','ESTGRL',1,1, NOW());
INSERT INTO mae_cargo(id,descripcion,abreviatura,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (8, 'AUXILIAR DE COCINA', 'AUX COCINA', '','ESTGRL',1,1, NOW());
INSERT INTO mae_cargo(id,descripcion,abreviatura,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (9, 'ABOGADA', 'ABOGADA', '','ESTGRL',1,1, NOW());
INSERT INTO mae_cargo(id,descripcion,abreviatura,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (10, 'ANALISTA BUSSINES INTELLIGENCE', 'ANA. BI', '','ESTGRL',1,1, NOW());
INSERT INTO mae_cargo(id,descripcion,abreviatura,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (11, 'ANALISTA CONTABLE', 'ANA. CONTA', '','ESTGRL',1,1, NOW());
INSERT INTO mae_cargo(id,descripcion,abreviatura,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (12, 'ANALISTA DE CD', 'ANA. DE CD', '','ESTGRL',1,1, NOW());
INSERT INTO mae_cargo(id,descripcion,abreviatura,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (13, 'ANALISTA DE COBRANZAS', 'ANA. DE CO', '','ESTGRL',1,1, NOW());
INSERT INTO mae_cargo(id,descripcion,abreviatura,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (14, 'ANALISTA DE COSTOS', 'ANA. DE CO', '','ESTGRL',1,1, NOW());
INSERT INTO mae_cargo(id,descripcion,abreviatura,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (15, 'ANALISTA DE CREDITOS Y COBRANZAS', 'ANA. C. CO', '','ESTGRL',1,1, NOW());
INSERT INTO mae_cargo(id,descripcion,abreviatura,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (16, 'ANALISTA DE DESARROLLO DE PRODUCTO', 'ANA. DES P', '','ESTGRL',1,1, NOW());
INSERT INTO mae_cargo(id,descripcion,abreviatura,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (17, 'ANALISTA DE PRICING', 'ANA. PRICI', '','ESTGRL',1,1, NOW());
INSERT INTO mae_cargo(id,descripcion,abreviatura,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (18, 'ANALISTA DE PROCESOS', 'ANA. PROCE', '','ESTGRL',1,1, NOW());
INSERT INTO mae_cargo(id,descripcion,abreviatura,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (19, 'ANALISTA DE SERVICIOS GENERALES', 'ANA. SER.G', '','ESTGRL',1,1, NOW());
INSERT INTO mae_cargo(id,descripcion,abreviatura,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (20, 'ANALISTA PROGRAMADOR', 'ANA. PROGR', '','ESTGRL',1,1, NOW());
INSERT INTO mae_cargo(id,descripcion,abreviatura,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (21, 'ANALISTA SENIOR DE COSTOS', 'ANA. SEN.C', '','ESTGRL',1,1, NOW());
INSERT INTO mae_cargo(id,descripcion,abreviatura,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (22, 'ANALISTA SENIOR DE REMUNERACIONES', 'AN. SEN.RE', '','ESTGRL',1,1, NOW());
INSERT INTO mae_cargo(id,descripcion,abreviatura,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (23, 'ASESOR LEGAL', 'ASE. LEGAL', '','ESTGRL',1,1, NOW());
INSERT INTO mae_cargo(id,descripcion,abreviatura,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (24, 'ASESOR TECNICO DE LUBRICANTE', 'ASE. TECLU', '','ESTGRL',1,1, NOW());
INSERT INTO mae_cargo(id,descripcion,abreviatura,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (25, 'ASESOR TECNICO DE MERCEDES BENZ', 'ASE. TECMB', '','ESTGRL',1,1, NOW());
INSERT INTO mae_cargo(id,descripcion,abreviatura,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (26, 'ASESOR TECNICO POST VENTA', 'ASE. TECPV', '','ESTGRL',1,1, NOW());
INSERT INTO mae_cargo(id,descripcion,abreviatura,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (27, 'ASISTENTA SOCIAL', 'ASIS. SOCI', '','ESTGRL',1,1, NOW());
INSERT INTO mae_cargo(id,descripcion,abreviatura,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (28, 'ASISTENTE CONTABLE', 'ASIS. CONT', '','ESTGRL',1,1, NOW());
INSERT INTO mae_cargo(id,descripcion,abreviatura,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (29, 'ASISTENTE DE  COBRANZAS', 'ASIS. COBR', '','ESTGRL',1,1, NOW());
INSERT INTO mae_cargo(id,descripcion,abreviatura,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (30, 'ASISTENTE DE COCINA', 'ASIS. COCI', '','ESTGRL',1,1, NOW());
INSERT INTO mae_cargo(id,descripcion,abreviatura,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (31, 'ASISTENTE DE COSTOS', 'ASIS. COST', '','ESTGRL',1,1, NOW());
INSERT INTO mae_cargo(id,descripcion,abreviatura,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (32, 'ASISTENTE DE CREDITOS', 'ASIS. CRED', '','ESTGRL',1,1, NOW());
INSERT INTO mae_cargo(id,descripcion,abreviatura,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (33, 'ASISTENTE DE DESARROLLO DE PRODUCTO', 'ASIS. DESP', '','ESTGRL',1,1, NOW());
INSERT INTO mae_cargo(id,descripcion,abreviatura,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (34, 'ASISTENTE DE GERENCIA', 'ASIS. GERE', '','ESTGRL',1,1, NOW());
INSERT INTO mae_cargo(id,descripcion,abreviatura,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (35, 'ASISTENTE DE LOGISTICA', 'ASIS. LOGI', '','ESTGRL',1,1, NOW());
INSERT INTO mae_cargo(id,descripcion,abreviatura,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (36, 'ASISTENTE DE POST VENTA', 'ASIS. P.VE', '','ESTGRL',1,1, NOW());
INSERT INTO mae_cargo(id,descripcion,abreviatura,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (37, 'ASISTENTE DE TESORERIA', 'ASIS. TESO', '','ESTGRL',1,1, NOW());
INSERT INTO mae_cargo(id,descripcion,abreviatura,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (38, 'ASISTENTE DE VENTAS', 'ASIS. VENT', '','ESTGRL',1,1, NOW());
INSERT INTO mae_cargo(id,descripcion,abreviatura,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (39, 'ASISTENTE HELP DESK', 'ASIS. H.DE', '','ESTGRL',1,1, NOW());
INSERT INTO mae_cargo(id,descripcion,abreviatura,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (40, 'ASISTENTE LEGAL', 'ASIS. LEGA', '','ESTGRL',1,1, NOW());
INSERT INTO mae_cargo(id,descripcion,abreviatura,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (41, 'AUDITOR DE INVENTARIO', 'AUDIT. INV', '','ESTGRL',1,1, NOW());
INSERT INTO mae_cargo(id,descripcion,abreviatura,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (42, 'AUXILIAR ADMINISTRATIVO', 'AUX. ADMI', '','ESTGRL',1,1, NOW());
INSERT INTO mae_cargo(id,descripcion,abreviatura,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (43, 'AUXILIAR DE ALMACE', 'AUX. ALMAC', '','ESTGRL',1,1, NOW());
INSERT INTO mae_cargo(id,descripcion,abreviatura,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (44, 'AUXILIAR DE CONTABILIDAD', 'AUX. CONTA', '','ESTGRL',1,1, NOW());
INSERT INTO mae_cargo(id,descripcion,abreviatura,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (45, 'AUXILIAR DE DISTRIBUCIO', 'AUX. DISTR', '','ESTGRL',1,1, NOW());
INSERT INTO mae_cargo(id,descripcion,abreviatura,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (46, 'AUXILIAR DE INFRAESTRUCTURA', 'AUX. INFRA', '','ESTGRL',1,1, NOW());
INSERT INTO mae_cargo(id,descripcion,abreviatura,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (47, 'AUXILIAR DE INVENTARIOS', 'AUX. INVE', '','ESTGRL',1,1, NOW());
INSERT INTO mae_cargo(id,descripcion,abreviatura,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (48, 'AUXILIAR DE PICKING', 'AUX. PICKI', '','ESTGRL',1,1, NOW());
INSERT INTO mae_cargo(id,descripcion,abreviatura,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (49, 'AUXILIAR DE RR.HH.', 'AUX. RRHH', '','ESTGRL',1,1, NOW());
INSERT INTO mae_cargo(id,descripcion,abreviatura,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (50, 'CAJERA', 'CAJERA', '','ESTGRL',1,1, NOW());
INSERT INTO mae_cargo(id,descripcion,abreviatura,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (51, 'COORDINADOR DE CD Y ALMACENES', 'COOR.CD.AL', '','ESTGRL',1,1, NOW());
INSERT INTO mae_cargo(id,descripcion,abreviatura,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (52, 'COORDINADOR DE FINANZAS', 'COOR. FI', '','ESTGRL',1,1, NOW());
INSERT INTO mae_cargo(id,descripcion,abreviatura,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (53, 'COORDINADOR DE INTELIGENCIA DE MERCADO Y PRODUCTO', 'COOR.INT.M', '','ESTGRL',1,1, NOW());
INSERT INTO mae_cargo(id,descripcion,abreviatura,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (54, 'COORDINADOR DE MARKETING', 'COOR.MARKE', '','ESTGRL',1,1, NOW());
INSERT INTO mae_cargo(id,descripcion,abreviatura,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (55, 'COORDINADOR DE PROCESOS', 'COOR.PROCE', '','ESTGRL',1,1, NOW());
INSERT INTO mae_cargo(id,descripcion,abreviatura,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (56, 'COORDINADOR DE SERVICIOS GENERALES', 'COOR.SER.G', '','ESTGRL',1,1, NOW());
INSERT INTO mae_cargo(id,descripcion,abreviatura,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (57, 'COORDINADOR GENERAL', 'COOR. GEN.', '','ESTGRL',1,1, NOW());
INSERT INTO mae_cargo(id,descripcion,abreviatura,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (58, 'DESARROLLO DE SOFTWARE', 'DESA. SOFT', '','ESTGRL',1,1, NOW());
INSERT INTO mae_cargo(id,descripcion,abreviatura,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (59, 'EJECUTIVO DE VENTAS', 'EJE. VENTA', '','ESTGRL',1,1, NOW());
INSERT INTO mae_cargo(id,descripcion,abreviatura,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (60, 'ENCARGADO DE ALMACE', 'ENC. ALMAC', '','ESTGRL',1,1, NOW());
INSERT INTO mae_cargo(id,descripcion,abreviatura,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (61, 'ENCARGADO DE RECEPCION Y ALMACE', 'ENC. R.ALM', '','ESTGRL',1,1, NOW());
INSERT INTO mae_cargo(id,descripcion,abreviatura,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (62, 'ENCARGADO DE TIENDA', 'ENC. TIEND', '','ESTGRL',1,1, NOW());
INSERT INTO mae_cargo(id,descripcion,abreviatura,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (63, 'GERENTE COMERCIAL', 'GER. COMER', '','ESTGRL',1,1, NOW());
INSERT INTO mae_cargo(id,descripcion,abreviatura,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (64, 'GERENTE DE ADMINISTRACION Y FINANZAS', 'GER. ADFI', '','ESTGRL',1,1, NOW());
INSERT INTO mae_cargo(id,descripcion,abreviatura,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (65, 'GERENTE DE LOGISTICA', 'GER. LOGIS', '','ESTGRL',1,1, NOW());
INSERT INTO mae_cargo(id,descripcion,abreviatura,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (66, 'GESTOR ADMINISTRATIVO', 'GEST. ADMI', '','ESTGRL',1,1, NOW());
INSERT INTO mae_cargo(id,descripcion,abreviatura,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (67, 'GESTOR DE COBRANZAS', 'GEST. COBR', '','ESTGRL',1,1, NOW());
INSERT INTO mae_cargo(id,descripcion,abreviatura,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (68, 'GESTOR DE PROYECTOS', 'GEST. PROY', '','ESTGRL',1,1, NOW());
INSERT INTO mae_cargo(id,descripcion,abreviatura,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (69, 'INGENIERO DE PROCESOS', 'ING. PROCE', '','ESTGRL',1,1, NOW());
INSERT INTO mae_cargo(id,descripcion,abreviatura,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (70, 'INGENIERO DE TI', 'ING. TI', '','ESTGRL',1,1, NOW());
INSERT INTO mae_cargo(id,descripcion,abreviatura,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (71, 'INGENIERO PROGRAMADOR', 'ING. PROGR', '','ESTGRL',1,1, NOW());
INSERT INTO mae_cargo(id,descripcion,abreviatura,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (72, 'JEDE DE CD Y ALMACENES', 'JEFE CDALM', '','ESTGRL',1,1, NOW());
INSERT INTO mae_cargo(id,descripcion,abreviatura,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (73, 'JEFE COMERCIAL', 'JEFE COMER', '','ESTGRL',1,1, NOW());
INSERT INTO mae_cargo(id,descripcion,abreviatura,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (74, 'JEFE DE CONTABILIDAD', 'JEFE CONT', '','ESTGRL',1,1, NOW());
INSERT INTO mae_cargo(id,descripcion,abreviatura,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (75, 'JEFE DE CREDITOS Y COBRANZAS', 'JEFE C COB', '','ESTGRL',1,1, NOW());
INSERT INTO mae_cargo(id,descripcion,abreviatura,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (76, 'JEFE DE LOGISTICA', 'JEFE LOGIS', '','ESTGRL',1,1, NOW());
INSERT INTO mae_cargo(id,descripcion,abreviatura,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (77, 'JEFE DE RECURSOS HUMANOS', 'JEFE RRHH', '','ESTGRL',1,1, NOW());
INSERT INTO mae_cargo(id,descripcion,abreviatura,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (78, 'MAQUINISTA', 'MAQUINISTA', '','ESTGRL',1,1, NOW());
INSERT INTO mae_cargo(id,descripcion,abreviatura,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (79, 'PRESIDENTE DIRECTORIO', 'PRESI. DIR', '','ESTGRL',1,1, NOW());
INSERT INTO mae_cargo(id,descripcion,abreviatura,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (80, 'RECEPCIONISTA', 'RECEPCION', '','ESTGRL',1,1, NOW());
INSERT INTO mae_cargo(id,descripcion,abreviatura,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (81, 'RESPONSABLE DE COCINA', 'RESP. COCI', '','ESTGRL',1,1, NOW());
INSERT INTO mae_cargo(id,descripcion,abreviatura,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (82, 'SUB GERENTE DE ADMINISTRACION Y FINANZAS', 'SGE.AD FI', '','ESTGRL',1,1, NOW());
INSERT INTO mae_cargo(id,descripcion,abreviatura,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (83, 'SUPERVISOR DE ALMACE', 'SUP. ALMAC', '','ESTGRL',1,1, NOW());
INSERT INTO mae_cargo(id,descripcion,abreviatura,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (84, 'SUPERVISOR DE CONTROL DE CALIDAD', 'SUP.C. CAL', '','ESTGRL',1,1, NOW());
INSERT INTO mae_cargo(id,descripcion,abreviatura,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (85, 'SUPERVISOR DE INFRAESTRUCTURA', 'SUP. INFRA', '','ESTGRL',1,1, NOW());
INSERT INTO mae_cargo(id,descripcion,abreviatura,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (86, 'SUPERVISOR DE INVENTARIO', 'SUP. INVE', '','ESTGRL',1,1, NOW());
INSERT INTO mae_cargo(id,descripcion,abreviatura,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (87, 'SUPERVISOR DE SEGURIDAD', 'SUP. SEGUR', '','ESTGRL',1,1, NOW());
INSERT INTO mae_cargo(id,descripcion,abreviatura,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (88, 'SUPERVISOR DE VENTAS', 'SUP. VENTA', '','ESTGRL',1,1, NOW());
INSERT INTO mae_cargo(id,descripcion,abreviatura,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (89, 'TESORERO', 'TESORERO', '','ESTGRL',1,1, NOW());
INSERT INTO mae_cargo(id,descripcion,abreviatura,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (90, 'PRACTICANTE DE OPERACIONES', 'PRC OPE', '','ESTGRL',1,1, NOW());

INSERT INTO mae_centro_costo(id,codigo,descripcion,abreviatura,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (1, '110', 'GERENCIA GENERAL', 'GER-GEN', '', 'ESTGRL',1,1, NOW());
INSERT INTO mae_centro_costo(id,codigo,descripcion,abreviatura,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (2, '120', 'RECEPCION', 'RECEPCION', '', 'ESTGRL',1,1, NOW());
INSERT INTO mae_centro_costo(id,codigo,descripcion,abreviatura,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (3, '310', 'TECNOLOGIA DE LA INFORMACION', 'TEC-INFORMACION', '', 'ESTGRL',1,1, NOW());
INSERT INTO mae_centro_costo(id,codigo,descripcion,abreviatura,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (4, '320', 'INGENIERIA DE PROCESOS', 'ING-PROCESOS', '', 'ESTGRL',1,1, NOW());
INSERT INTO mae_centro_costo(id,codigo,descripcion,abreviatura,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (5, '410', 'GERENCIA DE ADMINISTRACION Y FINANZAS', 'GER-ADMIN-FINAN', '', 'ESTGRL',1,1, NOW());
INSERT INTO mae_centro_costo(id,codigo,descripcion,abreviatura,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (6, '420', 'CONTABILIDAD', 'CONTABILIDAD', '', 'ESTGRL',1,1, NOW());
INSERT INTO mae_centro_costo(id,codigo,descripcion,abreviatura,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (7, '430', 'FINANZAS', 'FINANZAS', '', 'ESTGRL',1,1, NOW());
INSERT INTO mae_centro_costo(id,codigo,descripcion,abreviatura,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (8, '431', 'TESORERIA', 'TESORERIA', '', 'ESTGRL',1,1, NOW());
INSERT INTO mae_centro_costo(id,codigo,descripcion,abreviatura,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (9, '440', 'CREDITOS Y COBRANZAS', 'CREDITOS Y COBR', '', 'ESTGRL',1,1, NOW());
INSERT INTO mae_centro_costo(id,codigo,descripcion,abreviatura,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (10, '450', 'RECURSOS HUMANOS', 'RRHH', '', 'ESTGRL',1,1, NOW());
INSERT INTO mae_centro_costo(id,codigo,descripcion,abreviatura,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (11, '451', 'BIENESTAR SOCIAL', 'BIEN SOCIAL', '', 'ESTGRL',1,1, NOW());
INSERT INTO mae_centro_costo(id,codigo,descripcion,abreviatura,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (12, '452', 'COMPENSACIONES', 'COMPENSACIONES', '', 'ESTGRL',1,1, NOW());
INSERT INTO mae_centro_costo(id,codigo,descripcion,abreviatura,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (13, '460', 'SERVICIOS GENERALES', 'SSGG', '', 'ESTGRL',1,1, NOW());
INSERT INTO mae_centro_costo(id,codigo,descripcion,abreviatura,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (14, '461', 'COCINA', 'COCINA', '', 'ESTGRL',1,1, NOW());
INSERT INTO mae_centro_costo(id,codigo,descripcion,abreviatura,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (15, '462', 'LIMPIEZA', 'LIMPIEZA', '', 'ESTGRL',1,1, NOW());
INSERT INTO mae_centro_costo(id,codigo,descripcion,abreviatura,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (16, '463', 'SEGURIDAD', 'SEGURIDAD', '', 'ESTGRL',1,1, NOW());
INSERT INTO mae_centro_costo(id,codigo,descripcion,abreviatura,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (17, '464', 'SEGURIDAD Y SALUD EN EL TRABAJO', 'SEG-SALUD-TRABA', '', 'ESTGRL',1,1, NOW());
INSERT INTO mae_centro_costo(id,codigo,descripcion,abreviatura,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (18, '470', 'LEGAL', 'LEGAL', '', 'ESTGRL',1,1, NOW());
INSERT INTO mae_centro_costo(id,codigo,descripcion,abreviatura,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (19, '480', 'SOPORTE INTEGRAL', 'SOP-INTEGRAL', '', 'ESTGRL',1,1, NOW());
INSERT INTO mae_centro_costo(id,codigo,descripcion,abreviatura,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (20, '501', 'IMPORTACIONES', 'IMPORTACIONES', '', 'ESTGRL',1,1, NOW());
INSERT INTO mae_centro_costo(id,codigo,descripcion,abreviatura,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (21, '502', 'COMPRAS NACIONALES', 'COMPRAS NACIONA', '', 'ESTGRL',1,1, NOW());
INSERT INTO mae_centro_costo(id,codigo,descripcion,abreviatura,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (22, '510', 'SOPORTE DE ALMACENES Y CD', 'SOP-ALM-Y-CD', '', 'ESTGRL',1,1, NOW());
INSERT INTO mae_centro_costo(id,codigo,descripcion,abreviatura,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (23, '511', 'INVENTARIOS', 'INVENTARIOS', '', 'ESTGRL',1,1, NOW());
INSERT INTO mae_centro_costo(id,codigo,descripcion,abreviatura,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (24, '512', 'CD - CENTRO DE ALMACENAMIENTO', 'CD-CENTRO ALM', '', 'ESTGRL',1,1, NOW());
INSERT INTO mae_centro_costo(id,codigo,descripcion,abreviatura,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (25, '513', 'EQUIPOS Y HERRAMIENTAS', 'EQUIP-HERRA', '', 'ESTGRL',1,1, NOW());
INSERT INTO mae_centro_costo(id,codigo,descripcion,abreviatura,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (26, '514', 'ALMACENEROS Y MAQUINISTAS', 'ALM-Y-MAQUINIS', '', 'ESTGRL',1,1, NOW());
INSERT INTO mae_centro_costo(id,codigo,descripcion,abreviatura,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (27, '520', 'CD - SOPORTE PARA DESPACHO Y DISTRIBUCION', 'CD-SOP-DES-DIS', '', 'ESTGRL',1,1, NOW());
INSERT INTO mae_centro_costo(id,codigo,descripcion,abreviatura,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (28, '521', 'CD - CENTRO DE DISTRIBUCION', 'CD-CENTRO-DISTR', '', 'ESTGRL',1,1, NOW());
INSERT INTO mae_centro_costo(id,codigo,descripcion,abreviatura,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (29, '522', 'CD - PICKING', 'CD-PICKING', '', 'ESTGRL',1,1, NOW());
INSERT INTO mae_centro_costo(id,codigo,descripcion,abreviatura,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (30, '523', 'CD - DESPACHO', 'CD-DESPACHO', '', 'ESTGRL',1,1, NOW());
INSERT INTO mae_centro_costo(id,codigo,descripcion,abreviatura,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (31, '524', 'CD - TRANSPORTE COMBIS', 'CD-TRANS-COMBIS', '', 'ESTGRL',1,1, NOW());
INSERT INTO mae_centro_costo(id,codigo,descripcion,abreviatura,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (32, '525', 'CD - TRANSPORTE CAMIONES', 'CD-TRANS-CAMION', '', 'ESTGRL',1,1, NOW());
INSERT INTO mae_centro_costo(id,codigo,descripcion,abreviatura,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (33, '526', 'CD - TRANSPORTE MOTOS', 'CD-TRANS-MOTOS', '', 'ESTGRL',1,1, NOW());
INSERT INTO mae_centro_costo(id,codigo,descripcion,abreviatura,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (34, '530', 'SUC 01 - SOPORTE ALMACEN 17', 'S1-SOP-ALM-17', '', 'ESTGRL',1,1, NOW());
INSERT INTO mae_centro_costo(id,codigo,descripcion,abreviatura,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (35, '531', 'SUC 01 - DESPACHO ALMACEN 17', 'S1-DES-ALM-17', '', 'ESTGRL',1,1, NOW());
INSERT INTO mae_centro_costo(id,codigo,descripcion,abreviatura,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (36, '532', 'SUC 01 - ALMACEN 17', 'S1-ALMACEN-17', '', 'ESTGRL',1,1, NOW());
INSERT INTO mae_centro_costo(id,codigo,descripcion,abreviatura,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (37, '533', 'SUC 01 - TRANSPORTE COMBIS', 'S1-TRANS-COMBIS', '', 'ESTGRL',1,1, NOW());
INSERT INTO mae_centro_costo(id,codigo,descripcion,abreviatura,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (38, '534', 'SUC 01 - TRANSPORTE CAMIONES', 'S1-TRANS-CAMION', '', 'ESTGRL',1,1, NOW());
INSERT INTO mae_centro_costo(id,codigo,descripcion,abreviatura,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (39, '535', 'SUC 01 - TRANSPORTE MOTOS', 'S1-TRANS-MOTOS', '', 'ESTGRL',1,1, NOW());
INSERT INTO mae_centro_costo(id,codigo,descripcion,abreviatura,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (40, '540', 'SUC 02 - SOPORTE ALMACEN CHAMORRO', 'S2-SOP-ALM-CHM', '', 'ESTGRL',1,1, NOW());
INSERT INTO mae_centro_costo(id,codigo,descripcion,abreviatura,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (41, '550', 'SUC 03 - SOPORTE ALMACEN ATE', 'S2-SOP-ALM-ATE', '', 'ESTGRL',1,1, NOW());
INSERT INTO mae_centro_costo(id,codigo,descripcion,abreviatura,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (42, '551', 'SUC 03 - DESPACHO ALMACEN ATE', 'S2-DES-ALM-ATE', '', 'ESTGRL',1,1, NOW());
INSERT INTO mae_centro_costo(id,codigo,descripcion,abreviatura,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (43, '552', 'SUC 03 - ALMACEN ATE', 'S3-ALMACEN-ATE', '', 'ESTGRL',1,1, NOW());
INSERT INTO mae_centro_costo(id,codigo,descripcion,abreviatura,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (44, '553', 'SUC 03 - TRANSPORTE COMBIS', 'S3-TRANS-COMBIS', '', 'ESTGRL',1,1, NOW());
INSERT INTO mae_centro_costo(id,codigo,descripcion,abreviatura,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (45, '554', 'SUC 03 - TRANSPORTE CAMIONES', 'S3-TRANS-CAMION', '', 'ESTGRL',1,1, NOW());
INSERT INTO mae_centro_costo(id,codigo,descripcion,abreviatura,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (46, '555', 'SUC 03 - TRANSPORTE MOTOS', 'S3-TRANS-MOTOS', '', 'ESTGRL',1,1, NOW());
INSERT INTO mae_centro_costo(id,codigo,descripcion,abreviatura,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (47, '560', 'SUC 04 - SOPORTE ALMACEN 14', 'S4-SOP.ALM-14', '', 'ESTGRL',1,1, NOW());
INSERT INTO mae_centro_costo(id,codigo,descripcion,abreviatura,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (48, '561', 'SUC 04 - DESPACHO ALMACEN 14', 'S4-DES-ALM-14', '', 'ESTGRL',1,1, NOW());
INSERT INTO mae_centro_costo(id,codigo,descripcion,abreviatura,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (49, '562', 'SUC 04 - ALMACEN 14', 'S4-ALMACEN-14', '', 'ESTGRL',1,1, NOW());
INSERT INTO mae_centro_costo(id,codigo,descripcion,abreviatura,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (50, '563', 'SUC 04 - TRANSPORTE COMBIS', 'S4-TRANS-COMBIS', '', 'ESTGRL',1,1, NOW());
INSERT INTO mae_centro_costo(id,codigo,descripcion,abreviatura,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (51, '564', 'SUC 04 - TRANSPORTE CAMIONES', 'S4-TRANS-CAMION', '', 'ESTGRL',1,1, NOW());
INSERT INTO mae_centro_costo(id,codigo,descripcion,abreviatura,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (52, '565', 'SUC 04 - TRANSPORTE MOTOS', 'S4-TRANS-MOTOS', '', 'ESTGRL',1,1, NOW());
INSERT INTO mae_centro_costo(id,codigo,descripcion,abreviatura,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (53, '570', 'SUC 05 - SOPORTE ALMACEN OLIVOS', 'S5-SOP-ALM-OLIV', '', 'ESTGRL',1,1, NOW());
INSERT INTO mae_centro_costo(id,codigo,descripcion,abreviatura,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (54, '571', 'SUC 05 - DESPACHO ALMACEN OLIVOS', 'S5-DES-ALM-OLIV', '', 'ESTGRL',1,1, NOW());
INSERT INTO mae_centro_costo(id,codigo,descripcion,abreviatura,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (55, '572', 'SUC 05 - ALMACEN OLIVOS', 'S5-ALMACEN-OLIV', '', 'ESTGRL',1,1, NOW());
INSERT INTO mae_centro_costo(id,codigo,descripcion,abreviatura,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (56, '573', 'SUC 05 - TRANSPORTE COMBIS', 'S5-TRANS-COMBIS', '', 'ESTGRL',1,1, NOW());
INSERT INTO mae_centro_costo(id,codigo,descripcion,abreviatura,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (57, '574', 'SUC 05 - TRANSPORTE CAMIONES', 'S5-TRANS-CAMION', '', 'ESTGRL',1,1, NOW());
INSERT INTO mae_centro_costo(id,codigo,descripcion,abreviatura,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (58, '575', 'SUC 05 - TRANSPORTE MOTOS', 'S5-TRANS-MOTOS', '', 'ESTGRL',1,1, NOW());
INSERT INTO mae_centro_costo(id,codigo,descripcion,abreviatura,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (59, '652', 'SUC 04 - CHOFERES', 'S4-CHOFERES', '', 'ESTGRL',1,1, NOW());
INSERT INTO mae_centro_costo(id,codigo,descripcion,abreviatura,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (60, '653', 'SUC 04  - MOTORIZADOS', 'S4-MOTORIZADOS', '', 'ESTGRL',1,1, NOW());
INSERT INTO mae_centro_costo(id,codigo,descripcion,abreviatura,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (61, '663', 'SUC 05  - MOTORIZADOS', 'S5-MOTORIZADOS', '', 'ESTGRL',1,1, NOW());
INSERT INTO mae_centro_costo(id,codigo,descripcion,abreviatura,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (62, '580', 'SUC 07 - SOPORTE ALMACEN 15', 'S7-SOP-ALM-15', '', 'ESTGRL',1,1, NOW());
INSERT INTO mae_centro_costo(id,codigo,descripcion,abreviatura,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (63, '581', 'SUC 07 - DESPACHO ALMACEN 15', 'S7-DES-ALM-15', '', 'ESTGRL',1,1, NOW());
INSERT INTO mae_centro_costo(id,codigo,descripcion,abreviatura,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (64, '582', 'SUC 07 - ALMACEN 15', 'S7-ALMACEN-15', '', 'ESTGRL',1,1, NOW());
INSERT INTO mae_centro_costo(id,codigo,descripcion,abreviatura,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (65, '583', 'SUC 07 - TRANSPORTE COMBIS', 'S7-TRANS-COMBIS', '', 'ESTGRL',1,1, NOW());
INSERT INTO mae_centro_costo(id,codigo,descripcion,abreviatura,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (66, '584', 'SUC 07 - TRANSPORTE CAMIONES', 'S7-TRANS-CAMION', '', 'ESTGRL',1,1, NOW());
INSERT INTO mae_centro_costo(id,codigo,descripcion,abreviatura,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (67, '585', 'SUC 07 - TRANSPORTE MOTOS', 'S7-TRANS-MOTOS', '', 'ESTGRL',1,1, NOW());
INSERT INTO mae_centro_costo(id,codigo,descripcion,abreviatura,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (68, '590', 'SUC 09 - SOPORTE ALMACEN CIVA', 'S9-SOP-ALM-CIVA', '', 'ESTGRL',1,1, NOW());
INSERT INTO mae_centro_costo(id,codigo,descripcion,abreviatura,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (69, '810', 'GERENCIA COMERCIAL', 'GER-COMERCIAL', '', 'ESTGRL',1,1, NOW());
INSERT INTO mae_centro_costo(id,codigo,descripcion,abreviatura,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (70, '820', 'MARKETING', 'MARKETING', '', 'ESTGRL',1,1, NOW());
INSERT INTO mae_centro_costo(id,codigo,descripcion,abreviatura,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (71, '830', 'POST VENTA', 'POST-VENTA', '', 'ESTGRL',1,1, NOW());
INSERT INTO mae_centro_costo(id,codigo,descripcion,abreviatura,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (72, '840', 'DESARROLLO DE PRODUCTO', 'DESARR-PRODUCTO', '', 'ESTGRL',1,1, NOW());
INSERT INTO mae_centro_costo(id,codigo,descripcion,abreviatura,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (73, '850', 'PRICING', 'PRICING', '', 'ESTGRL',1,1, NOW());
INSERT INTO mae_centro_costo(id,codigo,descripcion,abreviatura,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (74, '860', 'LUBRICANTES & FILTROS', 'LUBRI-&-FILTROS', '', 'ESTGRL',1,1, NOW());
INSERT INTO mae_centro_costo(id,codigo,descripcion,abreviatura,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (75, '870', 'VENTAS DE CAMPO', 'VENTAS-DE-CAMPO', '', 'ESTGRL',1,1, NOW());
INSERT INTO mae_centro_costo(id,codigo,descripcion,abreviatura,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (76, '875', 'VENTAS LIMA', 'VENTAS-LIMA', '', 'ESTGRL',1,1, NOW());
INSERT INTO mae_centro_costo(id,codigo,descripcion,abreviatura,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (77, '877', 'VENTAS PROVINCIA', 'VENTAS-PROV', '', 'ESTGRL',1,1, NOW());
INSERT INTO mae_centro_costo(id,codigo,descripcion,abreviatura,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (78, '880', 'TIENDA ARRIOLA 17', 'TDA-ARRIOLA-17', '', 'ESTGRL',1,1, NOW());
INSERT INTO mae_centro_costo(id,codigo,descripcion,abreviatura,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (79, '881', 'TIENDA ARRIOLA 14', 'TDA-ARRIOLA-14', '', 'ESTGRL',1,1, NOW());
INSERT INTO mae_centro_costo(id,codigo,descripcion,abreviatura,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (80, '882', 'TIENDA ARRIOLA 15', 'TDA-ARRIOLA-15', '', 'ESTGRL',1,1, NOW());
INSERT INTO mae_centro_costo(id,codigo,descripcion,abreviatura,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (81, '883', 'TIENDA LOS OLIVOS', 'TDA-LOS-OLIVOS', '', 'ESTGRL',1,1, NOW());
INSERT INTO mae_centro_costo(id,codigo,descripcion,abreviatura,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (82, '884', 'TIENDA ATE', 'TDA-ATE', '', 'ESTGRL',1,1, NOW());
INSERT INTO mae_centro_costo(id,codigo,descripcion,abreviatura,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (83, '885', 'CIVA', 'CIVA', '', 'ESTGRL',1,1, NOW());
INSERT INTO mae_centro_costo(id,codigo,descripcion,abreviatura,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (84, '886', 'LINEA AMARILLA', 'LINEA-AMARILLA', '', 'ESTGRL',1,1, NOW());
INSERT INTO mae_centro_costo(id,codigo,descripcion,abreviatura,observacion,estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea) VALUES (85, '887', 'LINEA AMERICANA', 'LINEA-AMERICANA', '', 'ESTGRL',1,1, NOW());

INSERT INTO mae_empleado (id,foto,apellido_paterno,apellido_materno,nombre,fecha_nacimiento,correo,direccion_actual,fecha_inicio_trabajo,fecha_fin_trabajo,
tipo_documento_identidad_cod_tabla_auxiliar,tipo_documento_identidad_id,nro_documento_identidad,telefono_1,telefono_2,cargo_id,centro_costo_id,local_id,
estado_civil_cod_tabla_auxiliar,estado_civil_id,sexo_cod_tabla_auxiliar,sexo_id,tipo_contrato_cod_tabla_auxiliar,tipo_contrato_id,
estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea)
VALUES (1,'','BRICEÑO','GREY','GONZALO','1992-02-13','SERVICIOSGENERALES@MYM.COM.PE','','2018-08-01','2019-03-31',
'TIPDID',1,'46830894','','',56,13,3,'ESTCIV',1,'TIPSEX',1,'TIPCON',2,'ESTGRL',1,1, NOW());
INSERT INTO mae_empleado (id,foto,apellido_paterno,apellido_materno,nombre,fecha_nacimiento,correo,direccion_actual,fecha_inicio_trabajo,fecha_fin_trabajo,
tipo_documento_identidad_cod_tabla_auxiliar,tipo_documento_identidad_id,nro_documento_identidad,telefono_1,telefono_2,cargo_id,centro_costo_id,local_id,
estado_civil_cod_tabla_auxiliar,estado_civil_id,sexo_cod_tabla_auxiliar,sexo_id,tipo_contrato_cod_tabla_auxiliar,tipo_contrato_id,
estado_cod_tabla_auxiliar,estado_id,id_usuario_crea,fecha_crea)
VALUES (2,'','CRISOSTOMO','VALVERDE','ANGELO ROGER','1995-01-16','SERVICIOSGENERALES@MYM.COM.PE','','2018-08-01','2019-03-31',
'TIPDID',1,'74035032','','',56,13,3,'ESTCIV',1,'TIPSEX',1,'TIPCON',1,'ESTGRL',1,1, NOW());



