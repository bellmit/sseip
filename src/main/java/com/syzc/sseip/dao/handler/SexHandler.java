package com.syzc.sseip.dao.handler;

import com.syzc.sseip.entity.enumtype.Sex;
import org.apache.ibatis.type.JdbcType;
import org.apache.ibatis.type.MappedTypes;
import org.apache.ibatis.type.TypeHandler;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@MappedTypes(Sex.class)
public class SexHandler implements TypeHandler<Sex> {
    @Override
    public void setParameter(PreparedStatement ps, int i, Sex parameter, JdbcType jdbcType) throws SQLException {
        ps.setInt(i, parameter.getCode());
    }

    @Override
    public Sex getResult(ResultSet rs, String columnName) throws SQLException {
        return Sex.get(rs.getInt(columnName));
    }

    @Override
    public Sex getResult(ResultSet rs, int columnIndex) throws SQLException {
        return Sex.get(rs.getInt(columnIndex));
    }

    @Override
    public Sex getResult(CallableStatement cs, int columnIndex) throws SQLException {
        return Sex.get(cs.getInt(columnIndex));
    }
}