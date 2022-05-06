library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity multiplexor is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : in  STD_LOGIC_VECTOR (3 downto 0);
           S : in  STD_LOGIC;
           Salida : out  STD_LOGIC_VECTOR (3 downto 0));
end multiplexor;

architecture Behavioral of multiplexor is

begin
process (S,B,A)
begin
if (s = '1') then 
	Salida <= B;
else
	Salida <= A;
end if;
end process;
end Behavioral;

