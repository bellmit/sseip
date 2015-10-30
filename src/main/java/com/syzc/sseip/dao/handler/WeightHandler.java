package com.syzc.sseip.dao.handler;

import com.syzc.sseip.entity.enumtype.Weight;
import org.apache.ibatis.type.JdbcType;
import org.apache.ibatis.type.MappedTypes;
import org.apache.ibatis.type.TypeHandler;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@MappedTypes(Weight.class)
public class WeightHandler implements TypeHandler<Weight> {
    @Override
    public void setParameter(PreparedStatement ps, int i, Weight parameter, JdbcType jdbcType) throws SQLException {
        ps.setInt(i, parameter.getCode());
    }

    @Override
    public Weight getResult(ResultSet rs, String columnName) throws SQLException {
        return Weight.get(rs.getInt(columnName));
    }

    @Override
    public Weight getResult(ResultSet rs, int columnIndex) throws SQLException {
        return Weight.get(rs.getInt(columnIndex));
    }

    @Override
    public Weight getResult(CallableStatement cs, int columnIndex) throws SQLException {
        return Weight.get(cs.getInt(columnIndex));
    }
}