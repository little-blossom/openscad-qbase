function firstDef(a=undef, b=undef, c=undef, d=undef) = (a != undef) ? a : ((b != undef) ? b : ((c != undef) ? c : (d)));

module testFirstDefFirst() {
  cube([firstDef(1, 2, 3, 4), 1, 1]);
}

module testFirstDefSecond() {
  cube([firstDef(undef, 2, 3, 4), 1, 1]);
}

module testFirstDefThird() {
  cube([firstDef(undef, undef, 3, 4), 1, 1]);
}

module testFirstDefFourth() {
  cube([firstDef(undef, undef, undef, 4), 1, 1]);
}