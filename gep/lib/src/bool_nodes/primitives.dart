// -*- compile-command: "cd ../../.. && ./df.sh"; -*-

bool gepNand(bool x, bool y) => (!(x && y));

bool gepNor(bool x, bool y) => (!(x || y));

bool gepXor(bool x, bool y) => ((x || y) && !(x && y));

bool gepNxor(bool x, bool y) => ((!(x || y)) || (x && y));

bool gepAnd3(bool x, bool y, bool z) => (x && y && z);

bool gepOr3(bool x, bool y, bool z) => (x || y || z);

bool gepNand3(bool x, bool y, bool z) => (!(x && y && z));

bool gepNor3(bool x, bool y, bool z) => (!(x || y || z));

bool gepOdd3(bool x, bool y, bool z) =>
    ((!(((!(x && y)) && (x || y)) && z)) && (((!(x && y)) && (x || y)) || z));

bool gepEven3(bool x, bool y, bool z) =>
    ((!((!(x)) && ((!(y && z)) && (y || z)))) &&
        ((!(x)) || ((!(y && z)) && (y || z))));

bool gepAnd4(bool a, bool b, bool c, bool d) => (a && b && c && d);

bool gepOr4(bool a, bool b, bool c, bool d) => (a || b || c || d);

bool gepNand4(bool a, bool b, bool c, bool d) => (!(a && b && c && d));

bool gepNor4(bool a, bool b, bool c, bool d) => (!(a || b || c || d));

bool gepOdd4(bool a, bool b, bool c, bool d) =>
    ((!(((!(((!(a && b)) && (a || b)) && c)) &&
                (((!(a && b)) && (a || b)) || c)) &&
            d)) &&
        (((!(((!(a && b)) && (a || b)) && c)) &&
                (((!(a && b)) && (a || b)) || c)) ||
            d));

bool gepEven4(bool a, bool b, bool c, bool d) =>
    ((!(((!(((!(a || b)) || (a && b)) || c)) ||
                (((!(a || b)) || (a && b)) && c)) ||
            d)) ||
        (((!(((!(a || b)) || (a && b)) || c)) ||
                (((!(a || b)) || (a && b)) && c)) &&
            d));

bool gepLT(bool x, bool y) => ((!(x)) && y);

bool gepGT(bool x, bool y) => (x && (!(y)));

bool gepLOE(bool x, bool y) => ((!(x)) || y);

bool gepGOE(bool x, bool y) => (x || (!(y)));

bool gepLT3(bool x, bool y, bool z) => ((!((!(x)) && y)) && z);

bool gepGT3(bool x, bool y, bool z) => ((x && (!(y))) && (!(z)));

bool gepLOE3(bool x, bool y, bool z) => ((!((!(x)) || y)) || z);

bool gepGOE3(bool x, bool y, bool z) => (x || (!(y && z)));

bool gepMux(bool x, bool y, bool z) => (((!(x)) && y) || (x && z));

bool gepIf(bool x, bool y, bool z) => (((!(x)) && z) || (x && y));

bool gepMaj(bool x, bool y, bool z) => (((x || z) && y) || (x && z));

bool gepMin(bool x, bool y, bool z) => (!(((x || z) && y) || (x && z)));

bool gep2Off(bool x, bool y, bool z) =>
    (!((!((x || y) || z)) || (((x && z) || y) && (x || z))));

bool gep2On(bool x, bool y, bool z) =>
    ((!((x && y) && z)) && ((x && (y || z)) || (y && z)));

bool gepLM3A1(bool x, bool y, bool z) => ((x && (!(z))) || (y && z));

bool gepLM3A2(bool x, bool y, bool z) => ((x || z) && (!(y && z)));

bool gepLM3A3(bool x, bool y, bool z) => ((!(x || z)) || (y && z));

bool gepLM3A4(bool x, bool y, bool z) => (!((x || z) && (y || (!(z)))));

bool gepLM3B1(bool x, bool y, bool z) => ((x || (!(z))) && (y || z));

