package com.fsw.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Repository;

import com.fsw.vo.RegistrationVo;

@Repository("/registrationDao")
public class RegistrationDao {
	public int registerUser(RegistrationVo registrationVo) {
		MapSqlParameterSource parameters = null;
		parameters = new MapSqlParameterSource();
		parameters.addValue("userName", registrationVo.getUserName());
		parameters.addValue("password", registrationVo.getPassword());
		parameters.addValue("emailid", registrationVo.getEmailId());
		parameters.addValue("mobileNo", registrationVo.getMobile());
		return jdbcTemplate.update(
				"INSERT INTO USER_REGISTRATION(USERNAME,PASSWORD,EMAILID,MOBILENO) VALUES(:userName,:password,:emailid,:mobileNo)",
				parameters);
	}

	public long validateUser(String userName, String password) {
		MapSqlParameterSource parameters = null;
		parameters = new MapSqlParameterSource();
		parameters.addValue("userName", userName);
		parameters.addValue("password", password);
		return jdbcTemplate.queryForLong(
				"SELECT COUNT(*) FROM USER_REGISTRATION WHERE USERNAME=:userName AND PASSWORD=:password", parameters);
	}

	public List<RegistrationVo> getUsers() {
		return jdbcTemplate.query("SELECT USERNAME,MOBILENO,EMAILID FROM USER_REGISTRATION",
				new RowMapper<RegistrationVo>() {
					@Override
					public RegistrationVo mapRow(ResultSet rs, int count) throws SQLException {
						RegistrationVo vo = null;
						vo = new RegistrationVo();
						vo.setUserName(rs.getString(1));
						vo.setMobile(rs.getString(2));
						vo.setEmailId(rs.getString(3));
						return vo;
					}
				});
	}

	public int updateUser(RegistrationVo registrationVo) {
		MapSqlParameterSource parameters = null;
		parameters = new MapSqlParameterSource();
		parameters.addValue("userName", registrationVo.getUserName());
		parameters.addValue("password", registrationVo.getPassword());
		parameters.addValue("emailId", registrationVo.getEmailId());
		parameters.addValue("mobileNo", registrationVo.getMobile());
		return jdbcTemplate.update(
				"UPDATE USER_REGISTRATION SET PASSWORD=:password,EMAILID=:emailId,MOBILENO=:mobileNo WHERE USERNAME=:userName",
				parameters);
	}

	@Resource
	private NamedParameterJdbcTemplate jdbcTemplate;
}
