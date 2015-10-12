package com.syzc.sseip.dao.handler;

import com.syzc.sseip.entity.enumtype.pasture.DiseaseType;
import org.apache.ibatis.type.JdbcType;
import org.apache.ibatis.type.MappedTypes;
import org.apache.ibatis.type.TypeHandler;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@MappedTypes(DiseaseType.class)
public class DiseaseTypeHandler implements TypeHandler<DiseaseType> {
    @Override
    public void setParameter(PreparedStatement ps, int i, DiseaseType parameter, JdbcType jdbcType) throws SQLException {
        ps.setInt(i, parameter.getCode());
    }

    @Override
    public DiseaseType getResult(ResultSet rs, String columnName) throws SQLException {
        return DiseaseType.get(rs.getInt(columnName));
    }

    @Override
    public DiseaseType getResult(ResultSet rs, int columnIndex) throws SQLException {
        return DiseaseType.get(rs.getInt(columnIndex));
    }

    @Override
    public DiseaseType getResult(CallableStatement cs, int columnIndex) throws SQLException {
        return DiseaseType.get(cs.getInt(columnIndex));
    }
}