bool gepLM3B2(bool x, bool y, bool z) => ((x && z) || (!(y || z)));

bool gepLM3B3(bool x, bool y, bool z) => ((!(x && z)) && (y || z));

bool gepLM3B4(bool x, bool y, bool z) => (!((x && z) || (y && (!(z)))));

bool gepLM3C1(bool x, bool y, bool z) => ((x && (!(y))) || (y && z));

bool gepLM3C2(bool x, bool y, bool z) => ((x || y) && (!(y && z)));

bool gepLM3C3(bool x, bool y, bool z) => ((!(x || y)) || (y && z));

bool gepLM3C4(bool x, bool y, bool z) => (!((x && (!(y))) || (y && z)));

bool gepLM3D1(bool x, bool y, bool z) => ((x || (!(y))) && (y || z));

bool gepLM3D2(bool x, bool y, bool z) => ((x && y) || (!(y || z)));

bool gepLM3D3(bool x, bool y, bool z) => ((!(x && y)) && (y || z));

bool gepLM3D4(bool x, bool y, bool z) => (!((x || (!(y))) && (y || z)));

bool gepLM3E1(bool x, bool y, bool z) => ((!(x && y)) && (x || z));

bool gepLM3E2(bool x, bool y, bool z) => ((!(x || z)) || (x && y));

bool gepLM3E3(bool x, bool y, bool z) => (!(((!(x)) && z) || (x && y)));

bool gepLM3F1(bool x, bool y, bool z) => ((!(x || y)) || (x && z));

bool gepLM3F2(bool x, bool y, bool z) => ((!(x && z)) && (x || y));

bool gepLM3F3(bool x, bool y, bool z) => (!(((!(x)) || z) && (x || y)));

bool gepLM3G1(bool x, bool y, bool z) =>
    ((!((x || z) && y)) && ((x && z) || y));

bool gepLM3G2(bool x, bool y, bool z) =>
    ((!((x || y) || z)) || (x && (y && z)));

bool gepLM3G3(bool x, bool y, bool z) =>
    ((!((x || y) && z)) && ((x && y) || z));

bool gepLM3G4(bool x, bool y, bool z) =>
    ((!(x && (y || z))) && (x || (y && z)));

bool gepLM3H1(bool x, bool y, bool z) => (!((!(x && y)) && z));

bool gepLM3H2(bool x, bool y, bool z) => (!(x && (!(y && z))));

bool gepLM3H3(bool x, bool y, bool z) => (!((!(x || y)) || z));

bool gepLM3H4(bool x, bool y, bool z) => (!(x || (!(y || z))));

bool gepLT3A(bool x, bool y, bool z) => ((x && (!(z))) || (!(y)));

bool gepGT3A(bool x, bool y, bool z) => (((!(x)) || (y || z)) && (!(y && z)));

bool gepLOE3A(bool x, bool y, bool z) => (x && ((!(y)) || z));

bool gepGOE3A(bool x, bool y, bool z) =>
    (!(((x || z) || (!(y))) && (!(x && z))));

bool gepET3A(bool x, bool y, bool z) =>
    ((x && ((!(y)) || z)) || ((!(x || z)) && y));

bool gepNET3A(bool x, bool y, bool z) =>
    ((((x && y) || z) && (!(y && z))) || (!(x || y)));

bool gepLT3B(bool x, bool y, bool z) => (((!(x)) || z) && y);

bool gepGT3B(bool x, bool y, bool z) =>
    (!(((!(x)) || (y || z)) && (!(y && z))));

bool gepLOE3B(bool x, bool y, bool z) => ((!(x)) || (y && (!(z))));

bool gepGOE3B(bool x, bool y, bool z) => ((!(x && z)) && ((x || z) || (!(y))));

bool gepET3B(bool x, bool y, bool z) =>
    ((!(x || y)) || (((x || z) && y) && (!(x && z))));

bool gepNET3B(bool x, bool y, bool z) =>
    ((x && (!(y || z))) || (((!(x)) || z) && y));

