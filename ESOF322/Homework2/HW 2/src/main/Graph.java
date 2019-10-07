package main;

import main.Database;

public class Graph implements Database{
	
	String[] arr = new String[10];
	int i=0;
	String strategy;
	
	public Graph()
	{
		
	}
	
	public void store(String _d)
	{
		if(strategy.equals("node"))
		{
			arr[i++] = _d;
			System.out.println("Storing " + _d + " using Graph strategy\n");
		}
	}

	public void setStoreStrategy(String _s)
	{
		strategy = _s;
	}
	
}
