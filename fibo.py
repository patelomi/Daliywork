def fibo(n):
	if n>=3:
		return fibo(n-1)+fibo(n-2)
	else:
		return 1