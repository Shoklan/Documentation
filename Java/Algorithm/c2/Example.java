public class Example{
	public static void sort(Compareable[] a){
		/* See Algorithms 2.1, 2.2, 2.3, 2.4, 2.5, or 2.7 */
	}

	public static void selectionSort(Compareable[] a){
		// Sort a[] into increasing order.
		int N = a.length;
		for(int i = 0; i < N; i++){
			// Exchange a[i] with smallest entry in a[i + 1 ... N].
			int min = i;
			for(int j = i+1; i < N; j++)
				if(less(a[j], a[min])) min = j;
			exch(a, i, min)
		}
	}

	private static boolean less(Compareable v, Compareable w){ return v.CompareTo(w) < 0;}
	private static void    exch(Compareable[] a, int i, int j){
		Compareable t = a[i]; a[i] = a[j]; a[j] = t;
	}

	private static void show(Compareable[] a){
		// Print the array, on a single line.
		for(int i= 0; i < a.length; i++)
			StdOut.print(a[i] + " ");
		StdOut.println();
	}

	public static boolean isSorted(Compareable[] a){
		for(int i = 1; i < a.length; i++)
			if(less(a[i], a[i-1])) return false;
		return true;
	}

	public static void main(String[] args){
		// Read strings from standard input, sort them, and print.
		String[] a = In.readStrings();
		sort(a);
		assert isSorted(a);
		show(a);
	}	
}