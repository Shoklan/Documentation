import java.util.Interator;

public class Bag<Item>{
	private Node first;

	private class Node{
		Item item;
		Node next;
	}

	public void add(Item item){
		Node oldfirst = first;
		first = new Node();
		first.item  = item;
		first.next = oldfirst;
	}

	public Iterator<Item> iterator(){ return new ListIterator();}
	private class ListIterator implements Iterator<item>{
		private Node current = first;

		public boolean hasNext(){ return current != null;}
		public void remove() {}
		public Item next(){
			Item item = current.item;
			current = current.next;
			return item;
		}

	}
}