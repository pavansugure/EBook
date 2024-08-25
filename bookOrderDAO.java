package com.DAO;

import java.util.List;

import com.entity.book_order;

public interface bookOrderDAO {

	public boolean saveOrder(List<book_order> blist);

	public List<book_order> getBook(String email);

	public List<book_order> getAllOrder();

}
