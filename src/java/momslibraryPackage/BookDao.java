/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package momslibraryPackage;

import java.util.ArrayList;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import org.hibernate.Session;

/**
 *
 * @author maple
 */
public class BookDao {
    
    public static void saveUser(Book book) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();

        session.save(book);

        session.getTransaction().commit();
    }

    public void updateUser(Book book) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();

        session.merge(book);

        session.getTransaction().commit();
    }

    public void deleteUser(Book book) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();

        session.delete(book);

        session.getTransaction().commit();
    }

    public void getUser() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();

        ArrayList<Book> list = (ArrayList<Book>) session.createQuery("from books").list();
        session.getTransaction().commit();
    }
}
