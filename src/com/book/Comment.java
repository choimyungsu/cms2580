package com.book;
//��� 
public class Comment {

 // id 
 private Integer id;

 // ������ID 
 private String contentId;
 
 // bookID 
 private String bookId;

 // ������ 
 private String cDate;
 
 public String getcDate() {
	return cDate;
}

public void setcDate(String cDate) {
	this.cDate = cDate;
}

public String getContentId() {
	return contentId;
}

public void setContentId(String contentId) {
	this.contentId = contentId;
}

public String getBookId() {
	return bookId;
}

public void setBookId(String bookId) {
	this.bookId = bookId;
}

// �ۼ��� 
 private String author;

 // Ŀ��Ʈ 
 private String comment;

 public Integer getId() {
     return id;
 }

 public void setId(Integer id) {
     this.id = id;
 }


 public String getAuthor() {
     return author;
 }

 public void setAuthor(String author) {
     this.author = author;
 }

 public String getComment() {
     return comment;
 }

 public void setComment(String comment) {
     this.comment = comment;
 }

 // CommentTb �� ����
 public void CopyData(Comment param)
 {
     this.id = param.getId();
     this.contentId = param.getContentId();
     this.bookId = param.getBookId();
     this.author = param.getAuthor();
     this.comment = param.getComment();
     this.cDate= param.getcDate();
 }
}