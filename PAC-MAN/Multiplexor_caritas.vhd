library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Multiplexor_caritas is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           B,c : in  STD_LOGIC_VECTOR (3 downto 0);
           S : out  STD_LOGIC_VECTOR (3 downto 0);
           sel1,sel2 : in  STD_LOGIC);
end Multiplexor_caritas;

architecture Behavioral of Multiplexor_caritas is

begin

process(A,B,sel1,sel2,c)
begin

if(sel1 = '1') then 
s<=a;
elsif (sel2 = '1') then
s<=b;
else 
s<=c;
end if;
end process;

end Behavioral; 