bool gepLT3C(bool x, bool y, bool z) =>
    (!(((!(x)) && (y && z)) || (!(y || z))));

bool gepGT3C(bool x, bool y, bool z) => (((!(x)) && z) || y);

bool gepLOE3C(bool x, bool y, bool z) => ((!(x || z)) || ((x && z) && (!(y))));

bool gepGOE3C(bool x, bool y, bool z) => ((!(x)) && (y || (!(z))));

bool gepET3C(bool x, bool y, bool z) =>
    (((x && (!(y))) && z) || (!(x || ((!(y)) && z))));

bool gepNET3C(bool x, bool y, bool z) =>
    ((x && y) || ((!((x || y) && z)) && (y || z)));

bool gepT004(bool x, bool y, bool z) => ((!(x || z)) && y);

bool gepT008(bool x, bool y, bool z) => ((!(x)) && (y && z));

bool gepT009(bool x, bool y, bool z) =>
    ((!((x || y) || z)) || ((!(x)) && (y && z)));

bool gepT032(bool x, bool y, bool z) => ((x && z) && (!(y)));

bool gepT033(bool x, bool y, bool z) => (!(((x || z) && (!(x && z))) || y));

bool gepT041(bool x, bool y, bool z) =>
    ((!((x || y) || z)) || ((!(x && y)) && ((x || y) && z)));

bool gepT055(bool x, bool y, bool z) => (!((x || z) && y));

bool gepT057(bool x, bool y, bool z) =>
    (((x || (y && z)) || (!(y || z))) && (!(x && y)));

bool gepT064(bool x, bool y, bool z) => ((x && y) && (!(z)));

bool gepT065(bool x, bool y, bool z) => (((x && y) || (!(x || y))) && (!(z)));

bool gepT069(bool x, bool y, bool z) => (!((x && (!(y))) || z));

bool gepT073(bool x, bool y, bool z) =>
    ((!(x || (y || z))) || (((x || z) && y) && (!(x && z))));

bool gepT081(bool x, bool y, bool z) => ((x || (!(y))) && (!(z)));

bool gepT089(bool x, bool y, bool z) =>
    (!(((x || (!(y))) && z) || (!((x || (!(y))) || z))));

bool gepT093(bool x, bool y, bool z) => (((!(x)) && y) || (!(z)));

bool gepT096(bool x, bool y, bool z) => ((x && (y || z)) && (!(y && z)));

bool gepT101(bool x, bool y, bool z) =>
    (((x && (y || z)) || (!(x || z))) && (!(y && z)));

bool gepT109(bool x, bool y, bool z) =>
    ((!(x && (y && z))) && (((x && z) || y) || (!(x || z))));

bool gepT111(bool x, bool y, bool z) => (!(x && ((!(y || z)) || (y && z))));

bool gepT121(bool x, bool y, bool z) =>
    (((x || (y && z)) || (!(y || z))) && (!((x && y) && z)));

bool gepT123(bool x, bool y, bool z) => ((!(y)) || ((!(x && z)) && (x || z)));

bool gepT125(bool x, bool y, bool z) => (!(((x && y) || (!(x || y))) && z));

bool gepT154(bool x, bool y, bool z) =>
    (((x && (!(y))) || z) && ((!(x && z)) || y));

bool gepT223(bool x, bool y, bool z) => (((!(x)) || y) || (!(z)));

bool gepT239(bool x, bool y, bool z) => ((!(x)) || (y || z));

bool gepT249(bool x, bool y, bool z) => ((x || (y && z)) || (!(y || z)));

bool gepT251(bool x, bool y, bool z) => ((x || z) || (!(y)));

bool gepT253(bool x, bool y, bool z) => ((x || y) || (!(z)));

bool gepLT4(bool a, bool b, bool c, bool d) =>
    ((!((!((!(a)) && b)) && c)) && d);

bool gepGT4(bool a, bool b, bool c, bool d) =>
    (((a && (!(b))) && (!(c))) && (!(d)));

bool gepLOE4(bool a, bool b, bool c, bool d) =>
    ((!((!((!(a)) || b)) || c)) || d);

