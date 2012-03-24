package br.com.crm.model.entity;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the TB_PAIS database table.
 * 
 */
@Entity
@Table(name="TB_PAIS")
public class PaisModel implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@SequenceGenerator(name="TB_PAIS_IDPAIS_GENERATOR", sequenceName="SQ_PAIS")
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="TB_PAIS_IDPAIS_GENERATOR")
	@Column(name="ID_PAIS")
	private long idPais;

	@Column(name="IN_SIGLA2")
	private String inSigla2;

	@Column(name="IN_SIGLA3")
	private String inSigla3;

	@Column(name="TX_PAIS")
	private String txPais;

    public PaisModel() {
    }

	public long getIdPais() {
		return this.idPais;
	}

	public void setIdPais(long idPais) {
		this.idPais = idPais;
	}

	public String getInSigla2() {
		return this.inSigla2;
	}

	public void setInSigla2(String inSigla2) {
		this.inSigla2 = inSigla2;
	}

	public String getInSigla3() {
		return this.inSigla3;
	}

	public void setInSigla3(String inSigla3) {
		this.inSigla3 = inSigla3;
	}

	public String getTxPais() {
		return this.txPais;
	}

	public void setTxPais(String txPais) {
		this.txPais = txPais;
	}

}