package com.homedelivery.web.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Row;
import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.homedelivery.domain.Region;
import com.homedelivery.web.action.base.BaseAction;


/**
 * Region management
 */
@Controller
@Scope("prototype")
public class RegionAction extends BaseAction<Region>{
	//receive upload file
	private File myFile;
	public void setMyFile(File myFile) {
		this.myFile = myFile;
	}
	
	/**
	 * Batch import
	 * @throws IOException 
	 * @throws FileNotFoundException 
	 */
	public String importXls() throws Exception{
		String flag = "1";
		//analyze the excel file by POI
		try{
			HSSFWorkbook workbook = new HSSFWorkbook(new FileInputStream(myFile));
			//get the first sheet
			HSSFSheet sheet = workbook.getSheetAt(0);
			List<Region> list = new ArrayList<Region>();
			for (Row row : sheet) {
				int rowNum = row.getRowNum();
				if(rowNum == 0){
					//ignore the first raw of title
					continue;
				}
				String id = row.getCell(0).getStringCellValue();
				String province = row.getCell(1).getStringCellValue();
				String city = row.getCell(2).getStringCellValue();
				String district = row.getCell(3).getStringCellValue();
				String postcode = row.getCell(4).getStringCellValue();
				String citycode = row.getCell(5).getStringCellValue();
				String shortcode = row.getCell(6).getStringCellValue();
				Region region = new Region(id, province, city, district, postcode, shortcode, citycode, null);
				list.add(region);
			}
			regionService.saveBatch(list);
		}catch (Exception e) {
			flag = "0";
		}
		ServletActionContext.getResponse().setContentType("text/html;charset=UTF-8");
		ServletActionContext.getResponse().getWriter().print(flag);
		return NONE;
	}
	
	/**
	 * query by page
	 * @throws IOException 
	 */
	public String pageQuery() throws IOException{
		regionService.pageQuery(pageBean);
		this.writePageBean2Json(pageBean, new String[]{"currentPage","detachedCriteria","pageSize","subareas"});
		return NONE;
	}
	

	
}
