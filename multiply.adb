-- Name: Shawn Kaplan
-- ID: 0966499
-- Email: skaplan@uoguelph.ca
--
-- This program prompts the user for 2 integers and multiplies
-- them using both interative and recursive functions following
-- the Russian Peasant Multiplication algorithm. The runtime
-- of each function is measured and printed with the results.

with Ada.Text_IO; use Ada.Text_IO;
with Ada.Long_Integer_Text_IO; use Ada.Long_Integer_Text_IO;
with Ada.Calendar; use Ada.Calendar;

procedure Multiply is
    a, b, recurAns, iterAns : long_integer;
    recurStartTime, recurEndTime, iterStartTime, iterEndTime : Time;


function recur(a,b : long_integer) return long_integer is
begin
    if a = 0 then
        return 0;
    end if;
    
    if a = 1 then
        return b;
    end if;
    
    if a > 1 and a rem 2 = 0 then
        return recur(a / 2, b + b);
    end if;
    
    if a > 1 and a rem 2 = 1 then
        return b + recur(a / 2, b + b);
    end if;
    return 0;
end recur;


function nonrecur(a,b : long_integer) return long_integer is
    result : long_integer := 0;
    x : long_integer := a;
    y : long_integer := b;
begin
    if a = 0 then
        return 0;
    end if;
    
    if a = 1 then
        return b;
    end if;
    
    while (y > 0) loop
        if (y rem 2 /= 0) then
            result := result + x;
        end if;
        x := x * 2;
        y := y / 2;
    end loop;

    return result;
end nonrecur;


begin
    -- Get multiplier and multiplicand
    put("Enter multiplier: ");
    get(a);
    put("Enter multiplicand: ");
    get(b);
    new_line;
    
    -- Time recursive multiplication
    recurStartTime := Clock;
    recurAns := recur(a, b);
    recurEndTime := Clock;
    
    -- Time iterative multiplication
    iterStartTime := Clock;
    iterAns := nonRecur(a, b);
    iterEndTime := Clock;
    
    -- Print answers and runtimes
    put_line("Recursive product: " & Long_Integer'Image(recurAns));
    put_line("Nonrecursive product: " & Long_Integer'Image(iterAns));
    new_line;
    put_line("Recursive runtime: " & Duration'Image((recurEndTime - recurStartTime) * 1000) & " ms");
    put_line("Nonrecursive runtime: " & Duration'Image((iterEndTime - iterStartTime) * 1000) & " ms");
    
end Multiply;
