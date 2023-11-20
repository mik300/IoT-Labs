prompt = "What is the value of Ttr1? ";
input1 = input(prompt);
Ttr1 = input1 * (10^-3) %Unit miliseconds

prompt = "What is the value of Ttr2? ";
input2 = input(prompt);
Ttr2 = input2 * (10^-3) %Unit miliseconds

prompt = "What is the value of Pon? ";
input3 = input(prompt);
Pon = input3 * (10^-3) %Unit miliWatts

prompt = "What is the value of Poff? ";
input4 = input(prompt);
Poff = input4 * (10^-3) %Unit miliseconds

prompt = "What is the value of Etr1? ";
input5 = input(prompt);
Etr1 = input5 * (10^-3) %Unit miliJules

prompt = "What is the value of Etr2? ";
input6 = input(prompt);
Etr2 = input6 * (10^-3) %Unit miliJules

Ptr = (Etr1 + Etr2) / (Ttr1 + Ttr2)

Ttr= Ttr1 + Ttr2

Tbevalue = Ttr + Ttr * ((Ptr - Pon) / (Pon - Poff))
