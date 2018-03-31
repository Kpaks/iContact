package br.icontact.repository;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import br.icontact.model.contact.Contact;

@Repository
public class ContactRepository {
	
	@PersistenceContext(unitName="iContactDevelopment")
	private EntityManager em;
	
	@SuppressWarnings("unchecked")
	public List<Contact> getContactByMfir(Long mfir){
		
		String sql = "select * from TJ_CONTACT where id_company = :mfir ";
		
		return em.createNativeQuery(sql, Contact.class)
				 .setParameter("mfir", mfir)
				 .getResultList();
		
	}
	
	@Transactional(transactionManager="transactionManagerDevelopment")
	public void update(Contact contact){
		em.merge(contact);
	}
	
	@Transactional(transactionManager="transactionManagerDevelopment")
	public void insert(Contact contact){
		em.persist(contact);
	}
	
	public Contact findById(Long id){
		return em.find(Contact.class, id);
	}

	@Transactional(transactionManager="transactionManagerDevelopment")
	public void deleteContact(Long id) {
		Contact contactToBeDeleted =  em.getReference(Contact.class, id);
		em.remove(contactToBeDeleted);
	}
 }
