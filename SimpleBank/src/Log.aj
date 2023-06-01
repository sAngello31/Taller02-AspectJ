import java.util.Calendar;
import java.io.File;
import java.io.IOException;
import java.io.FileWriter;


public aspect Log {

	File file = new File("log.txt");
    Calendar cal = Calendar.getInstance();
    String mensaje="";
    
    
    public static void escribir(File file, String mensaje) {
    	try {
    		FileWriter archivo=new FileWriter(file,true);
    		archivo.write(mensaje+"\n");
    		archivo.close();
    	}catch(IOException eo){
    		System.out.println("Error al escribir el archivo");
    	}
    }
    pointcut Transactionsuccess() : call(* moneyMakeTransaction*(..) ) ;
    after() : Transactionsuccess() {
    	
    	System.out.println("**** Transaction realize **** "+cal.getTime());
    	mensaje="Transaction realize, fecha: " + cal.getTime();
    	escribir(file,mensaje);
    	
    }
    pointcut Withdrawalsuccess() : call(* moneyWithdrawal*(..));
    after() : Withdrawalsuccess() {
        System.out.println("**** Withdrawal realize **** "+cal.getTime());
        mensaje="Withdrawal realize, fecha:" + cal.getTime();
        escribir(file,mensaje);
    }
}
