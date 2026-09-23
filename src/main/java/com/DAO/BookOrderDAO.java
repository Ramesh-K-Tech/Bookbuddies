package com.DAO;

import java.util.List;

import com.entity.Book_Order;

public interface BookOrderDAO {
	
	public boolean saveOrder(List<Book_Order> b);
	
	public List<Book_Order> getBook(int uid);
	
	public List<Book_Order> getAllOrder();
}
