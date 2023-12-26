# Part 1

```raku
sub c(($a,$b)){($a~~'r'&&$b>Ⅻ )|($a~~'g'&&$b>13)|($a~~'b'&&$b>14)}
say lines».&{any(($_~~m:g/(\d+)\s(r)|(\d+)\s(g)|(\d+)\s(b)/)».words»[1,0].map:{c $_})??0!!$_~~m:1st/\d+/}.sum;
```

I hacked this thing together in an hour our so. The point is, there probably are
quite a lot of unnecessary characters in the code. There might even be an
approach to this problem which doesn't require such an ugly regex pattern.

It's a lot easier to explain than day one though: We match every line from STDIN
against a regex pattern which captures the starting letter of the colour and the
number of cubes. We then pass all of those tuples into the `c` subroutine. This
subroutine checks whether the number of cubes was higher than expected, with
respect to the colour of the cubes. If there were more cubes than expected, the
subroutine returns true; If `c` returns true for any of those booleans, then we
return 0, else we return the first number of the line, which is the game id.

# Part 2
I really don't like part 2. I don't see a neat way to do it efficiently, but
then again, it's 2 am.
