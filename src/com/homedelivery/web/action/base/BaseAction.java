package com.homedelivery.web.action.base;

import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

/**
 * commonly action
 * @param <T>
 */
public class BaseAction<T> extends ActionSupport implements ModelDriven<T>{
	//get model 
	protected T model;
	public T getModel() {
		return model;
	}
	
	/**
	 * reflection to get model
	 */
	public BaseAction() {
		ParameterizedType genericSuperclass = (ParameterizedType) this.getClass().getGenericSuperclass();
		Type[] actualTypeArguments = genericSuperclass.getActualTypeArguments();
		//get T type array from parent class
		Class<T> entityClass = (Class<T>) actualTypeArguments[0];
		try {
			// to get new instance from class
			model = entityClass.newInstance();
		} catch (InstantiationException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		}
	}
}
