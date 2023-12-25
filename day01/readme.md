Because the second part is an extension of the first, i.e. the code for the
second part also gives the correct answer to the input of the first,I will only
include the code for the second part.

```raku
my @n=('1'…'9')».uniname».words»[1]».lc;
my $a=@n.join('|');
sub c{my %s=(@n Z ('1'…'9')).flat;%s{$^a}||$^a}
say lines».&{($_~~m:ex/<$a>|\d/)[0,*-1].&{Ⅹ*c(.[0])+c(.[1])}}.sum
```

First we define `@n` as the list of names of the first nine numbers
```raku
(one two three four five six seven eight nine)
```
Using this list, we create a string, `$a` by joining all of those names with the
`|` character. This is done so we can turn the string into a regex expression
later on.
In the third line, we create a function which does a few things: First of all,
it creates a hash map with the names of the numbers as keys and the characters
_representing_ the values as their respective values.

In a more readable version, this might look something lie this:
```raku
my %s = <one 1 two 2 three 3 four 4 five 5 six 6 seven 7 eight 8 nine 9>;
```

After the hash map has been created, we return its respective value. If the
parameter passed to the function, `$^a`, is already a numeric character, we
return it instead. In either case, the function returns a numeric character.

The fourth and last line is a bit more tricky, so I will break it down here:
The `lines».&{...}` simply runs an anonymous function for all line STDIN. The
anonymous function itself is where it gets tricky. Every line is matched against
the regex string we have created in line 2. We use the `:ex` verb to get all
possible matches, even those which overlap with others. From those matches we
take the first and last one and ignore the rest. On those two matches, we run
yet another function which converts both matches to a number, multiplies the
first one by ten and sums both together.

Raku being Raku, instead of saying `10 * ...` to multiply by 10, we can instead
multiply by `Ⅹ`, which is the roman numeral for 10, which, in essence, does the
same thing, but saves us a single character.
