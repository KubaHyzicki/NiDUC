function [Vec] = decoder (Vec)
  for i=1:(length(Vec))
    if Vec(i)>0.5
      Vec(i)=1;
    else
      Vec(i)=0;
    end
  end
endfunction
%funkcja alternatywnie może zwracać albo wektor poprawności ramek(corr) albo wektor po usunięciu bitów parzystości(VecOrig)