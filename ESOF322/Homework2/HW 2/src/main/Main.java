package main;

import main.Database;
import java.util.Scanner;

public class Main {
	
	static Database[] d = new Database[3];
	static Scanner scan = new Scanner(System.in);
	
	public static void main(String[] args)
	{
		d[0] = new Relational();
		d[1] = new NoSQL();
		d[2] = new Graph();
		
		//Set default stategy
		_setStoreStrategy("table");
		
		//Gets data from user
		while(getUserData()){}
	}
	
	public static void _store(String _s)
	{
		for(int i=0; i<3; i++)
		{
			d[i].store(_s);
		}
	}
	
	public static void _setStoreStrategy(String _s)
	{
		long start_time, end_time;
		start_time = System.nanoTime();
		for(int i=0; i<3; i++)
		{
			d[i].setStoreStrategy(_s);
		}
		end_time = System.nanoTime();
		
		System.out.println("Switch_time = " + (end_time - start_time) + "ns" );
	}
	
	public static boolean getUserData()
	{
		System.out.println("Set storage strategy");
		System.out.print("Default=0, Relational=1, NoSql=2, Graph=3, done storing data=anything else: ");
		String input = scan.next();
		int _i = Integer.parseInt(input);
		
		switch (_i)
		{
		case 0:
			getInput();
			break;
		case 1:
			_setStoreStrategy("table");
			getInput();
			break;
		case 2:
			_setStoreStrategy("document");
			getInput();
			break;
		case 3:
			_setStoreStrategy("node");
			getInput();
			break;
		default:
			return false;
		}
		
		return true;
	}
	
	public static String getInput()
	{
		String ret_val = "";
		
		System.out.print("Enter data to store: ");
		_store(scan.next());
		
		return ret_val;
	}
}
