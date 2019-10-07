package main;

import main.Database;

public class Relational implements Database{
	
	String[] arr = new String[10];
	int i=0;
	String strategy;
	
	public Relational()
	{
		
	}
	
	public void store(String _d)
	{
		if(strategy.equals("table"))
		{
			arr[i++] = _d;
			System.out.println("Storing " + _d + " using Relational strategy\n");
		}
	}
	

	public void setStoreStrategy(String _s)
	{
		strategy = _s;
	}
}
