package br.icontact.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import br.icontact.model.company.Company;
import br.icontact.repository.CompanyRepository;

@Service
public class CompanyService {

	@Autowired
	private CompanyRepository companyRepository;
	
	public List<Company> getAllCompanies(){
		return companyRepository.getAll();
	}
	
	
	public Company findById(Long mfir){
		if (mfir!=null) {
			return companyRepository.findById(mfir);
		}
		return null;
	}
}
