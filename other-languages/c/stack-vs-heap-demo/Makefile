demo: demo.c
	gcc -Wall -Wextra -O2 -o demo demo.c
test: demo
	@./demo | grep -q "short text" && echo "OK"
clean:
	rm -f demo
