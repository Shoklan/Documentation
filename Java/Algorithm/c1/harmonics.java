// Harmonics is, I think, Calc II?
// It's been a long time since I've seen that.

public static double H(int N){
	double sum = 0.0;
	for (int i = 1; i <= N; i++)
		sum += 1.0 / i;
	return sum;
}