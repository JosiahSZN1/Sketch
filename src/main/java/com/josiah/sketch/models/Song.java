package com.josiah.sketch.models;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;

@Entity
@Table(name="songs")
public class Song {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	@Column(updatable=false)
	private Date createdAt;
	private Date updatedAt;
//	@OneToOne(mappedBy="song", cascade=CascadeType.ALL, fetch=FetchType.LAZY)
//    private Chorus chorus;

//	@OneToMany(mappedBy="song", fetch = FetchType.LAZY)
//	private List<Verse> verses;
	
	private String title;
	
	private String theme;
	
	private String verse1Line1;
	private String verse1Line2;
	private String verse1Line3;
	private String verse1Line4;
	
	private String chorusLine1;
	private String chorusLine2;
	private String chorusLine3;
	private String chorusLine4;
	
	private String verse2Line1;
	private String verse2Line2;
	private String verse2Line3;
	private String verse2Line4;
	
	private String bridgeLine1;
	private String bridgeLine2;
	private String bridgeLine3;
	private String bridgeLine4;
	
	
//	MAYBE TAKE A STEP BACK WITH SONG STRUCTURE AND JUST ADD CHORUS AND VERSE LINES INDIVIDUALLY TO SONG OBJECT
	
	public String getTheme() {
		return theme;
	}





	public void setTheme(String theme) {
		this.theme = theme;
	}





	public String getVerse1Line1() {
		return verse1Line1;
	}





	public void setVerse1Line1(String verse1Line1) {
		this.verse1Line1 = verse1Line1;
	}





	public String getVerse1Line2() {
		return verse1Line2;
	}





	public void setVerse1Line2(String verse1Line2) {
		this.verse1Line2 = verse1Line2;
	}





	public String getVerse1Line3() {
		return verse1Line3;
	}





	public void setVerse1Line3(String verse1Line3) {
		this.verse1Line3 = verse1Line3;
	}





	public String getVerse1Line4() {
		return verse1Line4;
	}





	public void setVerse1Line4(String verse1Line4) {
		this.verse1Line4 = verse1Line4;
	}





	public String getChorusLine1() {
		return chorusLine1;
	}





	public void setChorusLine1(String chorusLine1) {
		this.chorusLine1 = chorusLine1;
	}





	public String getChorusLine2() {
		return chorusLine2;
	}





	public void setChorusLine2(String chorusLine2) {
		this.chorusLine2 = chorusLine2;
	}





	public String getChorusLine3() {
		return chorusLine3;
	}





	public void setChorusLine3(String chorusLine3) {
		this.chorusLine3 = chorusLine3;
	}





	public String getChorusLine4() {
		return chorusLine4;
	}





	public void setChorusLine4(String chorusLine4) {
		this.chorusLine4 = chorusLine4;
	}





	public String getVerse2Line1() {
		return verse2Line1;
	}





	public void setVerse2Line1(String verse2Line1) {
		this.verse2Line1 = verse2Line1;
	}





	public String getVerse2Line2() {
		return verse2Line2;
	}





	public void setVerse2Line2(String verse2Line2) {
		this.verse2Line2 = verse2Line2;
	}





	public String getVerse2Line3() {
		return verse2Line3;
	}





	public void setVerse2Line3(String verse2Line3) {
		this.verse2Line3 = verse2Line3;
	}





	public String getVerse2Line4() {
		return verse2Line4;
	}





	public void setVerse2Line4(String verse2Line4) {
		this.verse2Line4 = verse2Line4;
	}





	public String getBridgeLine1() {
		return bridgeLine1;
	}





	public void setBridgeLine1(String bridgeLine1) {
		this.bridgeLine1 = bridgeLine1;
	}





	public String getBridgeLine2() {
		return bridgeLine2;
	}





	public void setBridgeLine2(String bridgeLine2) {
		this.bridgeLine2 = bridgeLine2;
	}





	public String getBridgeLine3() {
		return bridgeLine3;
	}





	public void setBridgeLine3(String bridgeLine3) {
		this.bridgeLine3 = bridgeLine3;
	}





	public String getBridgeLine4() {
		return bridgeLine4;
	}





	public void setBridgeLine4(String bridgeLine4) {
		this.bridgeLine4 = bridgeLine4;
	}
	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(
	        name = "writers_songs", 
	        joinColumns = @JoinColumn(name = "song_id"), 
	        inverseJoinColumns = @JoinColumn(name = "user_id")
	    )
	private List <User> writers = new ArrayList<User>();
	
	
	
	public Song() {}
	
	
	
	

	public Long getId() {
		return id;
	}





	public void setId(Long id) {
		this.id = id;
	}





	public Date getCreatedAt() {
		return createdAt;
	}





	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}





	public Date getUpdatedAt() {
		return updatedAt;
	}





	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}





	public String getTitle() {
		return title;
	}





	public void setTitle(String title) {
		this.title = title;
	}





//	public Chorus getChorus() {
//		return chorus;
//	}
//
//
//
//
//
//	public void setChorus(Chorus chorus) {
//		this.chorus = chorus;
//	}





//	public List<Verse> getVerses() {
//		return verses;
//	}
//
//
//
//
//
//	public void setVerses(List<Verse> verses) {
//		this.verses = verses;
//	}





	public List<User> getWriters() {
		return writers;
	}





	public void setWriters(List<User> writers) {
		this.writers = writers;
	}





	@PrePersist
	protected void onCreate(){
		this.createdAt = new Date();
	}
	@PreUpdate
	protected void onUpdate(){
		this.updatedAt = new Date();
	}
}