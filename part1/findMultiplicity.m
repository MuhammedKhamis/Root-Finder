function multiplicity = findMultiplicity(f,root,eps)
    count = 1;
    f = diff(f);
    while(abs(subs(f,root))  <= eps)
        f = diff(f);
        count = count + 1;
    end
    multiplicity = count;
end
