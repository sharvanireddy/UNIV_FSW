package com.fsw.controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.charset.Charset;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tika.Tika;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fsw.dao.FileDao;
import com.fsw.service.FileService;
import com.fsw.vo.FileDetails;
import com.fsw.vo.FileVo;

@Controller
public class FileController {
	@RequestMapping(value = "/upload.do", method = RequestMethod.POST)
	public String upload(@ModelAttribute FileVo fileVo, HttpServletRequest request, RedirectAttributes attributes) {
		String storePath = null;
		storePath = request.getServletContext().getRealPath("Files Store");
		HashMap<String, List<String>> hashMap = fileService.uploadFiles(fileVo.getFiles(), storePath);
		boolean flag = fileDao.uploadFile(hashMap);
		if (flag == true) {
			attributes.addFlashAttribute("fsuccess", "Files has been stored to server successfully");
		} else {
			attributes.addFlashAttribute("ferror", "Files not stored to the server please check your request once");
		}
		return "redirect:redirectFileUpload.do";
	}

	@RequestMapping(value = "/redirectFileUpload.do", method = RequestMethod.GET)
	public String redirect() {
		return "redirect:adminHome.jsp";
	}

	@RequestMapping(value = "/getFiles.do", method = RequestMethod.GET)
	public String getFiles(ModelMap model) {
		List<FileDetails> fileDetails = null;
		fileDetails = fileDao.getFiles();
		if (fileDetails != null) {
			model.addAttribute("files", fileDetails);
			model.addAttribute("gf", "FromGetFiles");
		} else {
			model.addAttribute("error", "FilesStorage is Empty");
			model.addAttribute("gf", "FromGetFiles");
		}
		return "adminHome";
	}

	@RequestMapping(value = "/getFileDetails.do", method = RequestMethod.GET)
	public @ResponseBody String getFilesView(@RequestParam String fileName) {
		String htmlMessage = null;
		List<FileDetails> fileDetails = null;
		fileDetails = fileDao.getFilesView(fileName);
		if ((fileDetails != null) && (fileDetails.isEmpty() == false)) {
			htmlMessage = "<table border=\"1\" style=\"position: absolute; float: top; top: 38%; right: 26%;\">";
			htmlMessage += "<tr align='center' style=\"background-color: #4E4954;\"><td>FileName&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td>Creation Time&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;download&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td></tr>";
			for (FileDetails file : fileDetails) {
				htmlMessage += "<tr align='center'><td>" + file.getFileName()
						+ "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td>"
						+ file.getCreationTime()
						+ "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href=\"downloadFile.do?fileName="
						+ file.getFileName()
						+ "\" target=\"_blank\">download</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td></tr>";
			}
			htmlMessage += "</table>";
		} else {
			htmlMessage = "<h4 style='color:#ff0000;'>404 File Not Found</h4>";
		}
		return htmlMessage;
	}

	@RequestMapping(value = "/downloadFile.do", method = RequestMethod.GET)
	public void downloadFile(@RequestParam String fileName, HttpServletRequest request, HttpServletResponse response) {
		File file = null;
		String storePath = null;
		Tika tika = null;
		storePath = request.getServletContext().getRealPath("Files Store");
		file = new File(storePath + File.separator + fileName);
		OutputStream outputStream = null;
		if (!file.exists()) {
			String errorMessage = "Sorry. The file you are looking for does not exist";
			try {
				outputStream = response.getOutputStream();
				outputStream.write(errorMessage.getBytes(Charset.forName("UTF-8")));
				outputStream.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
			return;
		}
		tika = new Tika();
		response.setContentType(tika.detect(fileName));
		response.setHeader("Content-Disposition", "attachment;filename=" + fileName);
		response.setContentLength((int) file.length());
		try {
			InputStream inputStream = new BufferedInputStream(new FileInputStream(file));
			FileCopyUtils.copy(inputStream, response.getOutputStream());
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@Resource
	private FileService fileService;
	@Resource
	private FileDao fileDao;
}
