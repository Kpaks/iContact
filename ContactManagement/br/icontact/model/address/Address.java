package br.icontact.model.address;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import lombok.Data;

@Data
@Entity
@Table(name="TJ_ADDRESS")
public class Address {

	@Id
	@Column(name="ID")
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "SQ_ADDRESS")
	@SequenceGenerator(name="SQ_ADDRESS", sequenceName = "TJ_SQ_ADDRESS", allocationSize=1)
	private Long id;
	
	@Column(name="TYPE")
	private String type;
	
	@Column(name="NAME")
	private String name;
	
	@Column(name="STREET_NUMBER")
	private String number;
	
	@Column(name="COMPLEMENT")
	private String complement;
	
	@Column(name="DISTRICT")
	private String district;
	
	@Column(name="CITY")
	private String city;
	
	@Column(name="STATE")
	private String state;
	
	@Column(name="COUNTRY")
	private String country;
	
	@Column(name="ZIP_CODE")
	private String zipCode;
	
	@Column(name="MAIN")
	private boolean main;
}
