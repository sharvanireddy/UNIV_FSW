package com.fsw.vo;

public class FileDetails {
	private String fileName;
	private String creationTime;

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getCreationTime() {
		return creationTime;
	}

	public void setCreationTime(String creationTime) {
		this.creationTime = creationTime;
	}

	@Override
	public String toString() {
		return "FileDetails [fileName=" + fileName + ", creationTime=" + creationTime + "]";
	}
}
