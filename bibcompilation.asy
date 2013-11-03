settings.tex = "xelatex";
usepackage("xcolor");
usepackage("listings");
texpreamble("\lstset{basicstyle=\ttfamily\color{blue!50!black}}");
texpreamble("\lstdefinestyle{cli}{basicstyle=\ttfamily\color{black}}");

real u = 1.5cm;
pair o = (0,0);
pair x = (2.5u,0);
pair y = (0,-0.6u);
object tex = draw("\lstinline|.tex|", box, o, filltype=Draw);
object aux1 = draw("\lstinline|.aux|", roundbox, o+x, filltype=Draw);
object aux2 = draw("\lstinline|.aux|", roundbox, o+3*x+2*y, filltype=Draw);
object bib = draw("\lstinline|.bib|", box, o+x+y, filltype=Draw);
object bst = draw("\lstinline|.bst|", box, o+x+2*y, filltype=Draw);
object bbl = draw("\lstinline|.bbl|", roundbox, o+2*x+y, filltype=Draw);
object pdf1 = draw("\lstinline|.pdf|", roundbox, o+x-y, filltype=Draw);
object pdf3 = draw("\lstinline|.pdf|", roundbox, o+3*x+y, filltype=Draw);
object pdf4 = draw("\lstinline|.pdf|", ellipse, o+4*x+3*y, filltype=Draw);


add(new void(picture pic, transform t) {
    pair d = (0.3u,0);
    pair tex_o = point(tex, E, t);
    pair aux1_i = point(aux1, W, t);
    pair pdf1_i = point(pdf1, W, t);
    pair out1 = tex_o + d;
    pair in1 = aux1_i - d;
    draw(pic, point(tex, E, t) -- out1);
    draw(pic, "\lstinline[style=cli]|xelatex|", out1 -- in1, N);
    draw(pic, in1 {up} .. {right} pdf1_i, Arrow);
    draw(pic, in1 {right} .. {right} aux1_i, Arrow);
    dot(pic, in1);

    pair bst_o = point(bst, E, t);
    pair bib_o = point(bib, E, t);
    pair bbl_i = point(bbl, W, t);
    pair out2 = point(bib, E, t) + d;
    pair in2 = point(bbl, W, t) - d;
    dot(pic, out2);
    draw(pic, point(aux1, ESE, t) {right} .. {down} out2);
    draw(pic, bib_o {right} .. {right} out2);
    draw(pic, bst_o {right} .. {up} out2);
    draw(pic, "\lstinline[style=cli]|bibtex|", out2 -- in2, N);
    draw(pic, in2 -- bbl_i, Arrow);

    pair bbl_o = point(bbl, E, t);
    pair pdf3_i = point(pdf3, W, t);
    pair aux2_i = point(aux2, W, t);
    pair out3 = bbl_o+d+y;
    pair in3 = aux2_i - d;
    draw(pic, point(aux1, ENE, t) {right} .. {down} out3);
    draw(pic, point(bbl, SSE, t) {down} .. {right} out3);
    draw(pic, point(tex, SSE, t) {dir(-45)} .. {dir(45)} out3);
    draw(pic, "\lstinline[style=cli]|xelatex|", out3 -- in3, N);
    draw(pic, in3 {up} .. {right} pdf3_i, Arrow);
    draw(pic, in3 {right} .. {right} aux2_i, Arrow);
    dot(pic, out3);
    dot(pic, in3);

    pair aux2_o = point(aux2, E, t);
    pair pdf4_i = point(pdf4, W, t);
    pair out4 = aux2_o + d + y;
    pair in4 = pdf4_i - d;
    draw(pic, aux2_o {right} .. {down} out4);
    draw(pic, point(bbl, S, t) {down} .. {right} out4);
    draw(pic, point(tex, S, t) {dir(-45)} .. {dir(45)} out4);
    draw(pic, "\lstinline[style=cli]|xelatex|", out4 -- in4, N);
    draw(pic, in4 -- pdf4_i, Arrow);
    dot(pic, out4);
});