bool gepGOE4(bool a, bool b, bool c, bool d) =>
    (((a || (!(b))) || (!(c))) || (!(d)));

bool gepTie(bool a, bool b, bool c, bool d) =>
    (!((!((((a && b) || c) || d) && ((a || b) || (c && d)))) ||
        ((((a && c) || (!(b))) || d) && (((a && d) && (b || c)) || (b && c)))));

bool gepNtie(bool a, bool b, bool c, bool d) =>
    ((!(((a && d) || (b && c)) || ((a || d) && (b || c)))) ||
        (((a || b) && (c && d)) || ((a && b) && (c || d))));

bool gep3Off(bool a, bool b, bool c, bool d) =>
    ((!(((a || d) && b) || (a && d))) && ((a || (b || d)) && (!(c))));

bool gep3On(bool a, bool b, bool c, bool d) =>
    (!((!((((a && b) || (c && d)) && (a || b)) && ((c && (!(d))) || d))) ||
        (a && (b && (c && d)))));

bool gepLM4A1(bool a, bool b, bool c, bool d) =>
    ((a || d) && ((b || c) || (!(d))));

bool gepLM4A2(bool a, bool b, bool c, bool d) =>
    (((a || d) && (!(b && d))) || (c && d));

bool gepLM4A3(bool a, bool b, bool c, bool d) =>
    ((a || d) && (b || (!(c && d))));

bool gepLM4A4(bool a, bool b, bool c, bool d) =>
    ((a || d) && (!((b && c) && d)));

bool gepLM4A5(bool a, bool b, bool c, bool d) =>
    ((!(a || d)) || ((b || c) && d));

bool gepLM4A6(bool a, bool b, bool c, bool d) =>
    (!((a && (!(d))) || ((b && d) && (!(c)))));

bool gepLM4A7(bool a, bool b, bool c, bool d) =>
    ((!(a || d)) || ((b || (!(c))) && d));

bool gepLM4A8(bool a, bool b, bool c, bool d) =>
    (!((a || d) && ((b && c) || (!(d)))));

bool gepLM4B1(bool a, bool b, bool c, bool d) =>
    ((a && d) || ((b && c) && (!(d))));

bool gepLM4B2(bool a, bool b, bool c, bool d) =>
    ((a && d) || ((!(b || d)) && c));

bool gepLM4B3(bool a, bool b, bool c, bool d) =>
    ((a && d) || (!((!(b)) || (c || d))));

bool gepLM4B4(bool a, bool b, bool c, bool d) =>
    ((a && d) || (!((b || c) || d)));

bool gepLM4B5(bool a, bool b, bool c, bool d) =>
    ((!(a && d)) && ((b && c) || d));

bool gepLM4B6(bool a, bool b, bool c, bool d) =>
    ((!((a || (!(d))) && (b || d))) && (c || d));

bool gepLM4B7(bool a, bool b, bool c, bool d) =>
    (((!(a)) && d) || (!((!(b)) || (c || d))));

bool gepLM4B8(bool a, bool b, bool c, bool d) =>
    (!((a && d) || ((b || c) && (!(d)))));

bool gepLM4C1(bool a, bool b, bool c, bool d) =>
    ((a || b) && ((!(b)) || (c || d)));

bool gepLM4C2(bool a, bool b, bool c, bool d) =>
    ((a || b) && (((!(b)) || (!(c))) || d));

bool gepLM4C3(bool a, bool b, bool c, bool d) =>
    ((a || b) && ((!(b && d)) || c));

bool gepLM4C4(bool a, bool b, bool c, bool d) =>
    (!((!(a || b)) || ((b && c) && d)));

bool gepLM4C5(bool a, bool b, bool c, bool d) =>
    ((!(a || b)) || (b && (c || d)));

bool gepLM4C6(bool a, bool b, bool c, bool d) =>
    ((!(a || b)) || (b && ((!(c)) || d)));

bool gepLM4C7(bool a, bool b, bool c, bool d) =>
    ((!(a || b)) || (b && (c || (!(d)))));

