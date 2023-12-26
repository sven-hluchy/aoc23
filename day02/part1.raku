sub c(($a,$b)){($a~~'r'&&$b>Ⅻ )|($a~~'g'&&$b>13)|($a~~'b'&&$b>14)}
say lines».&{any(($_~~m:g/(\d+)\s(r)|(\d+)\s(g)|(\d+)\s(b)/)».words»[1,0].map:{c $_})??0!!$_~~m:1st/\d+/}.sum;
