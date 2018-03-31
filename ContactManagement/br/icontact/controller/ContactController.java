package br.icontact.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import br.icontact.model.company.Company;
import br.icontact.model.contact.Contact;
import br.icontact.service.CompanyService;
import br.icontact.service.ContactService;

@Controller
@RequestMapping("/")
public class ContactController {
	
	@Autowired
	CompanyService companyService;
	
	@Autowired
	ContactService contactService; 

    @RequestMapping(value=("/"), method = RequestMethod.GET)
    public String getLogin(ModelMap model){
        return "login";
    }
    
    @RequestMapping(value=("/index"), method = RequestMethod.GET)
    public String index (ModelMap model){
        model.addAttribute("companyList", companyService.getAllCompanies());
        return "index";
    }
    
    @RequestMapping(value=("/contacts"), method = RequestMethod.GET)
    public String getPageContacts(ModelMap model, @RequestParam(value="cm") Long mfir){
    	model.addAttribute("company", companyService.findById(mfir));
        return "contact";
    }
    
    @RequestMapping(value=("/form-contact"), method = RequestMethod.GET)
    public String getFormContactPage(ModelMap model, @RequestParam(value="id", required=false) Long id){
    	model.addAttribute("contact",contactService.findById(id));
    	model.addAttribute("companies",companyService.getAllCompanies());
        return "form-contact";
    }
    
    @RequestMapping(value=("/insert"), method = RequestMethod.POST)
    public String insertOrUpdateContact(ModelMap model, @ModelAttribute Contact contact){
    	contactService.insertOrUpdate(contact);
        return "redirect:contacts?cm=" + contact.getCompany().getId();
    }
    
    @RequestMapping(value=("/contact-delete"), method = RequestMethod.GET)
    public String deleteContact(ModelMap model, @RequestParam(value="id", required=false) Long id
    										  , @RequestParam(value="companyId", required=false) Long companyId){
    	
    	contactService.delete(id);
    	
        return "redirect:contacts?cm=" + companyId;
    }
    
}