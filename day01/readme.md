Because the second part is an extension of the first, i.e. the code for the
second part also gives the correct answer to the input of the first,I will only
include the code for the second part.

Here is the code again:
```raku
my @n=('1'…'9')».uniname».words»[1]».lc;
my $a=@n.join('|');
sub c{my %s=(@n Z ('1'…'9')).flat;%s{$^a}||$^a}
say lines».&{($_~~m:ex/<$a>|\d/)[0,*-1].&{Ⅹ*c(.[0])+c(.[1])}}.sum
```
