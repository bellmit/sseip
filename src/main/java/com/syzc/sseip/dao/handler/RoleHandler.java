package com.syzc.sseip.dao.handler;

import com.syzc.sseip.entity.enumtype.Role;
import org.apache.ibatis.type.JdbcType;
import org.apache.ibatis.type.MappedTypes;
import org.apache.ibatis.type.TypeHandler;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@MappedTypes(Role.class)
public class RoleHandler implements TypeHandler<Role> {
    @Override
    public void setParameter(PreparedStatement ps, int i, Role parameter, JdbcType jdbcType) throws SQLException {
        ps.setInt(i, parameter.getCode());
    }

    @Override
    public Role getResult(ResultSet rs, String columnName) throws SQLException {
        return Role.get(rs.getInt(columnName));
    }

    @Override
    public Role getResult(ResultSet rs, int columnIndex) throws SQLException {
        return Role.get(rs.getInt(columnIndex));
    }

    @Override
    public Role getResult(CallableStatement cs, int columnIndex) throws SQLException {
        return Role.get(cs.getInt(columnIndex));
    }
}