bool gepLM4C8(bool a, bool b, bool c, bool d) =>
    (!((a || b) && ((!(b)) || (c && d))));

bool gepLM4D1(bool a, bool b, bool c, bool d) =>
    ((a && b) || ((!(b)) && (c && d)));

bool gepLM4D2(bool a, bool b, bool c, bool d) =>
    ((a && b) || ((!(b || c)) && d));

bool gepLM4D3(bool a, bool b, bool c, bool d) =>
    (!((!(a && b)) && ((b || (!(c))) || d)));

bool gepLM4D4(bool a, bool b, bool c, bool d) =>
    ((a && b) || (!((b || c) || d)));

bool gepLM4D5(bool a, bool b, bool c, bool d) =>
    ((!(a && b)) && (b || (c && d)));

bool gepLM4D6(bool a, bool b, bool c, bool d) =>
    ((!(a && b)) && (b || ((!(c)) && d)));

bool gepLM4D7(bool a, bool b, bool c, bool d) =>
    (!((a || (!(b))) && ((b || (!(c))) || d)));

bool gepLM4D8(bool a, bool b, bool c, bool d) =>
    (!((a && b) || ((!(b)) && (c || d))));

bool gepLM4E1(bool a, bool b, bool c, bool d) =>
    ((a || c) && ((b || (!(c))) || d));

bool gepLM4E2(bool a, bool b, bool c, bool d) =>
    ((a || c) && ((!(b && c)) || d));

bool gepLM4E3(bool a, bool b, bool c, bool d) =>
    ((a || c) && (b || (!(c && d))));

bool gepLM4E4(bool a, bool b, bool c, bool d) =>
    ((a || c) && (!((b && c) && d)));

bool gepLM4E5(bool a, bool b, bool c, bool d) =>
    ((!(a || c)) || ((b || d) && c));

bool gepLM4E6(bool a, bool b, bool c, bool d) =>
    (!((a && (!(c))) || ((b && c) && (!(d)))));

bool gepLM4E7(bool a, bool b, bool c, bool d) =>
    (((!(a)) || c) && ((b || (!(c))) || (!(d))));

bool gepLM4E8(bool a, bool b, bool c, bool d) =>
    (!((a || c) && ((b && d) || (!(c)))));

bool gepLM4F1(bool a, bool b, bool c, bool d) =>
    ((a && c) || ((b && (!(c))) && d));

bool gepLM4F2(bool a, bool b, bool c, bool d) =>
    ((a && c) || ((!(b || c)) && d));

bool gepLM4F3(bool a, bool b, bool c, bool d) =>
    ((a && c) || (b && (!(c || d))));

bool gepLM4F4(bool a, bool b, bool c, bool d) =>
    ((a && c) || (!((b || c) || d)));

bool gepLM4F5(bool a, bool b, bool c, bool d) =>
    ((!(a && c)) && ((b && d) || c));

bool gepLM4F6(bool a, bool b, bool c, bool d) =>
    (!((a || (!(c))) && ((b || c) || (!(d)))));

bool gepLM4F7(bool a, bool b, bool c, bool d) =>
    (!((a || (!(c))) && ((!(b)) || (c || d))));

bool gepLM4F8(bool a, bool b, bool c, bool d) =>
    (((!(a)) && c) || (!((b || c) || d)));

bool gepLM4G1(bool a, bool b, bool c, bool d) =>
    (((!(a)) || (b || c)) && (a || d));

bool gepLM4G2(bool a, bool b, bool c, bool d) =>
    ((!((a && b) && (!(c)))) && (a || d));

bool gepLM4G3(bool a, bool b, bool c, bool d) =>
    ((a || d) && ((!(a && c)) || b));

bool gepLM4G4(bool a, bool b, bool c, bool d) =>
    ((!((a && b) && c)) && (a || d));

bool gepLM4G5(bool a, bool b, bool c, bool d) =>
    ((a && (b || c)) || (!(a || d)));

