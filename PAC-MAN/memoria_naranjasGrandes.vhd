library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity memoria_naranjasGrandes is
    Port ( CV : in  STD_LOGIC_VECTOR (9 downto 0);
           CH : in  STD_LOGIC_VECTOR (9 downto 0);
			  rst : in  STD_LOGIC;
           S : out  STD_LOGIC_VECTOR (3 downto 0));
end memoria_naranjasGrandes;

architecture Behavioral of memoria_naranjasGrandes is

begin

process (CV,CH,rst) 
begin
if (CV = "0001000000" and CH = "0001111000") then 
s(0) <= '0';
end if;

if (CV = "0101100000" and CH = "0001111000") then 
s(1) <= '0';
end if;

if (CV = "0001000000" and CH = "1000001000") then 
s(2) <= '0';
end if;

if (CV = "0101100000" and CH = "1000001000") then 
s(3) <= '0';
end if;
if (rst = '0') then 
s <= "1111";
end if;
end process;

end Behavioral;

