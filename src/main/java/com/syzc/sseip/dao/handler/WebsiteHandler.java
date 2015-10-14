package com.syzc.sseip.dao.handler;

import com.syzc.sseip.entity.enumtype.pasture.Website;
import org.apache.ibatis.type.JdbcType;
import org.apache.ibatis.type.MappedTypes;
import org.apache.ibatis.type.TypeHandler;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@MappedTypes(Website.class)
public class WebsiteHandler implements TypeHandler<Website> {
    @Override
    public void setParameter(PreparedStatement ps, int i, Website parameter, JdbcType jdbcType) throws SQLException {
        ps.setInt(i, parameter.getCode());
    }

    @Override
    public Website getResult(ResultSet rs, String columnName) throws SQLException {
        return Website.get(rs.getInt(columnName));
    }

    @Override
    public Website getResult(ResultSet rs, int columnIndex) throws SQLException {
        return Website.get(rs.getInt(columnIndex));
    }

    @Override
    public Website getResult(CallableStatement cs, int columnIndex) throws SQLException {
        return Website.get(cs.getInt(columnIndex));
    }
}