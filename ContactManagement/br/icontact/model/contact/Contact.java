package br.icontact.model.contact;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import br.icontact.model.address.Address;
import br.icontact.model.company.Company;
import br.icontact.model.phone.Phone;
import lombok.Data;

@Data
@Entity
@Table(name="TJ_CONTACT")
public class Contact {
	
	@Id
	@Column(name="ID")
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "SQ_CONTACT")
	@SequenceGenerator(name="SQ_CONTACT", sequenceName = "TJ_SQ_CONTACT", allocationSize=1)
	private Long id;
	
	@Column(name="NAME")
	private String name;
	
	@Column(name="AREA")
	private String area;
	
	@OneToOne
	@JoinColumn(name="ID_COMPANY")
	private Company company;
	
	@OneToMany
	@JoinColumn(name="ID_CONTACT")
	private List<Phone> phones;
	
	@OneToMany
	@JoinColumn(name="ID_CONTACT")
	private List<Address> addresses;
	
}
