package org.ethan.bean;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="t_tag")
public class Tag {
	
	//1.主键id
	private int id;
	//2.标签的name
	private String name;
	//3.标签的颜色--预留字段，待处理
	private String color;
	//4.标签的字体大小--预留字段，待处理
	private String fontSize;
	
	@Id
	@GeneratedValue
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	@Column(unique=true)
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public String getFontSize() {
		return fontSize;
	}
	public void setFontSize(String fontSize) {
		this.fontSize = fontSize;
	}
	@Override
	public String toString() {
		return "Tag [id=" + id + ", name=" + name + ", color=" + color
				+ ", fontSize=" + fontSize + "]";
	}
}
