import java.util.Calendar;
import java.io.File;

public aspect Log {

	File file = new File("log.txt");
    Calendar cal = Calendar.getInstance();
    pointcut Transactionsuccess() : call(* moneyMakeTransaction*(..) ) ;
    after() : Transactionsuccess() {
    	System.out.println("**** Transaction realize ****"+cal);
    }
    pointcut Withdrawalsuccess() : call(* moneyWithdrawal*(..));
    after() : Withdrawalsuccess() {
        System.out.println("**** Withdrawal realize ****"+cal);    	
    }
}
