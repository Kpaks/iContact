package br.icontact.model.phone;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import lombok.Data;

@Data
@Entity
@Table(name="TJ_PHONE")
public class Phone {

	@Id
	@Column(name="ID")
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "SQ_PHONE")
	@SequenceGenerator(name="SQ_PHONE", sequenceName = "TJ_SQ_PHONE", allocationSize=1)
	private Long id;
	
	@Column(name="PHONE_NUMBER")
	private String number;
	
	@Column(name="TYPE")
	@Enumerated(EnumType.STRING)
	private PhoneType type;
	
	@Column(name="MAIN")
	private boolean main;
	
}
