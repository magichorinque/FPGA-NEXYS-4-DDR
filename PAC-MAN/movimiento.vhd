library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;


entity movimiento is
    Port ( axys : in  STD_LOGIC_VECTOR (7 downto 0);
           up : out  STD_LOGIC;
           down : out  STD_LOGIC);
end movimiento;

architecture Behavioral of movimiento is

begin


process(axys)
begin

if(axys < 80) then

Up <= '0';
down <= '1';

elsif (axys > 140) then

Up <= '1';
down <= '0';

else  

Up <= '0';
down <= '0';

end if;

end process;


end Behavioral;

