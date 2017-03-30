package com.fsw.service;

import java.io.File; 
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;

import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

@Repository("fileService")
public class FileService {
	public HashMap<String, List<String>> uploadFiles(List<MultipartFile> files, String storePath) {
		File file = null;
		HashMap<String, List<String>> hashMap = null;
		ArrayList<String> fileNames = null;
		ArrayList<String> creationTimes = null;
		file = new File(storePath);
		if (!(file.exists())) {
			file.mkdir();
		}
		fileNames = new ArrayList<String>();
		creationTimes = new ArrayList<String>();
		for (MultipartFile multipartFile : files) {
			String fileName = multipartFile.getOriginalFilename();
			String actualPath = storePath + File.separator + fileName;
			File newFile = new File(actualPath);
			if (!(isExist(newFile))) {
				try {
					FileUtils.copyInputStreamToFile(multipartFile.getInputStream(), newFile);
					fileNames.add(fileName);
					creationTimes.add(new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(new Date()));
				} catch (IOException e) {
					e.printStackTrace();
				}
			} else {

			}
		}
		hashMap = new LinkedHashMap<String, List<String>>();
		fileNames.trimToSize();
		creationTimes.trimToSize();
		hashMap.put("fileNames", fileNames);
		hashMap.put("creationTimes", creationTimes);
		return hashMap;
	}

	private boolean isExist(File file) {
		boolean flag = false;
		if (!(file.exists())) {
			flag = false;
		} else {
			flag = true;
		}
		return flag;
	}
}
