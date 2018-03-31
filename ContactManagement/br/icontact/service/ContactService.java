package br.icontact.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import br.icontact.model.contact.Contact;
import br.icontact.repository.ContactRepository;

@Service
public class ContactService {

	@Autowired
	ContactRepository contactRepository;
	
	public List<Contact> getContactByMfir(Long mfir){
		return contactRepository.getContactByMfir(mfir);
	}
	
	public void insertOrUpdate(Contact contact){
		
		if(contact.getId()!=null)
			contactRepository.update(contact);
		else
			contactRepository.insert(contact);
	}
	
	public Contact findById(Long id){
		if (id!=null) {
			return contactRepository.findById(id);
			
		}
		return null;
	}

	public void delete(Long id) {
		contactRepository.deleteContact(id);
	}
	
}
