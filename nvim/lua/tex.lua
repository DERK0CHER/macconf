-- ~/.config/nvim/lua/snippets/tex.lua
local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

return {
  s("enum", fmt([[
\begin{enumerate}[label=(\roman*)]
  \item {}
\end{enumerate}
{}
]], { i(1), i(0) })),
  
  s("item", fmt("\\item {}", { i(0) })),
  
  s("equation", fmt([[
\begin{equation}\label{{{}}}
  {}
\end{equation}
{}
]], { i(1), i(2), i(0) })),
  
  s("eq", fmt([[
\begin{equation*}
\begin{split}
  {}
  = \; & {}
\end{split}
\end{equation*}
{}
]], { i(1), i(2), i(0) })),
  
  s("fraction", fmt("\\frac{{{}}}{{{}}}{}", { i(1), i(2), i(0) })),
  
  s("upper", fmt("^{{{}}}{}", { i(1), i(0) })),
  
  s("lower", fmt("_{{{}}}{}", { i(1), i(0) })),
  
  s("math", fmt("$${}$${}", { i(1), i(0) })),
  
  s("integral", fmt("\\int^{{{}}}_{{{}}} {} \\, d{}", { i(1), i(2), i(3), i(0) })),
  
  s("text", fmt("\\; \\text{{ {} }} \\; {}", { i(1), i(0) })),
  
  s("braces", fmt("\\{{ {} \\}} {}", { i(1), i(0) })),
  
  s("cal", fmt("\\mathcal{{{}}}{}", { i(1), i(0) })),
  
  s("xrightarrow", fmt("\\xrightarrow{{{}}}{}", { i(1), i(0) })),
  
  s("root", fmt("\\sqrt{{{}}}{}", { i(1), i(0) })),
  
  s("parentheses", fmt("({}){}", { i(1), i(0) })),
  
  s("proof", fmt([[
\begin{proof}
  {}
\end{proof}
]], { i(0) })),
  
  s("equivalence", t("\\Longleftrightarrow")),
  
  s("rightarrow", t("\\longrightarrow")),
  
  s("overset", fmt("\\overset{{{}}}{{{}}}{}", { i(1), i(2), i(0) })),
  
  s("dafds", fmt([[
\left\{
\begin{matrix*}[l]
  {} & \;\text{{{}}}\; & {} \\
  {} & \;\text{{{}}}\; & {} \\
\end{matrix*}
\right.
{}
]], { i(1), i(2), i(3), i(4), i(5), i(0) })),
  
  s("lim", fmt("\\lim_{{{} \\to {}}}{}", { i(1), i(2), i(0) })),
  
  s("mbrace", fmt("{{{}}}{}", { i(1), i(0) })),
  
  s("prime", fmt("\\prime {}", { i(0) })),
  
  s("wedg", t("\\; \\wedge \\; ")),
  
  s("vert", fmt("\\vert {} \\vert {}", { i(1), i(0) })),
  
  s("Vert", fmt("\\Vert {} \\Vert{}", { i(1), i(0) })),
  
  s("fa", t("\\; \\forall \\; ")),
  
  s("ex", t("\\; \\exists \\; ")),
  
  s("impl", fmt(" \\Longrightarrow {}", { i(0) })),
  
  s("bino", fmt([[
\left( \begin{matrix}
  {} \\ {}
\end{matrix}\right) {}
]], { i(1), i(2), i(0) })),
  
  s("such", t("\\; : \\; ")),
  
  s("ov", fmt("\\overline{{{}}}{}", { i(1), i(0) })),
  
  s("quad", t("\\quad")),
  
  s("under", fmt("\\underline{{{}}} {}", { i(1), i(0) })),
  
  s("setm", fmt("\\setminus \\{{ {} \\}} {}", { i(1), i(0) })),
  
  s("new", t("\\\\\n= \\; & ")),
  
  s("beg", fmt([[
\begin{{{}}}
  {}
\end{{{}}}
{}
]], { i(1), i(3), i(2), i(0) })),
  
  s("bar", fmt("\\bar{{{}}}{}", { i(1), i(0) })),
  
  s("par", t("\\partial")),
  
  s("bra", fmt("[ {} ]{}", { i(1), i(0) })),
  
  s("al", t("\\alpha ")),
  
  s("be", t("\\beta")),
  
  s("ga", t("\\gamma")),
  
  s("de", t("\\delta")),
  
  s("ep", t("\\varepsilon")),
  
  s("ze", t("\\zeta")),
  
  s("et", t("\\eta")),
  
  s("te", t("\\theta ")),
  
  s("ka", t("\\kappa")),
  
  s("la", t("\\lambda")),
  
  s("split", fmt([[
\begin{split}
  {}
  = &
  {}
\end{split}
{}
]], { i(1), i(2), i(0) })),
}
