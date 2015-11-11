// Union find solution

public class UF{
	private int[] id;   //access to component id
	private int count;

	public UF(int N){
		count = N;
		id = new int[N];
		for(int i = 0; i < N; i++)
			id[i] = i;
	}

	public int count() { return count;}
	public boolean connected(int p, int q){ return find(p) == find(q);}

	/*
	// START Version 1 - Quick Find:
	public int find(int p){ return id[p];}

	public void union(int p, int q){
		// Put p and q into the same component.
		int pID = find(p);
		int qID = find(q);

		// escape if same
		if(pID == qID) return;

		for(int i = 0; i < id.length; i++)
			if(id[i] == pID) id[i] = qID;
		count--;
	}

	// END Version 1

	// Start Version 2 - Quick Union:
	public int find(int p){
		while(p != id[p]) p = id[p];
		return p;
	}
	
	public void union(int p, int q){}
		int pRoot = find(p);
		int qRoot = find(q);
		if(pRoot == qRoot) return;

		id[pRoot] = qRoot;
		count--;
	}

	// END Version 2
	*/

	public static void main(String[] args){
		// Solve dynamic connectivity problem in StdIn
		int N = StdIn.readInt();
		UF uf = new UF(N);
		while(!StdIn.isEmpty()){
			int p = StdIn.readInt();
			int q = StdIn.readInt();
			if(uf.connected(p,q)) countinue;
			uf.union(p,q);
			StdOut.println(p + " " + q);
		}

		StdOut.println(uf.count() + " components");
	}
}