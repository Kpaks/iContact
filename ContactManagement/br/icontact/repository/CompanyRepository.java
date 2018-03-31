package br.icontact.repository;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import br.icontact.model.company.Company;

@Repository
public class CompanyRepository {
	
	@PersistenceContext(unitName="iContactDevelopment")
	private EntityManager em;
	
	@SuppressWarnings("unchecked")
	public List<Company> getAll(){
		
		String sql = "select * from TJ_COMPANY";
		
		List<Company> companies = em.createNativeQuery(sql, Company.class).getResultList();
		
		return companies;
	}
	
	public Company findById(Long mfir){
		return em.find(Company.class, mfir);
	}
	
 }
