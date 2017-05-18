package cn.itcast.goods.test;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class HibernateTest {
	public static void main(String[] args) {
		Configuration con = new Configuration();
		con.configure("/hibernate.cfg.xml");
		SessionFactory sf = con.buildSessionFactory();
		
	}
}
