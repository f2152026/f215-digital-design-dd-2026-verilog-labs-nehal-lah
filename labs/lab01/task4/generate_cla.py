for k in range(1, 65):
    terms = []

    terms.append(f"g[{k-1}]")

    for j in range(k - 1, 0, -1):
        p_terms = " & ".join(
            f"p[{i}]" for i in range(k - 1, j - 1, -1)
        )
        terms.append(f"({p_terms} & g[{j-1}])")

    p_terms = " & ".join(
        f"p[{i}]" for i in range(k - 1, -1, -1)
    )
    terms.append(f"({p_terms} & cin)")

    print(f"  assign #(2) c[{k}] =")
    print("    " + " |\n    ".join(terms) + ";")
    print()