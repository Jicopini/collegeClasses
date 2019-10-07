package main;

import main.Database;

public class NoSQL implements Database{
	
	String[] arr = new String[10];
	int i=0;
	String strategy;
	
	public NoSQL()
	{
		
	}
	
	public void store(String _d)
	{
		if(strategy.equals("document")) 
		{
			arr[i++] = _d;
			System.out.println("Storing " + _d + " using NoSql strategy\n");
		}
	}
	
	public void setStoreStrategy(String _s)
	{
		strategy = _s;
	}

}
