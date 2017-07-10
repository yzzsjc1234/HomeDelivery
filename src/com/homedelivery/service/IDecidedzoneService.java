package com.homedelivery.service;

import com.homedelivery.domain.Decidedzone;
import com.homedelivery.utils.PageBean;




public interface IDecidedzoneService {

	public void save(Decidedzone model, String[] subareaid);

	public void pageQuery(PageBean pageBean);

}
