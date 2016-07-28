package com.java1234.service.impl;

import javax.annotation.Resource;

import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import com.java1234.dao.BloggerDao;
import com.java1234.entity.Blogger;
import com.java1234.service.BloggerService;
import com.java1234.util.CryptographyUtil;

/**
 * 博主Service实现类
 * 
 * @author Administrator
 *
 */
@Service("bloggerService")
public class BloggerServiceImpl implements BloggerService {

	@Resource
	private BloggerDao bloggerDao;

	public Blogger find() {
		return bloggerDao.find();
	}

	public Blogger getByUserName(String userName) {
		return bloggerDao.getByUserName(userName);
	}

	public Integer update(Blogger blogger) {
		return bloggerDao.update(blogger);
	}

	public Integer add(Blogger blogger){
		Blogger b = new Blogger();
		BeanUtils.copyProperties(blogger, new String[]{"password"});
		b.setUserName(blogger.getUserName());
		b.setPassword(CryptographyUtil.md5(blogger.getPassword(), "java1234"));
		b.setNickName(blogger.getNickName());
		b.setSign(blogger.getSign());
		b.setProFile(blogger.getProFile());
		b.setImageName(blogger.getImageName());
		return bloggerDao.add(b);
	}

}
