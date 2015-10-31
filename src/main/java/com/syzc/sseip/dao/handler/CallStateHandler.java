package com.syzc.sseip.dao.handler;

import com.syzc.sseip.entity.enumtype.CallState;
import org.apache.ibatis.type.JdbcType;
import org.apache.ibatis.type.MappedTypes;
import org.apache.ibatis.type.TypeHandler;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@MappedTypes(CallState.class)
public class CallStateHandler implements TypeHandler<CallState> {
    @Override
    public void setParameter(PreparedStatement ps, int i, CallState parameter, JdbcType jdbcType) throws SQLException {
        ps.setInt(i, parameter.getCode());
    }

    @Override
    public CallState getResult(ResultSet rs, String columnName) throws SQLException {
        return CallState.get(rs.getInt(columnName));
    }

    @Override
    public CallState getResult(ResultSet rs, int columnIndex) throws SQLException {
        return CallState.get(rs.getInt(columnIndex));
    }

    @Override
    public CallState getResult(CallableStatement cs, int columnIndex) throws SQLException {
        return CallState.get(cs.getInt(columnIndex));
    }
}