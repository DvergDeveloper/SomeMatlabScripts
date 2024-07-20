function Psi = KursToPsi(kurs)
if (kurs<180)
Psi=-kurs;
else
Psi = 360-kurs;
end
end