bool gepLM4G6(bool a, bool b, bool c, bool d) =>
    ((a && ((!(b)) || c)) || (!(a || d)));

bool gepLM4G7(bool a, bool b, bool c, bool d) =>
    (!(((a && (!(b))) && c) || ((!(a)) && d)));

bool gepLM4G8(bool a, bool b, bool c, bool d) =>
    ((!((a && b) && c)) && (a || (!(d))));

bool gepLM4H1(bool a, bool b, bool c, bool d) =>
    (((!(a)) && (b && c)) || (a && d));

bool gepLM4H2(bool a, bool b, bool c, bool d) =>
    ((((!(a)) && (!(b))) && c) || (a && d));

bool gepLM4H3(bool a, bool b, bool c, bool d) =>
    ((a && d) || ((!(a || c)) && b));

bool gepLM4H4(bool a, bool b, bool c, bool d) =>
    (!(((a || b) || c) && (!(a && d))));

bool gepLM4H5(bool a, bool b, bool c, bool d) =>
    (((!(a)) && (b && c)) || (a && (!(d))));

bool gepLM4H6(bool a, bool b, bool c, bool d) =>
    ((a || ((!(b)) && c)) && (!(a && d)));

bool gepLM4H7(bool a, bool b, bool c, bool d) =>
    ((a || (b && (!(c)))) && (!(a && d)));

bool gepLM4H8(bool a, bool b, bool c, bool d) =>
    (!(((!(a)) && (b || c)) || (a && d)));

bool gepLM4I1(bool a, bool b, bool c, bool d) =>
    (!((!((!(a && b)) && c)) && d));

bool gepLM4I2(bool a, bool b, bool c, bool d) =>
    (!(a && (!(b && (!(c && d))))));

bool gepLM4I3(bool a, bool b, bool c, bool d) =>
    (!((!(a && (!(b && c)))) && d));

bool gepLM4I4(bool a, bool b, bool c, bool d) =>
    (!(a && (!((!(b && c)) && d))));

bool gepLM4I5(bool a, bool b, bool c, bool d) =>
    (!((!((!(a || b)) || c)) || d));

bool gepLM4I6(bool a, bool b, bool c, bool d) =>
    (!(a || (!(b || (!(c || d))))));

bool gepLM4I7(bool a, bool b, bool c, bool d) =>
    (!((!(a || (!(b || c)))) || d));

bool gepLM4I8(bool a, bool b, bool c, bool d) =>
    (!(a || (!((!(b || c)) || d))));

bool gepLT4A(bool a, bool b, bool c, bool d) =>
    ((((!(a)) && b) && c) || ((a || (!(b))) && d));

bool gepGT4A(bool a, bool b, bool c, bool d) =>
    (((a && (!(b))) && c) || (((!(a)) || b) && d));

bool gepLOE4A(bool a, bool b, bool c, bool d) =>
    (((a && (!(b))) || c) && ((!(a)) || (b || d)));

bool gepGOE4A(bool a, bool b, bool c, bool d) =>
    ((((!(a)) && b) || c) && ((a || (!(b))) || d));

bool gepET4A(bool a, bool b, bool c, bool d) =>
    ((((a && b) || (!(a || b))) && c) || ((!(a && b)) && ((a || b) && d)));

bool gepNET4A(bool a, bool b, bool c, bool d) =>
    ((((a && b) || c) || (!(a || b))) && (((a || b) && (!(a && b))) || d));

bool gepLT4B(bool a, bool b, bool c, bool d) =>
    ((a || ((!(b)) || (c && d))) && (!((a || (!(b))) && d)));

bool gepGT4B(bool a, bool b, bool c, bool d) =>
    (((a && (!(b))) && (c && d)) || (!((a && (!(b))) || d)));

bool gepLOE4B(bool a, bool b, bool c, bool d) =>
    ((((!(a)) || b) && (c && d)) || (a && ((!(b)) && (!(d)))));

bool gepGOE4B(bool a, bool b, bool c, bool d) =>
    ((((a || (!(b))) && c) && d) || ((!(a || d)) && b));

