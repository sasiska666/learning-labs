wc_lines: wc_lines.c
	gcc -Wall -Wextra -O2 -o wc_lines wc_lines.c
test: wc_lines
	@test "$$(./wc_lines sample.txt)" = "3" && echo "OK"
clean:
	rm -f wc_lines
