package com.homedelivery.web.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletOutputStream;

import org.apache.commons.lang3.StringUtils;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.struts2.ServletActionContext;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.homedelivery.domain.Region;
import com.homedelivery.domain.Subarea;
import com.homedelivery.web.action.base.BaseAction;


/**
 * Subarea management
 */

@Controller
@Scope("prototype")
public class SubareaAction extends BaseAction<Subarea> {
	public String add() {
		subareaService.save(model);
		return "list";
	}
	public String pageQuery() throws Exception {
		//get detached creteria before query
		DetachedCriteria detachedCriteria2 = pageBean.getDetachedCriteria();
		String addresskey = model.getAddresskey();
		Region region = model.getRegion();

		if (StringUtils.isNotBlank(addresskey)) {
			//fuzzy query by addresskey
			detachedCriteria2.add(Restrictions.like("addressKey", addresskey));
		}

		if (region != null) {
			//create alias which will be used in multi-table query as "region.province" doesn't work 
			detachedCriteria2.createAlias("region", "r");
			String province = region.getProvince();
			String city = region.getCity();
			String district = region.getDistrict();

			if (StringUtils.isNotBlank(province)) {
				// fuzzy query by province
				detachedCriteria2.add(Restrictions.like("r.province", "%"
						+ province + "%"));
			}
			if (StringUtils.isNotBlank(city)) {
				// fuzzy query by city
				detachedCriteria2.add(Restrictions.like("r.city", "%" + city
						+ "%"));
			}
			if (StringUtils.isNotBlank(district)) {
				// fuzzy query by district
				detachedCriteria2.add(Restrictions.like("r.district", "%"
						+ district + "%"));
			}
		}
		subareaService.pageQuery(pageBean);
		String[] excludes = new String[] { "detachedCriteria", "currentPage",
				"pageSize", "decidedzone", "subareas" };
		this.writePageBean2Json(pageBean, excludes);
		return NONE;
	}
	
	/**
	 * Write Excel file by Apache POI and download
	 * @throws IOException 
	 */
	public String exportXls() throws IOException {
		List<Subarea> list = subareaService.findAll();
		//create an Excel file in memory and outputstream for download
		HSSFWorkbook workbook = new HSSFWorkbook();
		// create a sheet
		HSSFSheet sheet = workbook.createSheet("Subarea data");
		// create head row
		HSSFRow headRow = sheet.createRow(0);
		headRow.createCell(0).setCellValue("Subarea id");
		headRow.createCell(1).setCellValue("Region id");
		headRow.createCell(2).setCellValue("Addresskey");
		headRow.createCell(3).setCellValue("province city district");

		for (Subarea subarea : list) {
			HSSFRow dataRow = sheet.createRow(sheet.getLastRowNum() + 1);
			dataRow.createCell(0).setCellValue(subarea.getId());
			dataRow.createCell(1).setCellValue(subarea.getRegion().getId());
			dataRow.createCell(2).setCellValue(subarea.getAddresskey());
			Region region = subarea.getRegion();
			dataRow.createCell(3).setCellValue(region.getProvince()+" "+region.getCity()+" "+region.getDistrict());
		}

		String filename = "Subarea data.xls";
		//for filename which is not english. If filename is not english need to do encode setting according to browser agent
		/*
		String agent = ServletActionContext.getRequest().getHeader("User-Agent");
		filename = FileUtils.encodeDownloadFilename(filename, agent);
		*/
		//one outpursrteam & two header setting
		ServletOutputStream out = ServletActionContext.getResponse().getOutputStream();
		String contentType = ServletActionContext.getServletContext().getMimeType(filename);
		ServletActionContext.getResponse().setContentType(contentType);
		ServletActionContext.getResponse().setHeader("content-disposition", "attchment;filename="+filename);
		workbook.write(out);
		return NONE;
	}
	
	public String listajax() throws IOException{
		List<Subarea> list = subareaService.findListNotAssociation();
		String[] excludes = new String[]{"decidedzone","region"};
		this.writeList2Json(list, excludes );
		return NONE;
	}
}
