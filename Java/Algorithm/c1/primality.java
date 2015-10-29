// It's depressing, but also lucky no better solution exists

public static boolean isPrime(int N){
	if (N < 2) return false;
	for (int i = 2; i*i <= N; i++)
		if (N % i == 0) return false;
	return true;
}
