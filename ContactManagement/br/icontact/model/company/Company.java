package br.icontact.model.company;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

import br.icontact.model.contact.Contact;
import lombok.Data;

@Data
@Entity
@Table(name="TJ_COMPANY")
public class Company {

	@Id
	@Column(name="MFIR")
	private Long id;
	
	@Column(name="NAME")
	private String name;
	
	@Column(name="ACTIVITY")
	private String activity;
	
	@Column(name="RELATION")
	private String relation;
	
	@OneToMany
	@JoinColumn(name="ID_COMPANY")
	private List<Contact> contacts;
	
	@Transient
	private String fullName;
	
	public String getfullName(){
		return this.id + " - " + this.name;
	}
}
