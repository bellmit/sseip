package com.syzc.sseip.dao.handler;

import com.syzc.sseip.entity.enumtype.HospitalizationType;
import org.apache.ibatis.type.JdbcType;
import org.apache.ibatis.type.MappedTypes;
import org.apache.ibatis.type.TypeHandler;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@MappedTypes(HospitalizationType.class)
public class HospitalizationTypeHandler implements TypeHandler<HospitalizationType> {
    @Override
    public void setParameter(PreparedStatement ps, int i, HospitalizationType parameter, JdbcType jdbcType) throws SQLException {
        ps.setInt(i, parameter.getCode());
    }

    @Override
    public HospitalizationType getResult(ResultSet rs, String columnName) throws SQLException {
        return HospitalizationType.get(rs.getInt(columnName));
    }

    @Override
    public HospitalizationType getResult(ResultSet rs, int columnIndex) throws SQLException {
        return HospitalizationType.get(rs.getInt(columnIndex));
    }

    @Override
    public HospitalizationType getResult(CallableStatement cs, int columnIndex) throws SQLException {
        return HospitalizationType.get(cs.getInt(columnIndex));
    }
}