bool gepET4B(bool a, bool b, bool c, bool d) =>
    ((((a && b) || (!(a || b))) && (c && d)) ||
        ((a || b) && (!((a && b) || d))));

bool gepNET4B(bool a, bool b, bool c, bool d) =>
    (!(((a && b) || (!((a || b) && (c && d)))) &&
        (((a || b) && (!(a && b))) || d)));

bool gepLT4C(bool a, bool b, bool c, bool d) =>
    ((((!(a)) && b) && (c || d)) || ((!((!(a)) && b)) && (!(d))));

bool gepGT4C(bool a, bool b, bool c, bool d) =>
    (((a && (!(b))) && (c || d)) || (!((a && (!(b))) || d)));

bool gepLOE4C(bool a, bool b, bool c, bool d) =>
    ((((a && (!(b))) || c) || d) && ((!(a && d)) || b));

bool gepGOE4C(bool a, bool b, bool c, bool d) =>
    ((((!(a)) && b) || (c || d)) && (a || (!(b && d))));

bool gepET4C(bool a, bool b, bool c, bool d) =>
    (((((a || b) && (!(a && b))) || c) || d) &&
        ((a && b) || (!((a || b) && d))));

bool gepNET4C(bool a, bool b, bool c, bool d) =>
    (!(((a && b) || (!((a || b) && (c || d)))) &&
        (((a || b) && (!(a && b))) || d)));

bool gepLT4D(bool a, bool b, bool c, bool d) => (!(((!(a)) && b) || (c && d)));

bool gepGT4D(bool a, bool b, bool c, bool d) =>
    (!(((((!(a)) || b) && c) && d) || (a && (!(b || d)))));

bool gepLOE4D(bool a, bool b, bool c, bool d) =>
    (a && ((!(b || (c && d))) || (b && d)));

bool gepGOE4D(bool a, bool b, bool c, bool d) =>
    (((!(a || (c && d))) && b) || (a && d));

bool gepET4D(bool a, bool b, bool c, bool d) =>
    ((a || b) && (!(((a && b) || (c && d)) && (!((a && b) && d)))));

bool gepNET4D(bool a, bool b, bool c, bool d) =>
    (((a && (!(b))) || (!(c && d))) && ((!(a || b)) || (a && (b || d))));

bool gepLT4E(bool a, bool b, bool c, bool d) => (((!(a)) && b) || (a && c));

bool gepGT4E(bool a, bool b, bool c, bool d) =>
    (a && ((b && c) || (!(b || d))));

bool gepLOE4E(bool a, bool b, bool c, bool d) =>
    ((!(a)) || ((b || c) && (!(b && d))));

bool gepGOE4E(bool a, bool b, bool c, bool d) => ((a || (!(b))) && (!(a && d)));

bool gepET4E(bool a, bool b, bool c, bool d) =>
    (((a && (b || c)) || (!(a || b))) && (!(b && d)));

bool gepNET4E(bool a, bool b, bool c, bool d) =>
    ((((!(a)) || c) && b) || ((a && (!(b))) && (!(d))));

bool gepQ0002(bool a, bool b, bool c, bool d) =>
    ((((!(a)) && (!(b))) && (!(c))) && d);

bool gepQ001C(bool a, bool b, bool c, bool d) =>
    (!((a || (b && (c || d))) || (!(b || c))));

bool gepQ0048(bool a, bool b, bool c, bool d) =>
    ((((!(a)) && (b || d)) && (!(b && d))) && c);

bool gepQ0800(bool a, bool b, bool c, bool d) => (((a && (!(b))) && c) && d);

bool gepQ3378(bool a, bool b, bool c, bool d) =>
    ((!((a || (b && d)) && c)) && ((a || (c && d)) || b));

bool gepQ3475(bool a, bool b, bool c, bool d) =>
    (!((a || d) && ((!(b || c)) || ((b || d) && c))));

bool gepQ3CB0(bool a, bool b, bool c, bool d) =>
    ((((!(a)) && d) || ((!(b)) || (!(c)))) && ((a && c) || b));

