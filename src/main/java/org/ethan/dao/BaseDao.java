package org.ethan.dao;

import java.lang.reflect.ParameterizedType;
import java.util.List;

import javax.annotation.Resource;

import org.ethan.idao.IBaseDao;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
/**
 * 可以考虑把所有公共的方法都写在baseDAO中，这个时候，让所有的DAO都继承BaseDao
 * 这样基本上就实现了大量的基础方法，如果DAO中有一些特殊的方法，再在具体的实现类的
 * DAO中创建
 * 在Spring与Hibernate4的整合中已经取消了对HibernateTemplate和HibernateDaoSupport两个类的支持
 * @author Ethan
 * @param <T>
 */
public class BaseDao<T> implements IBaseDao<T>{
	
	private SessionFactory sessionFactory;
	/**
	 * 此处不能使用setSessionFactory注入，因为setSessionFactory在HibernateDaoSupport
	 * 中已经定义了而且还是final的，所以不能被覆盖
	 * @param sessionFactory
	 */
	@Resource(name="sessionFactory")
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	protected Session getSession() {
		return sessionFactory.getCurrentSession();
	}
	/**
	 * 创建一个Class的对象来获取泛型的class
	 */
	private Class<T> clz;
	
	@SuppressWarnings("unchecked")
	public Class<T> getClz() {
		if(clz==null) {
			//获取泛型的Class对象
			clz = ((Class<T>)
					(((ParameterizedType)(this.getClass().getGenericSuperclass())).getActualTypeArguments()[0]));
		}
		return clz;
	}

	@Override
	public void add(T t) {
		this.getSession().save(t);
	}

	@Override
	public void delete(int id) {
		this.getSession().delete(this.load(id));
	}

	@Override
	public void update(T t) {
		this.getSession().update(t);
	}

	@SuppressWarnings("unchecked")
	@Override
	public T load(int id) {
		/**
		 * 如果使用了自定义的OpenSessionFilter,需要按照如下方法来获取
		 */
		/*return (T)OpenSessionFilter.getSession()
				.load(getClz(), id);*/
		/**
		 * 如果使用Spring所提供的OpenSessionInViewerFilter就按照整合的方法处理即可
		 */
		try {
			this.getSession().load(getClz(), id);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
		return (T)this.getSession().load(getClz(), id);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<T> list(String hql, Object[] args) {
		Query u = this.getSession().createQuery(hql);
		if(args!=null) {
			for(int i=0;i<args.length;i++) {
				u.setParameter(0, args[i]);
			}
		}
		List<T> list = u.list();
		return list;
	}

	@Override
	public List<T> list(String hql) {
		return this.list(hql,null);
	}

	@Override
	public List<T> list(String hql, Object arg) {
		return this.list(hql,new Object[]{arg});
	}

}
