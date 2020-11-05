INSERT INTO seg_usuario (id, username, password, enabled, nombre, apellido, email) VALUES (1, 'sebas','$2a$10$CYW8sTnRy6foRBX9ty2r.u8lkJOnaeZVPApBw5En.6Oj6WKHTkc1u',1,'Sebastian','Saavedra','ssavedra@gmail.com');
INSERT INTO seg_usuario (id, username, password, enabled, nombre, apellido, email) VALUES (2, 'admin','$2a$10$AP748R095nmBpl985rMhV.LlTGmBQKL1c4i2SohxXnj.opXrd4JiC',1,'Super','Admin','admin@admin.com');

INSERT INTO seg_rol (id, nombre) VALUES (1,'ROLE_USER');
INSERT INTO seg_rol (id, nombre) VALUES (2,'ROLE_ADMIN');

INSERT INTO seg_usuario_seg_rol (seg_usuario_id, seg_rol_id) VALUES (1,1);
INSERT INTO seg_usuario_seg_rol (seg_usuario_id, seg_rol_id) VALUES (2,1);
INSERT INTO seg_usuario_seg_rol (seg_usuario_id, seg_rol_id) VALUES (2,2);