bool gepQ3DEF(bool a, bool b, bool c, bool d) =>
    ((!((((a && d) || c) && (!(c))) || b)) ||
        ((((a || c) || d) && (!(a && c))) && b));

bool gepQ3DFF(bool a, bool b, bool c, bool d) =>
    ((!(a)) || ((!(b && c)) && ((b || c) || (!(d)))));

bool gepQ4200(bool a, bool b, bool c, bool d) =>
    ((((a && c) || (!(b))) && ((a && d) || b)) && (!(c && d)));

bool gepQ4C11(bool a, bool b, bool c, bool d) =>
    (!((a || (c || d)) && (!((a && ((!(b)) || (!(d)))) && c))));

bool gepQ5100(bool a, bool b, bool c, bool d) =>
    ((a && (b || (!(c)))) && (!(d)));

bool gepQ5EEF(bool a, bool b, bool c, bool d) =>
    ((((!(a || b)) || c) || ((a || d) && (b || d))) && (!((a && b) && d)));

bool gepQ5EFF(bool a, bool b, bool c, bool d) =>
    ((!(a)) || (((b || c) || d) && (!(b && d))));

bool gepQ6A6D(bool a, bool b, bool c, bool d) =>
    ((!((!(((a || c) && d) || (b && (c || d)))) &&
            (!((!(a)) && ((!(b)) && (!(d))))))) &&
        (!(b && (c && d))));

bool gepQ6F75(bool a, bool b, bool c, bool d) =>
    (!((((!(a || b)) || b) && ((a && (!(c))) || d)) &&
        (((!(b)) || (!(d))) || c)));

bool gepQ74C4(bool a, bool b, bool c, bool d) =>
    ((((!(a)) && b) || (!(c && d))) && ((a && b) || c));

bool gepQ7DA3(bool a, bool b, bool c, bool d) =>
    ((a && (!((((a && c) && b) || (!(b || c))) && d))) ||
        ((!(a)) && ((!(b || c)) || (b && d))));

bool gepQ8304(bool a, bool b, bool c, bool d) =>
    (((!(((a || d) && c) || b)) || (((a && b) && c) && d)) && (a || c));

bool gepQ8430(bool a, bool b, bool c, bool d) =>
    (((!(a || c)) && b) || (((a && c) && ((!(b)) || d)) && (b || (!(d)))));

bool gepQ8543(bool a, bool b, bool c, bool d) =>
    ((!((a && d) || (((!(a && d)) && ((!(a)) && (b || c))) || b))) ||
        (((((!(a)) && ((b || c) && (!(d)))) || (a && d)) && b) && c));

bool gepQ9D80(bool a, bool b, bool c, bool d) =>
    ((((a || b) && c) && d) || ((a && (!(d))) && (!(b && c))));

bool gepQA092(bool a, bool b, bool c, bool d) =>
    (((!(((a || b) && d) || (a || c))) && (((a && c) || b) || d)) ||
        ((a || c) && (b && d)));

bool gepQB36A(bool a, bool b, bool c, bool d) => ((a || ((b && c) || d)) &&
    (!((((!(a && d)) || (!(b))) && (a || (b && d))) && c)));

bool gepQCBCF(bool a, bool b, bool c, bool d) =>
    ((!((a && c) || b)) || ((b || d) && c));

bool gepQEEB1(bool a, bool b, bool c, bool d) =>
    (((!(a || c)) || ((a && c) || d)) && ((a || b) || (!(d))));

bool gepQEFFF(bool a, bool b, bool c, bool d) => ((!(a && b)) || (c || d));

bool gepQFF7B(bool a, bool b, bool c, bool d) =>
    ((a || (!(c))) || ((!(b && d)) && (b || d)));

bool gepQFFF6(bool a, bool b, bool c, bool d) =>
    (a || (b || ((!(c && d)) && (c || d))));

bool gepQFFFB(bool a, bool b, bool c, bool d) => ((a || b) || ((!(c)) || d));
