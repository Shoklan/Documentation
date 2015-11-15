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

	public static void insertionSort(Compareable[] a){
		// Sort a[] into increasing order.
		int N = a.length;
		for(int i = 1; i < N; i++){
			// INsert a[i] among a[i-1], a[i-2], a[i-3]....
			for(int j=i; j > 0 && less(a[j], a[j-1]); j--)
				exch(a, j, j-1);
		}
	}

	public static void shellSort(Compareable[] a){
		// Sort a[] into increasing order.
		int N = a.length;
		int h = 1;
		while(h < N/3) h = 3*h + 1
		while(h >= 1){
			for(int i = h; i < N; i++)
				for(int j = i; j >= h && less(a[j], a[j-h]); j -= h)
					exch(a, j, j-h);
		}
		
		h = h/3;
	}

	public static void mergeSort(Compareable[] a, int lo, int mid, int hi){
		// Merge a[lo..mid] with a[mid+1..hi].
		int i = lo, j= mid+1;

		for(int k = lo; k <= hi; k++)
			aux[k] = a[k];

		for(int k = lo; k <= hi; k++){
			if     (i > mid)              a[k] = aux[j++];
			else if(j > hi)               a[k] = aux[i++];
			else if(less(aux[j], aux[i])) a[k] = aux[j++];
			else                          a[k] = aux[i++];
		}
	}

	public static void quickSort(Compareable[] a){
		StdRandom.shuffle(a);
		quickSort(a, 0, a.length -1);
	}

	private static void quickSort(Compareable[] a, int lo, int hi){
		if(hi <= lo) return;
		int j = partition(a, lo, hi);
		quickSort(a, lo, j-1);         // Sort left part a[lo .. j-1].
		quickSort(a, j+1, hi);         // Sort right part a[j+1 .. hi].
	}

	private static int partition(Compareable[] a, int lo, int hi){
		// Partition into a[lo .. i-1], a[i], a[i+1..hi].
		int i = lo, j= hi+1
		Compareable v = a[lo];
		while(true){
			while(less(a[++i], v)) if(i == hi) break;
			while(less(v, a[--j])) if(j == lo) break;
			if(i >= j) break;
			exch(a, i, j);
		}
		exch(a, lo, j);
		return j;
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