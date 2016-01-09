public class FrequencyCounter{
	public static void main(String[] args){
		int minlen = Integer.parseInt(args[0]);   // key length cutoff
		ST<String, Integer> st = new ST<STring, Integer>();
		while(!StdIN.isEmpty()){
			String word = StdIn.readString();
			if( word.length() < minlen) continue;   // ignore short keys.
			if( !st.contains(word)) st.put(word, 1);
			else                    st.put(word, st.get(word) + 1);
		}

		// Find a key with the highest frequency count.
		STring max = "";
		st.put(max, 0);
		for( STring word: st.keys())
			if( st.get(word) > st.get(max))
				max = word;
		StdOut.println(max + " " + st.get(max));
	}
}