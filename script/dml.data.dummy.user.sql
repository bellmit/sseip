INSERT INTO user (username, password, real_name, age, id_number, address, phone, role, group_id)
  VALUE
  (#{entity.username},
   sha2(concat('!a1@B2c3D4e5F6g7', #{entity.password}, '#h4$I5j6K7l8M9n0'), 256),
   #{entity.realName},
   #{entity.age},
   NULL,
   #{entity.address},
   #{entity.phone},
   #{entity.role},
   NULL
  );

# 管理员
INSERT INTO user (username, password, real_name, age, address, phone, role)
  VALUE
  (#{entity.username},
   sha2(concat('!a1@B2c3D4e5F6g7', #{entity.password}, '#h4$I5j6K7l8M9n0'), 256),
   #{entity.realName},
   #{entity.age},
   #{entity.address},
   #{entity.phone},
   4
  );
INSERT INTO user (username, password, real_name, age, address, phone, role)
  VALUE
  ('abc',
   sha2(concat('!a1@B2c3D4e5F6g7', 'abc', '#h4$I5j6K7l8M9n0'), 256),
   '自动低音补偿',
   25,
   '山东蓬莱市',
   132132132132132,
   4
  ),
  ('admin',
   sha2(concat('!a1@B2c3D4e5F6g7', 'admin', '#h4$I5j6K7l8M9n0'), 256),
   'admin',
   25,
   '远在天边近在眼前',
   132132132132132,
   4
  );

INSERT INTO user (username, password, real_name, age, address, phone, role, group_id)
  VALUE
  (#{entity.username},
   sha2(concat('!a1@B2c3D4e5F6g7', #{entity.password}, '#h4$I5j6K7l8M9n0'), 256),
    #{entity.realName},
   #{entity.age},
   #{entity.address},
   #{entity.phone},
   1,
   1
  );

INSERT INTO user (username, password, real_name, age, address, phone, role, group_id)
  VALUE
  (#{entity.username},
   sha2(concat('!a1@B2c3D4e5F6g7', #{entity.password}, '#h4$I5j6K7l8M9n0'), 256),
   #{entity.realName},
   #{entity.age},
   #{entity.address},
   #{entity.phone},
   #{entity.role},
   NULL
  );
