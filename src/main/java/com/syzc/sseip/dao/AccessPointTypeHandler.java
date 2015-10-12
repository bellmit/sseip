package com.syzc.sseip.dao;

import com.syzc.sseip.entity.enumtype.AccessPointType;
import org.apache.ibatis.type.JdbcType;
import org.apache.ibatis.type.MappedTypes;
import org.apache.ibatis.type.TypeHandler;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@MappedTypes(AccessPointType.class)
public class AccessPointTypeHandler implements TypeHandler<AccessPointType> {
    @Override
    public void setParameter(PreparedStatement ps, int i, AccessPointType parameter, JdbcType jdbcType) throws SQLException {
        ps.setInt(i, parameter.getCode());
    }

    @Override
    public AccessPointType getResult(ResultSet rs, String columnName) throws SQLException {
        return AccessPointType.get(rs.getInt(columnName));
    }

    @Override
    public AccessPointType getResult(ResultSet rs, int columnIndex) throws SQLException {
        return AccessPointType.get(rs.getInt(columnIndex));
    }

    @Override
    public AccessPointType getResult(CallableStatement cs, int columnIndex) throws SQLException {
        return AccessPointType.get(cs.getInt(columnIndex));
    }
}