package com.fsw.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Repository;

import com.fsw.vo.FileDetails;

@Repository("fileDao")
public class FileDao {
	public boolean uploadFile(HashMap<String, List<String>> hashMap) {
		boolean flag = false;
		List<String> fileNames = null;
		List<String> creationTimes = null;
		int count = 0;
		fileNames = hashMap.get("fileNames");
		creationTimes = hashMap.get("creationTimes");
		MapSqlParameterSource parameters = null;
		for (int i = 0; i < fileNames.size(); i++) {
			parameters = new MapSqlParameterSource();
			parameters.addValue("fileName", fileNames.get(i));
			parameters.addValue("creationTime", creationTimes.get(i));
			jdbcTemplate.update("INSERT INTO FILESTORE(FILENAME,CREATIONTIME) VALUES(:fileName,:creationTime)",
					parameters);
			++count;
		}
		if (count != 0) {
			flag = true;
		} else {
			flag = false;
		}
		return flag;
	}

	public List<FileDetails> getFiles() {
		return jdbcTemplate.query("SELECT DISTINCT(FILENAME),CREATIONTIME FROM FILESTORE",
				new RowMapper<FileDetails>() {
					@Override
					public FileDetails mapRow(ResultSet rs, int count) throws SQLException {
						FileDetails fileDetails = null;
						fileDetails = new FileDetails();
						fileDetails.setFileName(rs.getString(1));
						fileDetails.setCreationTime(rs.getString(2));
						return fileDetails;
					}
				});
	}

	public List<FileDetails> getFilesView(String fileName) {
		return jdbcTemplate.query("SELECT DISTINCT(FILENAME),CREATIONTIME FROM FILESTORE WHERE FILENAME=:fileName",
				new MapSqlParameterSource("fileName", fileName), new RowMapper<FileDetails>() {
					@Override
					public FileDetails mapRow(ResultSet rs, int count) throws SQLException {
						FileDetails fileDetails = null;
						fileDetails = new FileDetails();
						fileDetails.setFileName(rs.getString(1));
						fileDetails.setCreationTime(rs.getString(2));
						return fileDetails;
					}
				});
	}

	@Resource
	private NamedParameterJdbcTemplate jdbcTemplate;
}
