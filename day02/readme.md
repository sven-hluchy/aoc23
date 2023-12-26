# Part 1

```raku
say lines».&{any(($_~~m:g/(\d+)\s(r)|(\d+)\s(g)|(\d+)\s(b)/)».words»[1,0].map:{my ($a,$b)=$_;.&{($a~~'r'&&$b>Ⅻ)|($a~~'g'&&$b>13)|($a~~'b'&&$b>14)}})??0!!$_~~m:1st/\d+/}.sum;
```

I hacked this thing together in an hour our so. The point is, there probably are
quite a lot of unnecessary characters in the code. There might even be an
approach to this problem which doesn't require such an ugly regex pattern.

It's a lot easier to explain than day one though: We match every line from
`STDIN` against a regex pattern which captures the starting letter of the colour
and the number of cubes. We then unpack the tuple into `$a,$b` and pass these
variables into an anonymous function which checks whether more cubes of that
colour were encountered than expected. If any of the booleans returned by that
subroutine happens to be true, then we return 0 for that line. Otherwise, we
return the first number in the string, which is the game id. Thus, we only sum
the ids of the games which have not violated the rules.

# Part 2
I really don't like part 2. I don't see a neat way to do it efficiently, but
then again, it's 2 am.
