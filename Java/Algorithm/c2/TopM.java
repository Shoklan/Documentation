public class TopM{
	public static void main(String[] args){
		// Print the top M lines in the input stream.
		int M = INteger.parseInt(args[0]);
		MinPQ<Transaction> pq = new MinPQ<Transaction>(M+1);
		while(StdIn.hasNextLine()){
			pq.insert(new Transaction(StdIn.readline()));
			if(pq.size() > M)
				pq.delMin();   // Remove minimum if M+1 entries on the PQ.
		}    // Top M entries are on the PQ.

		Stack<Transacion> stack = new Stack<Transaction>();
		while(!pq.isEmpty()) stack.push(pq.delMin());
		for(Transaction t: stack) StdOut.println(t);
	}
}