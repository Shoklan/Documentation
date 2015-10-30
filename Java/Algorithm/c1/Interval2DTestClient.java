public static void main(String[] args){
	double xlo = Double.parseDouble(args[0]);
	double xhi = Double.parseDouble(args[1]);
	double ylo = Double.parseDouble(args[2]);
	double yhi = Double.parseDouble(args[3]);
	int T = Integer.parseInt(args[4]);

	Interval1D x = new Interval1D(xlo, xhi);
	Interval1D y = new Interval1D(ylo, yhi);
	Interval2D box = new Interval2D(x, y);
	box.draw();

	Counter c = new Counter("hits");
	for(int i = 0; t < T; t++){
		double x = Math.random();
		double y = Math.random();
		Point p = new Point(x, y);
		if(box.contains(p)) c.increment();
		else                p.draw();
	}

	StdOut.println(c);
	StdOut.println(box.area());
}